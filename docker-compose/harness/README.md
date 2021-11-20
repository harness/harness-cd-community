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
   git clone git@github.com:wings-software/harness-cd-community.git
   cd harness-cd-community/docker-compose/harness
   ```
1) Set the `PUBLIC_IP` environment variable, this is the IP address of your machine  
   Example,
   ```shell
   export PUBLIC_IP="192.168.0.1"
   ```
1) Start harness
   ```shell
   docker-compose up -d
   ```
1) Wait for startup to complete
   ```shell
   docker-compose run --rm proxy wait-for-it.sh ng-manager:7090 -t 900
   ```

## Using Harness
1) To get the link to your instance of Harness run
   ```shell
   echo "http://${PUBLIC_IP}/#/signup"
   ```
1) Open the printed link and complete the signup form
1) Follow the [documentation](https://docs.harness.io/category/3err8eu6x3-account) for using Harness

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
   docker compose up -d
   ```

## Airgapped installation
The above scripts will require connectivity to Dockerhub. In case connectivity to Dockerhub is not available, you can follow the steps as below
1) Use the script *download_images.sh* to download the docker images. 
2) You can then tar this entire folder and copy it to the target VM
3) Use the script *unpack_images.sh* to load the images onto the VM. 
4) Use the *start.sh* script to start Harness.
