# Docker Compose for Harness CD Community Edition
This page contains the instructions to run Harness CD Community Edition using Docker Compose.  The steps below use Docker Desktop for simplicity but can be used on any VM running docker and docker-compose.

## Pre-requisites
1) Install [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) on your laptop or VM.

## Hardware requirements
* 2 CPUs or more
* 3GB of free memory
* 20GB of free disk space
* Internet connection

## Start Harness CD

[![Harness Community CD - Docker Compose Installer](../../../static/docker-compose-thumbnail.jpg)](https://youtu.be/9geWy17iyrE "Harness Community CD - Docker Compose Installer")  

1) If you are running on Windows or Mac, increase Docker Desktop memory and CPU by the numbers listed above. See [Docker for Mac](https://docs.docker.com/docker-for-mac/#resources) or [Docker for Windows](https://docs.docker.com/docker-for-windows/#resources) for details on increasing resources.
2) Clone this repo.
   ```shell
   git clone https://github.com/harness/harness-cd-community.git
   cd harness-cd-community/docker-compose/harness
   ```
3) If you are running Docker Desktop on Windows or Mac skip this step. If you are running on Linux or wish to run a production install then please see [Advanced Configuration](#advanced-configuration) to set the hostname of your machine.
4) Start Harness CD.
   ```shell
   docker-compose up -d
   ```
   If this is your first time running the above command, then the docker images used in the docker-compose.yml file will now be pulled from DockerHub.
5) Wait for startup to complete.
   ```shell
   docker-compose run --rm proxy wait-for-it.sh ng-manager:7090 -t 180
   ```

6) Check if all the processes are up and in running state - 
   ```shell
   docker-compose ps
   ```


## Use Harness CD
1) Open http://localhost/#/signup and complete the registration form. Now your Harness CD account along with the first (admin) user is created. If you have already completed this step, then login to Harness CD at http://localhost/#/signin
2) Follow the Harness CD Community Edition [quickstart](https://ngdocs.harness.io/article/ltvkgcwpum-harness-community-edition-quickstart)

## Troubleshooting
If you run into issues when installing Harness this section will help identify where the issue is.
##### View running processes
```shell
docker-compose ps
```
##### View logs of processes
```shell
docker-compose logs -f <NAME>
```
For example,
```shell
docker-compose logs -f manager
```


## Support 
[Join the Harness Community Slack](https://join.slack.com/t/harnesscommunity/shared_invite/zt-y4hdqh7p-RVuEQyIl5Hcx4Ck8VCvzBw)
[Join the Harness Community Forum](https://community.harness.io/) 

## Profiles
Harness CD Community Edition supports multiple hardware profiles. The default profile is `laptop` for low resource environments. There is also a `production` profile available for use in more demanding environments.

To run the `production` profile use this startup command
```shell
docker-compose -f docker-compose.yml -f profile-production.yml up -d
```

## Stop Harness CD
```shell
docker-compose down
```

## Remove Harness CD
To uninstall your instance of Harness CD run the following command. The `-v` option deletes the docker volumes where the Harness CD data is stored.
```shell
docker-compose down -v
```
To also remove the Harness docker images from your system run
```shell
docker images --filter=reference='harness/*' --quiet | xargs docker rmi
```

## Upgrade Harness CD 
1) Update this repository.
   ```shell
   git pull
   ```
2) Pull any new images that may have been published.
   ```shell
   docker-compose pull
   ```
3) Re-run docker compose.
   ```shell
   docker-compose up -d
   ```

## Advanced Configuration
### How to deploy the Harness to a separate environment
You simply need to set the `HARNESS_HOST` environment variable. This should be the IP address or hostname of the machine where you are deploying Harness. You cannot use **localhost** for this variable.  
   Example,
   ```shell
   export HARNESS_HOST="192.168.0.1"
   ```
