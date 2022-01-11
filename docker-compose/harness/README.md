# Harness Community Edition - Docker Compose
This page contains the instructions necessary to run Harness CE using Docker Compose.

## Pre-requisites
1) Install [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) on your system

## Hardware requirements
* 4 CPUs or more
* 4GB of free memory
* 20GB of free disk space
* Internet connection

## Installing Harness
1) Increase Docker Desktop memory to 4GB and CPU to 4  
   For Docker Desktop, see [Docker for Mac](https://docs.docker.com/docker-for-mac/#resources) or [Docker for Windows](https://docs.docker.com/docker-for-windows/#resources) for details on increasing resources
1) Clone this repo
   ```shell
   git clone https://github.com/harness/harness-cd-community.git
   cd harness-cd-community/docker-compose/harness
   ```
1) If you are running Docker Desktop on Windows or Mac skip this step. If you are running on Linux or wish to run a production install then please see [Advanced Configuration](#advanced-configuration) to set the hostname of your machine.
1) Start harness
   ```shell
   docker-compose up -d
   ```
1) Wait for startup to complete
   ```shell
   docker-compose run --rm proxy wait-for-it.sh ng-manager:7090 -t 180
   ```

## Using Harness
1) Open http://localhost/#/signup
1) Complete the signup form
1) You need to install a Harness delegate before you can run pipelines, see [Install a Docker Delegate](https://ngdocs.harness.io/article/cya29w2b99-install-a-docker-delegate)
1) For help with getting started, read the Harness [documentation](https://ngdocs.harness.io/article/u8lgzsi7b3-quickstarts)

## Profiles
Harness supports multiple hardware profiles the default profile being `laptop` for low resource environments 
and `production` for use in more demanding environments.

To run the `production` profile use this startup command
```shell
docker-compose -f docker-compose.yml -f profile-production.yml up -d
```

## Stop Harness
```shell
docker-compose down
```

## Remove Harness
```shell
docker-compose down -v
```

## Upgrading an existing Harness Installation
1) Update this repository
   ```shell
   git pull
   ```
2) Re-run docker compose
   ```shell
   docker-compose up -d
   ```

## Advanced Configuration
### How to deploy the Harness Delegate to a separate environment
You simply need to set the `HARNESS_HOST` environment variable, see [Set hostname environment variable](#set-hostname-environment-variable) below.
### Set hostname environment variable
1) Set the `HARNESS_HOST` environment variable, this should be the IP address or hostname of the machine where you are deploying Harness. You cannot use `localhost`.  
   Example,
   ```shell
   export HARNESS_HOST="192.168.0.1"
   ```
