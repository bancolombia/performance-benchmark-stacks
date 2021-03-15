#!/bin/bash

ids=()

for entry in ".tmp"/*.json; do
  instance_id=$(jq -r '.Instances[0].InstanceId' "$entry")
  echo "$instance_id"
  ids+=("$instance_id")
done

echo "Terminating instances ${ids[@]}"
aws ec2 terminate-instances --instance-ids "${ids[@]}"
aws ec2 wait instance-terminated --instance-ids "${ids[@]}"
echo "Instances terminated!"
