---
filetags: ":tech:ibm:redhat:openshift:kubectl:oc:epubnote:"
id: 1b0d6d70-3fc0-4246-bec2-425fe12d454f
title: kubectl, oc Openshift, Other K8s related command Snippets, Other
  K8s related command Snippets
---

## Kubectl

``` shell

# See complete list of api resources that could be viewed
kubectl api-resources

# See nodes, pods, services, deployments
kubectl get node
## See more pod information
kubectl get pod -o wide
kubectl get pod

## Get resource information as yaml
kubectl get pod/mypod2 -o yaml
kubectl get service/myservice -o yaml > service-myservice.yaml

# See services
kubectl get svc
kubectl get deployment
## See replicas of pods
kubectl get replicaset
## See all deployments, services
kubectl get all
## See all deployments, services in all namespaces
kubectl get all --all-namespaces

## Get all pods in namespace
kubectl get pods -n <namespace>

# See pod details
kubectl describe pod <pod name>

# Create components with deployments
## Help
kubectl create -h

## View emply YAML manifests for K8s components
### --dry-run=client : only print out the object
### -oyaml : output in yaml format
kubectl create <kind> <component-name> --dry-run=client -oyaml
### Example
kubectl create deployment test --image redis --dry-run=client -oyaml

## Deployment
kubectl create deployment NAME --image=image COMMANDS
### Example: Create an nginx deployment
kubectl edit deployment nginx-depl
### Editor deployment, open yaml in EDITOR
kubectl edit deployment nginx-depl
## Get deployments on all namespaces
kubectl get deployment --all-namespaces=true
## Get deployment in yaml format, check status
kubectl get deployment <deployment-name> -o yaml
kubectl get deployment <deployment-name> -o yaml > result.yaml
### nushell
kubectl get deployment <deployment-name> -o yaml | save result.yaml

# Services
kubectl get svc
kubectl describe service <service-name>
kubectl delete svc <service-name>

# Apply a configuration, repeat to update a deployment
## -f file
kubectl apply -f config-file.yaml

# Debugging, Logs
kubectl logs <pod name>

# Command execution in container with -it interactive terminal
kubectl exec -it <pod name> -- bin/bash

# Check version
kubectl version

# Remove a deployment
kubectl delete deployment <deployment name>
kubectl delete deployment <deployment name> --namespace <namespace name>

# Ingress
## See all ingress
kubectl get ingress -A

# Switch cluster or use kubectx
kubectl config use-context <cluster>
# Switch namespace or use kubens
kubectl config set-context --current --namespace=<namespace>

# Namespaces
kubectl create namespace my-namespace
kubectl get namespace
## See namespace and non-namespace resources
kubectl api-resources --namespace=false
kubectl api-resources --namespace=true
# Set namespace on apply
kubectl apply -f deployment.yaml --namespace=my-namespace
kubectl get all  --namespace=my-namespace
# Change active namespace
kubectl config set-context --current --namespace=my-namespace

# Create pod and run image with parameters
## cpu-test : name of pod
## --image= : name of image, in this case from Docker Hub
## -- <text> : parameters for image
kubectl run cpu-test --image=containerstack/cpustress -- --cpu 4 --timeout 30s --metrics-brief
# Delete previously created pod
kubectl delete pod cpu-test

# Scale replicas
## Remove mongodb example
kubectl scale --replicas=0 statefulset/mongodb
## Restart mongodb example and see pods will re-establish connection with persistent stores
kubectl scale --replicas=3 statefulset/mongodb

# Role Based Access Control, Roles
# Set role
kubectl apply -f developer-role.yaml

# Get roles
kubectl get roles
kubectl describe role developer
# Check current user API access
## Check if user can do a command
kubectl auth can-i create deployments -n dev
## As admin, can also check permissions of other users

```

### Kubectl Shell Settings

``` shell

# Set default kubectl editor
export KUBE_EDITOR="nvim"
## as VS Code
export KUBE_EDITOR="code --wait"

# Short hand
alias k=kubectl

```

### Prometheus Operator

``` shell

# View rules in specific namespace
kubectl get PrometheusRule -n monitoring

```

## OC - Openshift

Source: [Chapter 2. OpenShift CLI (oc) \| Red Hat Product
Documentation](https://docs.redhat.com/en/documentation/openshift_container_platform/latest/html/cli_tools/openshift-cli-oc)

``` shell

# Login (requires version >= 4.14)
oc login
# Login with web API
oc login --web --server=openshift_api_server
# Login example with web
oc login --web --server=https://api.myserver.com:6443

# Status, Endpoint information
oc status

# List namespaces
oc get projects

# Switch projects
oc project <project_name>

# Get all pods in namespace
oc get pods -n <namespace>
# in current selected namespace
oc get pods

# Connect to a pod
oc rsh  --shell=/bin/bash pod_name

# Tail Container Logs
# Replace <pod_name> with the name of the pod where the container is running and <container_name> with the name of the container you want to view logs from.
# The -f option streams the logs so they will be continuously displayed in the terminal until you stop it by pressing CTRL + C.
oc logs -f <pod_name> -c <container_name>

# Execute a command in a container
# Replace <pod_name> with the name of the pod where the container is running and <container_name> with the name of the container you want to execute the command in.
oc exec -it <pod_name> -c <container_name> -- <command>
# Example
oc exec -it prod-connect-cluster-dbz-connect-0 -- curl -v telnet://10.33.33.33:1433

```

## Kubectx, Kubens - Switch k8s clusters, namespaces

``` shell

# Switch cluster/context name
kubectx <context_name>

# List namespaces
kubens

# Switch namespace
kubens <namespace>

```

## Stern - tail pods

``` shell

stern <pod-name>

# Look at specific container
stern --container <container-name> <pod-name>

```

## k9s - terminal user interface for Kubernetes clusters

Source: [k9s Commands](https://k9scli.io/topics/commands/)

``` shell

# Open to current cluster/context
k9s

# List all available CLI options
k9s help
# Get info about K9s runtime (logs, configs, etc..)
k9s info
# Run K9s in a given namespace.
k9s -n mycoolns
# Run K9s and launch in pod view via the pod command.
k9s -c pod
# Start K9s in a non default KubeConfig context
k9s --context coolCtx
# Start K9s in readonly mode - with all modification commands disabled
k9s --readonly

```
