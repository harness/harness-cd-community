#!/bin/bash -e

# setup variables
NAMESPACE="harness"

# prompt for namespace
read -p "Enter Kubernetes namespace (default: $NAMESPACE): " USER_SUPPLIED_NAMESPACE
echo
while [ $(echo "$USER_SUPPLIED_NAMESPACE" | egrep -c "^([a-z0-9]([-a-z0-9]*[a-z0-9])?)?$") -ne 1 ]; do
  echo "Supplied namespace is invalid, please enter a namespace consisting of lower case alphanumeric characters and '-'"
  read -p "Enter Kubernetes namespace (default: $NAMESPACE): " USER_SUPPLIED_NAMESPACE
  echo
done
if [ -n "$USER_SUPPLIED_NAMESPACE" ]; then
  NAMESPACE="$USER_SUPPLIED_NAMESPACE"
fi

# cleanup namespace if it already exists
DOES_NAMESPACE_EXIST=$(kubectl get namespaces --ignore-not-found $NAMESPACE)
if [ -n "$DOES_NAMESPACE_EXIST" ]; then
  read -p "The namespace $NAMESPACE already exists, should it be deleted (y/n)? " DELETE_RESPONSE
  DELETE_NAMESPACE=$(echo "$DELETE_RESPONSE" | awk '{ print substr(tolower($0), 1, 1) }')
  if [ "$DELETE_NAMESPACE" = "y" ]; then
    echo "Deleting namespace '$NAMESPACE'..."
    kubectl delete namespace $NAMESPACE
  else
    echo "Will not delete existing namespace $NAMESPACE"
  fi
  echo
fi

# deploy Helm chart
helm install harness ./harness --create-namespace --namespace "$NAMESPACE"
