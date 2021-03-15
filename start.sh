#!/bin/bash
set -e

# Params
stack=$1
stack_dash=${stack/\//-}
scenarios=("$@")
unset "scenarios[0]"

# Setup properties
mkdir -p .tmp/results .tmp/scenarios
rm -rf .tmp/results/* .tmp/scenarios/*
instance=$(jq -r '.instance' config.json)
key=$(jq -r '.key' config.json)
sg=$(jq -r '.securityGroup' config.json)
subnet=$(jq -r '.subnet' config.json)
ami=$(jq -r '.ami' config.json)
ami_user=$(jq -r '.amiUser' config.json)
bench_repo=$(jq -r '.benchRepo' config.json)
perf_repo=$(jq -r '.perfRepo' config.json)

createInstance() {
  local name=$1
  local type=$2
  echo "Creating $name instance ..." >/dev/tty
  local state=0

  if [ -f ".tmp/$name.json" ]; then
    instance_id=$(jq -r '.Instances[0].InstanceId' ".tmp/$name.json")
    echo "Checking existing $name instance $instance_id ..." >/dev/tty
    state=$(aws ec2 describe-instances --instance-ids "$instance_id" | jq -r '.Reservations[].Instances[].State.Name')
    echo "State code $state" >/dev/tty
  fi

  if [ "$state" != "running" ]; then
    aws ec2 run-instances --image-id "$ami" \
      --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=benchkmks-$name}]" \
      --count 1 --instance-type "$type" --key-name "$key" \
      --security-group-ids "$sg" \
      --subnet-id "$subnet" \
      --user-data file://infra/install_docker.sh >".tmp/$name.json"

    instance_id=$(jq -r '.Instances[0].InstanceId' ".tmp/$name.json")
    echo "Instance $instance_id created!" >/dev/tty
  fi

  echo "$instance_id"
  return 0
}

getInstanceIp() {
  local instance_id=$1

  echo "Resolving ip for instance $instance_id" >/dev/tty
  instance_ip=$(aws ec2 describe-instances --instance-ids "$instance_id" | jq -r '.Reservations[].Instances[].PublicIpAddress')
  echo "Resolved ip $instance_ip" >/dev/tty
  echo "$instance_ip"
  return 0
}

runRemoteCommand() {
  local ip=$1
  local command=$2

  echo "Running $command on $ip"
  out=$(ssh -o "StrictHostKeyChecking no" -i "$key.pem" "$ami_user@$ip" "$command")
  echo "$out"
  return 0
}

copyRemote() {
  local ip=$1
  local file=$2
  local path=$3

  echo "Copying $file on $ip"
  out=$(scp -o "StrictHostKeyChecking no" -i "$key.pem" "$file" "$ami_user@$ip:$path")
  echo "$out"
  return 0
}

copyFromRemote() {
  local ip=$1
  local path=$2
  local file=$3

  echo "Downloading $file from $path on $ip"
  out=$(scp -o "StrictHostKeyChecking no" -i "$key.pem" "$ami_user@$ip:$path" "$file")
  echo "$out"
  return 0
}

waitInitialized() {
  local ip=$1
  local cmd="until [ -f /var/lib/cloud/instance/boot-finished ]; do echo 'waitting'; sleep 5; done"

  waitForTcp "$ip" 22

  runRemoteCommand "$ip" "$cmd"
  echo "User data initialized in instance with ip $ip"
}

waitForTcp() {
  local ip=$1
  local port=$2
  while ! nc -z "$ip" "$port"; do echo "Waiting for $ip on $port" && sleep 2; done
}

waitForUrl() {
  echo "Testing $1"
  timeout -s TERM 45 bash -c \
    'while [[ "$(curl -s -o /dev/null -L -w ''%{http_code}'' ${0})" != "200" ]];\
    do echo "Waiting for ${0}" && sleep 2;\
    done' ${1}
  echo "OK!"
  curl -I $1
}

cloneRepo() {
  local ip=$1
  local url=$2
  local repo=$(basename "$url")
  local directory=${repo%.*}
  local cmd="if [ ! -d $directory ]; then git clone $url; else cd $directory; git pull; fi"

  runRemoteCommand "$ip" "$cmd"
}

startStack() {
  local ip=$1
  local stack=$2

  runRemoteCommand "$ip" "./performance-benchmark-stacks/start_stack.sh $stack"
}

#Start stack and performance instances

app_instance=$(createInstance "$stack_dash-app" "$instance")
perf_instance=$(createInstance "$stack_dash-perf" "$instance")

echo "Waiting for $app_instance and $perf_instance instances ready ..."
aws ec2 wait instance-running --instance-ids "$app_instance" "$perf_instance"
sleep 10

echo "Instances ready!"

# Setup stack
app_ip=$(getInstanceIp "$app_instance")

waitInitialized "$app_ip"
runRemoteCommand "$app_ip" "docker -v"
cloneRepo "$app_ip" "$bench_repo"

#Start performance instance

# Setup perf
perf_ip=$(getInstanceIp "$perf_instance")

waitInitialized "$perf_ip"
runRemoteCommand "$perf_ip" "docker -v"
cloneRepo "$perf_ip" "$perf_repo"

startScenario() {
  local scenario=$1

  runRemoteCommand "$perf_ip" "docker -v"
  # start perf test
  # replace ip
  cp "test-scenarios/$scenario.exs" ".tmp/scenarios/$stack_dash-$scenario.exs"
  sed -i "s/ip/$app_ip/g" ".tmp/scenarios/$stack_dash-$scenario.exs"
  # copying scenario
  copyRemote "$perf_ip" ".tmp/scenarios/$stack_dash-$scenario.exs" "distributed-performance-analyzer/config/prod.exs"
  # run performance tests
  runRemoteCommand "$perf_ip" "docker build -t dpa distributed-performance-analyzer && docker run -v \$(pwd)/:/app/result/ dpa"
  # download results
  copyFromRemote "$perf_ip" "result.csv" ".tmp/results/$scenario|$stack_dash.csv"
}

# start stack
startStack "$app_ip" "$stack"

for scenario in "${scenarios[@]}"; do
  runRemoteCommand "$app_ip" "docker restart stack"
  waitForUrl "http://$app_ip:8080/status"
  echo "Starting $scenario on the stack $stack"
  startScenario "$scenario"
done
echo "Terminating instances ..."
aws ec2 terminate-instances --instance-ids "$app_instance" "$perf_instance"
aws ec2 wait instance-terminated --instance-ids "$app_instance" "$perf_instance"
echo "Instances terminated!"
