#!/usr/bin/env bash

# Step 1:
# This is your Docker ID/path
dockerpath=byronervin/udacity:ml-ops.1.0
deployment=udacity-ml
port=8000

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment $deployment --image=$dockerpath
kubectl wait --for=condition=available --timeout=60s deployments/udacity-ml
kubectl wait --for=condition=ready --timeout=60s pod/$(kubectl get pods -l=app=udacity-ml | grep udacity | awk {'print $1'})

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/$deployment $port:80