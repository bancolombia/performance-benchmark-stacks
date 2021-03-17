[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

## About The Project

The project objective is to allow executing repeatable performance tests in different technical stacks. This project is
mainly designed to be executed on an AWS account, however the stacks scenarios are developed and designed to run in
Docker.

## Getting Started

### Prerequisites

To run this project you need:

* `aws-cli` and an AWS account
* `nodejs` for reports
* `terminal` or emulator with ssh for remote connections

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/bancolombia/performance-benchmark-stacks
   cd performance-benchmark-stacks
   ```
2. Install NPM packages for reports
   ```sh
   cd reports/front
   npm install
   ```
3. Build your configuration in `config.json`
   ```sh
   cp .config.json config.json
   ```
   ```json
   {
    "instance": "t2.micro", # AWS instance type
    "key": "reactive", # Instance private key name, if name is `reactive` the key file should be in root of this project with `reactive.pem` name. 
    "securityGroup": "sg-00000000000000000", # Security group for your instances, should allow requests to the 8080 port
    "subnet": "subnet-00000000000000000",
    "amiUser": "ubuntu", # default user of the ami
    "ami": "ami-03d315ad33b9d49c4", # ami id, if you want to change it, you should change the docker installation file, located in the infra folder
    "benchRepo": "https://github.com/bancolombia/performance-benchmark-stacks.git",
    "perfImage": "bancolombia/distributed-performance-analyzer:0.2.1"
   }
   ```

## Usage

In the start_all.sh script you can change the scenarios and stacks array what you want to run, this script will run the
start.sh script with each stack and list of desired scenarios. The start.sh script will create two instances, first one
will be the instance where the stack will be deployed, the second one will be the performance instance.

The performance tool is the [distributed performance analyzer](https://github.com/bancolombia/distributed-performance-analyzer) project, also available as docker image at [dockerhub](https://hub.docker.com/repository/docker/bancolombia/distributed-performance-analyzer).

Then it will run every scenario on the stack and will download the results in the .tmp/results folder.

The results will be visualized as graphs.

Run performance tests:

```shell
./start_all.sh
```

## Roadmap

See the [open issues](https://github.com/bancolombia/performance-benchmark-stacks/issues) for a list of proposed
features (and known issues).

## Contributing

Any contributions you make are **greatly appreciated**.

Please see [the contribution guide](https://github.com/bancolombia/performance-benchmark-stacks/wiki/Contributing)

## License

Distributed under the MIT License. See `LICENSE` for more information.

[contributors-shield]: https://img.shields.io/github/contributors/bancolombia/performance-benchmark-stacks.svg?style=for-the-badge

[contributors-url]: https://github.com/bancolombia/performance-benchmark-stacks/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/bancolombia/performance-benchmark-stacks.svg?style=for-the-badge

[forks-url]: https://github.com/bancolombia/performance-benchmark-stacks/network/members

[stars-shield]: https://img.shields.io/github/stars/bancolombia/performance-benchmark-stacks.svg?style=for-the-badge

[stars-url]: https://github.com/bancolombia/performance-benchmark-stacks/stargazers

[issues-shield]: https://img.shields.io/github/issues/bancolombia/performance-benchmark-stacks.svg?style=for-the-badge

[issues-url]: https://github.com/bancolombia/performance-benchmark-stacks/issues

[license-shield]: https://img.shields.io/github/license/bancolombia/performance-benchmark-stacks.svg?style=for-the-badge

[license-url]: https://github.com/bancolombia/performance-benchmark-stacks/blob/main/LICENSE
