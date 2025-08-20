---
filetags: ":minikube:kubernetes:k8s:snippets:epubnote:"
id: c430e255-a071-45a5-873c-da3104149bdc
---

0#+title: Minikube Snippets

``` shell

# Start minikube cluster using podman driver
minikube start -d podman
# Check context and pods
kubectl config current-context
kubectl get pod

# Open minikube dashboard
minikube dashboard

# Create and access a service
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
kubectl expose deployment hello-minikube --type=NodePort --port=8080
kubectl get services hello-minikube
## Open in browser
minikube service hello-minikube

# Use kubectl to forward port
kubectl port-forward service/hello-minikube 7080:8080
# Visit in browser http://localhost:7080/

# Pause and unpause cluster
minikube pause
minikube unpause

# Stop cluster
minikube stop

```

## See Also

- [Podman Snippets](../005-computer-snippets-podman) - [Podman
  Snippets](id:cff51a5c-156b-4f2e-a49f-17a61dd46f76)
