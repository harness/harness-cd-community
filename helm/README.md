# Harness Community Edition - Helm
This page contains the instructions necessary to run Harness CE using Helm on your Kubernetes cluster.

## Pre-requisites
1) Install [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
1) Install [Docker](https://docs.docker.com/engine/install/)
1) Install [minikube](https://minikube.sigs.k8s.io/docs/start/)
1) Install [Helm](https://helm.sh/docs/intro/quickstart/)

## Hardware requirements
* 4 CPUs or more
* 4GB of free memory
* 20GB of free disk space
* Internet connection

## Starting Harness
1) Start by cloning this repo
   ```shell
   git clone https://github.com/harness/harness-cd-community.git
   cd harness-cd-community/helm
   ```
1) Start minikube
   ```shell
   minikube start --memory 4g --cpus 4
   ```
1) If you are running Docker Desktop on Windows or Mac skip this step. If you are running on Linux or wish to run a production install then please see [Advanced Configuration](#advanced-configuration) to set the hostname of your machine.
1) Start Harness
   ```shell
   helm install harness ./harness --create-namespace --namespace harness
   ```

## Using Harness
1) Follow the notes printed by Helm to access the application
1) Open the link which is displayed and complete the signup form
1) You need to install a Harness delegate before you can run pipelines, see [Install a Kubernetes Delegate](https://ngdocs.harness.io/article/f9bd10b3nj-install-a-kubernetes-delegate)
1) For help with getting started, read the Harness [documentation](https://ngdocs.harness.io/article/u8lgzsi7b3-quickstarts)

## Profiles
Harness supports multiple hardware profiles the default profile being `laptop` for low resource environments
and`production` for use in more demanding environments.

To run the `production` profile use this startup command
```shell
helm install -f harness/values-production.yaml harness ./harness --create-namespace --namespace harness
```

## Remove Harness
```shell
helm uninstall harness
```

## Advanced Configuration
### How to deploy the Harness Delegate to a separate environment
You simply need to set the `harness_host` configuration parameter, see [Set hostname configuration parameter](#set-hostname-configuration-parameter) below.
### Set hostname configuration parameter
1) Set the `harness_host` configuration parameter, this should be the IP address or hostname of the machine where you are deploying Harness. You **cannot** use `localhost`.  
   Open values.yaml in your editor and update the `harness_host` parameter.
