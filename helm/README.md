# Helm Chart for Harness CD Community Edition
This page contains the instructions necessary to install and manage Harness CD Community Edition using a helm-chart. The steps below use minikube for simplicity but can be used any Kubernetes cluster.

## Pre-requisites
1) Install [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
1) Install [Docker](https://docs.docker.com/engine/install/)
1) Install [minikube](https://minikube.sigs.k8s.io/docs/start/)
1) Install [Helm](https://helm.sh/docs/intro/quickstart/)

## Hardware requirements
* 2 CPUs or more
* 3GB of free memory
* 20GB of free disk space
* Internet connection

## Start Harness CD

[![Harness Community CD - Helm Installer](../../../static/helm-thumbnail.jpg)](https://youtu.be/o2Xz8A3RqO8 "Harness Community CD - Helm Installer") 

1) Start by cloning this repo.
   ```shell
   git clone https://github.com/harness/harness-cd-community.git
   cd harness-cd-community/helm
   ```
1) Start minikube with slightly higher memory and cpu so that you can also deploy a workload into the same Kubernetes cluster.
   ```shell
   minikube start --memory 4g --cpus 4
   ```
1) If you are running Docker Desktop on Windows or Mac skip this step. If you are running on Linux or wish to run a production install then please see [Advanced Configuration](#advanced-configuration) to set the hostname of your machine.
1) Start Harness CD using the helm-chart
   ```shell
   helm install harness ./harness --create-namespace --namespace harness
   ```   
## Use Harness CD
1) Follow the notes printed by Helm to access the application. 
You should wait for the harness-cd application to start before moving to Step 2.
```shell
 kubectl wait --namespace harness --timeout 900s --selector app=proxy --for condition=Ready pods
```

You can also use the following commands to check status.
```shell
kubectl get pods -n harness
kubectl get services -n harness
```
2) Open the link which is displayed and complete the registration form at `<URL>/signup`. Now your Harness CD account along with the first (admin) user is created. If you have already completed this step, then login to Harness CD at `<URL>/signin`.
3) Follow the Harness CD Community Edition [quickstart](https://ngdocs.harness.io/article/ltvkgcwpum-harness-community-edition-quickstart)

## Troubleshooting
If you run into issues when installing Harness this section will help identify where the issue is.
##### View running processes
```shell
kubectl get pods -n harness
```
##### View logs of processes
```shell
kubectl logs -n harness -f <POD-NAME>
```
---
You may also run into a situation where the namespace `harness` is already present. 

Check if namespace `harness` is already present 
```shell 
kubectl get namespaces
```

In that case you may delete the old namespace using - 

```shell
kubectl delete ns harness
```
and run the following installation again - 
```shell 
helm install harness ./harness --create-namespace --namespace harness
```

---

In case the connection is refused, and you get a similar error message as mentioned below - 

```
The connection to the server 0.0.0.0:58909 was refused - did you specify the right host or port?
```

Make sure minikube is up and running through docker dashboard or using the following command
```shell
minikube status [flags]
```


## Support  
For any further blockers, doubts -  
[Join the Harness Community Slack](https://join.slack.com/t/harnesscommunity/shared_invite/zt-y4hdqh7p-RVuEQyIl5Hcx4Ck8VCvzBw)  
and    
[Join the Harness Community Forum](https://community.harness.io/)

## Profiles
Harness CD Community Edition supports multiple hardware profiles. The default profile is `laptop` for low resource environments. There is also a `production` profile available for use in more demanding environments.

To run the `production` profile use this startup command
```shell
helm install -f harness/values-production.yaml harness ./harness --create-namespace --namespace harness
```

## Remove Harness CD
```shell
helm uninstall harness -n harness
```

You can even delete the harness namespace altogether.
```shell
kubectl delete namespace harness
```

## Advanced Configuration
### How to deploy the Harness to a separate environment
You simply need to set the `harness_host` configuration parameter. This should be the IP address or hostname of the machine where you are deploying Harness. You **cannot** use `localhost` for this parameter. Open values.yaml in your editor and update the `harness_host` parameter.
