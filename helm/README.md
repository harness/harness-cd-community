# Harness Community Edition - Helm
This page contains the instructions necessary to run Harness CE using Helm on your Kubernetes cluster.

## Pre-requisites
1) Install [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
1) Install [Docker](https://docs.docker.com/engine/install/)
1) Install [minikube](https://minikube.sigs.k8s.io/docs/start/)
1) Install [Helm](https://helm.sh/docs/intro/quickstart/)

## Hardware requirements
* 4 CPUs or more
* 12GB of free memory
* 20GB of free disk space
* Internet connection

## Starting Harness
1) Start by cloning this repo
   ```shell
   git clone git@github.com:harness/harness-cd-community.git
   cd harness-cd-community/helm
   ```
1) Start minikube
   ```shell
   minikube start --memory 8g --cpus 4
   ```
1) Start Harness
   ```shell
   helm install harness ./harness --create-namespace --namespace harness
   ```

## Using Harness
1) Follow the notes printed by Helm to access the application
1) Open the link which is displayed and complete the signup form
1) You need to install a Harness delegate before you can run pipelines, see [Install a Kubernetes Delegate](https://ngdocs.harness.io/article/f9bd10b3nj-install-a-kubernetes-delegate)
1) Follow the [documentation](https://ngdocs.harness.io/article/u8lgzsi7b3-quickstarts) for using Harness

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
