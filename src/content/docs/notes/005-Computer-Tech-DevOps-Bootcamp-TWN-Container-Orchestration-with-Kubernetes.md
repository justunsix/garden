---
description: Learn container orchestration with Kubernetes to scale many
  containers. Module covers use case, concepts, components, and demo.
filetags: ":devops:kubernetes:k8s:epubnote:"
id: 86db85e9-86f3-4f5e-864b-d96a73aedc98
title: DevOps Bootcamp - Container Orchestration with Kubernetes
---

Source: My personal notes from DevOps course by TechWorld with Nana

## About Module

- Learn local k8s setup, commands, YAML config, and project
- How to manage namespaces, services, ingress, volumnes, secrets,
  persistence, Helm package management, and operators
- Using microservices and container orchestration and deploying
  microservices using production and security best practices
- Create common helm chart for microservices and declarative with
  helmfile
- Security: authorization, roles, accounts

## Introduction to Kubernetes (K8S)

- Kubernetes is an open source container orchestration tool developed by
  Google
- Helps manage containerized applications in different environment

### Use Case

- Applications trending from monolith to small independent application
  called microservices
- Increased usage of containers. Previously managed by scripts and self
  made tools before k8s

### Benefits of container orchestration

- High availability
- Scalability, performance depending on load
- Disaster recovery - backup and restore
  - Management of state

## Main Kubernetes Components

Example: Will use a simple app container with database container
deployment to describe how components are deployed

### Node and pod - servers and containers

- Node / Worker node - physical or virtual server
- Pod - smallest unit in k8s, abstraction of container
  - Not dependent on container technology
  - Interaction only with pod
  - Usually 1 application per pod
  - Network
    - Each pod has an IP in private network
    - Pods are ephemeral, they can stop at any time and be replaced with
      a new IP
  - Example: app and DB pods are running under 1 node

### Service (SVC) and Ingress - access

- Service - permanent IP address attached to a pod

- Life of pod and service is not connected, service's IP persists over
  pod restarts

- External service opens communication to a pod

  - Example: web app

- Internal service is used in private network

  - Example: the database

- Ingress - forwards traffic to service for access to it

  - Example DNS goes to ingress which points to external service of web
    app

### ConfigMap and Secrets - configuration

- Usually database URL is built into the application
- ConfigMap - external configuration of application, non-sensitive
  configuration
  - Example: database URLs, DB<sub>URL</sub> = mongo<sub>db</sub>
- Secret - like ConfigMap but for secret data in base64 format encoded
  and meant to be encrypted using 3rd party encryption
  - Example: database username, password
- ConfigMap and Secret can be used in pod, for example in environment
  variables or properties files

### Volume - data persistence

- Data in ephemeral pods will be destroyed when pods are stopped
- Volumes - attaches a physical storage location which can be local
  machine or remote storage outside of the k8s cluster
  - Example: database pod has a volume for persistence
  - Like an external hardrive plugged into the k8s cluster
- K8s cluster doesn't manage data persistence itself - data replication
  and management is done outside of k8s

### Deployment and StatefulSet - blueprint and replication

- When pods are stopped or die, we want users to still be able to visit
  an application. A second node can run a pod with the application
  - Example: web app will run 2 places: 1 pod in node A and 1 pod in
    node B
- Deployment - blueprint for pods and replicas, abstraction for pods
  - Usually, will work with Deployment rather than pods
  - Cannot be used for pods with a volume for data persistence
- StatefulSet - for stateful apps like databases or apps requiring state
  storage
  - Makes sure data operations are consistence
  - Can be more complex so common practice is host stateful components
    like databases outside the k8s cluster
  - Example: database will run 2 places: 1 pod in node A and 1 pod in
    node B
- Example: app and database runs on 2 nodes allowing downtime of a
  single pod without disrupting application use

### DaemonSet - replicas on each node

- Want to collect logs from pods or run an app on each node like
  kube-proxy, log collector

- DaemonSet - like a Deployment / StatefulSet and calculates how many
  Replicas are needed based on nodes in cluster. Deploys 1 replica per
  node

- Automatically scale replicas on nodes

  - Example: node is added, pod replica will be adjusted.

## Kubernetes Architecture

2 types of nodes:

- Control plane
- Worker node

### Worker Node

- Worker machine / node in K8s Cluster
  - Can have multiple pods
  - 3 processes on each node:
    - Container runtime: docker, cri-o, containerd
      - containerd is popular due to being lightweight
    - kubelet: interacts with container and node, it starts the pod with
      container inside
    - kube-proxy: forwards requests to make sure communication is
      performant
      - Example: calls to DB service would be forwarded to DB on same
        node

### Control Plan Processes

- How to interact with cluster?
  - Scheduling pod
  - Monitoring
  - Manage pods
  - Join new nodes

Above functions are controlled from control plane nodes

4 processes on every control plane node:

- API server: client connects to API like UI, CLI that takes queries and
  requests
  - Cluster gateway
  - Authentication of users, validate requests, forward request to other
    processes
- Scheduler: schedule new pods, determine where to put pods based on
  node usage
  - Scheduler will communicate to kubelet
  - Kubelet will do the actual pod starting
- Controller Manager
  - Aware of pod status, like if a pod crashes, restarts it by
    contacting scheduler
- etcd - Key value store, like the cluster brain which stores data,
  state
  - Nodes interact with etcd
  - Has cluster state information
  - Application data is not stored in etcd
  - Must be stored and replicated and distributed among all control
    plane nodes

1.  Example Cluster Setup

    - Control plan processes are high importance, but low usages
      - Get new server, install control plane, nodes, join to the
        cluster
    - Worker nodes have high usage, but can be replaced, added, removed
      - Get new server, install node and join to cluster

## Minikube and kubectl - Local Kubernetes Cluster

See [Minikube documentation](https://minikube.sigs.k8s.io/docs/)

### What is Minikube

- Allows testing k8s on local machine due to complexity of setting up
  full k8s

- Minikube puts control plane processes and worker process in one node
  and has docker pre-installed

1.  Setup

    - Will run as a container or VM on local machine
      - Needs either container or virtualization platform like Docker
        (preferred) or Virtualbox
      - If using container, there will layers of containers
    - Install

    ``` shell

    # Start using Docker driver
    minikube start --driver docker

    minikube status

    ```

### What is kubectl

- kubectl is an k8s API server client to control the cluster and make
  requests
- Can be used for any kind of k8s setup like small to large cluster

## Main kubectl commands

See [kubectl, oc Openshift, Other K8s related command
Snippets](../005-computer-snippets-kubectl-oc-kube) - [kubectl, oc
Openshift, Other K8s related command
Snippets](id:1b0d6d70-3fc0-4246-bec2-425fe12d454f)

Layers of Abstractions

- Note in create there is no create pod, usually we work with
  deployments which is an abstraction over pods

- Deployment manages:

  - Replicaset manages a:
    - Pod is an abstraction of:
      - Container

Examples

``` shell

kubectl create deployment nginx-depl --image=nginx
# Edit nginx deployment
kubectl edit deployment nginx-depl
# Changes the image tag, a new pod will be created with the new tag and old replicaset will be stopped
kubectl get replicaset

# Create a mongodb deployment
kubectl create deployment mongo-deployment --image=mongo

```

- When creating deployments, due to number of values and commands,
  usually work with a k8s yaml files to specify the deployment instead
  of CLI like:
  - Deployment name
  - Image name
  - Options

Example nginx-deployment.yaml

``` yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    # Deployment labels, for use by selectors in service
    app: nginx
spec:
  replicas: 2 # Number of desired pods
  selector:
    matchLabels:
      app: nginx
  # Pod configuration / blueprint
  template:
    metadata:
      labels:
        # Labels for the pod template
        # To be matched by selector affecting nginx pods
        app: nginx
    spec:
      containers:
        - name: nginx-container
          image: nginx:latest # NGINX image from Docker Hub
          ports:
            - containerPort: 80 # Port to expose on the container

```

nginx-service.yaml

``` yaml

apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  # Selects labels with app: nginx
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      # Target must map to container port
      targetPort: 8080

```

Apply deployment

``` shell

kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml

kubectl describe service nginx-service.yaml

```

## YAML Configuration File

- Each file has API version and kind of file

- About yaml:

  - "human friendly" data serialization standard for all programming
    languages
  - Syntax uses indentation that is strict
    - Use editor or tools for syntax checking

### Each configuration file has 3 parts

- metadata
  - like name
- specification
  - configuration of components
  - Will be specific to kind
- status
  - Will be added by k8s, k8s compares desired with actual and will fix
    any gaps with desired
  - Status will be updated continuously - it comes from etcd
    - etcd holds the current status of any K8s component

### Blueprint for Pods

- In specification part of deployment template

- Specification has it's on metadata and pod has a spec:

  - name
  - image
  - ports

### Connecting Components: Labels, Selectors, Ports

- Metadata has labels
  - Key value pair
  - For example, `app: nginx`
  - Label is for that component
- Specification has selectors
  - Selector determines which labels a spec applies to
- Service has selector which will match to labels in deployment yaml
  - service's `targetPort` must match listening `containerPort` in
    deployment
- Get the current deployment and its status as a yaml
  `kubectl get deployment <deployment-name> -o yaml > result.yaml`

## Complete Demo Project - Deploying Application in Kubernetes Cluster

### Source

Starting code:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/demo-deploying-application/-/tree/starting-code?ref_type=heads>

Final code:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/demo-deploying-application>

### Overview

- Goal: deploy 2 applications, mongo-express, mongo-db
  - Pattern: Web app, Database

K8s components:

- mongo-db service, only internal requests
- mongo-express service, available to user through browser
- mongo-express can connect to DB with URL, credentials
- Use `deployment.yaml` and env variables
- ConfigMap with DB URL
- Secret with database user name and password

Flow:

- user –\> Mongo Express External Services –\> mongo-express –\> Mongo
  DB internal service –\> mongo-db

### Mongo DB Deployment

Steps to create files:

- Create mongodb deployment yaml file
- Create Secret configuration
  - kind: Secret
  - metadata/name: random name
  - type: Opaque
  - data: actual contents in key value pairs
    - values must be base 64 encoded like `echo -n 'username' | base64`
      and save encoding in the secrets yaml
- Add Service to deployment yaml file using `---` new file syntax
  - targetPort must match containerPort of pods
- Create mongo-express deployment yaml file
  - Add Service for web access, make it external access with
    `type: LoadBalancer` vs `type: ClusterIP` is internal Service
- Create ConfigMap yaml file to start database connection
  - Connection uses the mongo-db service name
- Note Secret and ConfigMap in yaml references are similar

``` yaml

# mongo.yaml (mongodb deployment and service)

apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongodb-deployment
  labels:
    app: mongodb
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongodb
  template:
    metadata:
      labels:
        app: mongodb
    spec:
      containers:
        # See image on Docker Hub for options
        - name: mongodb
          image: mongo
          ports:
            - containerPort: 27017
          # Database credentials as Secrets
          # Do not store credentials here
          env:
            - name: MONGO_INITDB_ROOT_USERNAME
              # Reference Secret and keys inside it
              valueFrom:
                secretKeyRef:
                  name: mongodb-secret
                  key: mongo-root-username
            - name: MONGO_INITDB_ROOT_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: mongodb-secret
                  key: mongo-root-password
---
apiVersion: v1
kind: Service
metadata:
  name: mongodb-service
spec:
  selector:
    app: mongodb
  ports:
    - protocol: TCP
      port: 27017
      # targetPort must match containerPort of pods
      targetPort: 27017

# mongo-secret.yaml

apiVersion: v1
kind: Secret
metadata:
  name: mongodb-secret
type: Opaque
data:
  # Stored as base 64 encoded
  # ex: echo -n 'username' | base64
  # Best practice is to apply encryption
  mongo-root-username: dXNlcm5hbWU=
  mongo-root-password: cGFzc3dvcmQ=

# mongo-configmap.yaml

apiVersion: v1
kind: ConfigMap
metadata:
  name: mongodb-configmap
data:
  # Same as mongodb's Service name
  database_url: mongodb-service

# mongo-express.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo-express
  labels:
    app: mongo-express
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongo-express
  template:
    metadata:
      labels:
        app: mongo-express
    spec:
      # See image on repository for options
      containers:
        - name: mongo-express
          image: mongo-express
          ports:
            - containerPort: 8081
          # Environment variables for DB connectivity
          # Reuse existing DB Secrets
          env:
            - name: ME_CONFIG_MONGODB_ADMINUSERNAME
              valueFrom:
                secretKeyRef:
                  name: mongodb-secret
                  key: mongo-root-username
            - name: ME_CONFIG_MONGODB_ADMINPASSWORD
              valueFrom:
                secretKeyRef:
                  name: mongodb-secret
                  key: mongo-root-password
            # Use ConfigMap to allow reuse of database connection
            - name: ME_CONFIG_MONGODB_SERVER
              valueFrom:
                configMapKeyRef:
                  name: mongodb-configmap
                  key: database_url
---
apiVersion: v1
kind: Service
metadata:
  name: mongo-express-service
spec:
  selector:
    app: mongo-express
  # type LoadBalancer means it is an External Service
  # Will assign external IP address
  # Internal service will have type ClusterIP (default value)
  type: LoadBalancer
  ports:
    - protocol: TCP
      port: 8081
      # targetPort will be mapped to nodePort (external port)
      targetPort: 8081
      # nodePort is a range from 30000-32767 and used for external access
      nodePort: 30000

```

Apply configurations

``` shell

kubectl apply -f mongo-secret.yaml
# Apply deployment
kubectl apply -f mongo.yaml

kubectl get all

# Verify pod start
kubectl describe pod mongo-db-pod-name

# Re apply any changes
kubectl apply -f mongo.yaml

kubectl apply -f mongo-configmap.yaml

kubectl apply -f mongo-express.yaml

kubectl logs mongo-express-pod-name

# Assign IP for external service
# minikube will create a tunnel on localhost to external Service
minikube service mongo-express-service

```

### Accessing mongo-express

User on browser –\> Mongo Express External Service –\> Mongo Express pod
–\> Mongo DB Internal Service –\> Mongo DB pod

## Namespaces - Organizing Components

### What is a Namespace?

- Way to organize K8s resource, like a virtual cluster inside a K8s
  cluster
- See out of box namespaces with `kubectl get namespace`
  - kube-system: not be modified, system process like control plane
  - kube-public: public accessible data, ConfigMap with cluster info
  - kube-node-lease: heartbearts of nodes with their availability
  - default: resources will be created here by default
- New namespace can be created using
  `kubectl create namespace my-namespace` or using namespace
  configuration file. Creating using a file is recommended.

### Why use a Namespace?

- If everything is in the default namespace, it can become difficult to
  see overview of solutions with multiple users and components

- Example patterns:

  - Database namespace
  - Monitoring namespace
  - Elastic stack namespace
  - Nginx-Ingress namespace

### When to Use Namespaces

- Officially, namespaces not needed for small projects

Use cases for using separate namespaces:

- Functionally similar components like databases
- Different teams to prevent configuration conflicts
- Example, applying configuration with the same name "mp-app" will erase
  other team's configuration also called "my-app")
- Difference environments like staging, development
- Instances (blue/green) of solutions can be separate namespaces
- Resource Quotas by namespaces

Use cases for specific namespaces:

- Common resources like monitoring can be used across environments like
  monitoring namespace
- Usually resources across Namespaces cannot be reused
  - Secrets cannot be reused
  - Services like database service could be reused
    - Example reference service with namespace at end:
      `mongodb-service.database`
- Some components cannot be created within a Namespace, they live in the
  cluster:
  - Volume
  - Node

### Working with Namespaces

- When doing `apply`, without namespace, they will be created in the
  default namespace (`-n default`)
- Namespaces can also be specified inside configuration files using
  metadata \> namespace:

``` yaml

apiVersion: v1
kind: ConfigMap
metadata:
  name: mongodb-configmap
  namespace: my-namespace
data:
  database_url: mongodb-service.database

```

1.  Kubectl commands

    - By default, kubectl will just look at the default namespace, use
      –namespace to specify it or change the active namespace. You can
      also use a tool `kubens` k8s namespace, to manage namespaces

    ``` shell

    # See namespace and non-namespace resources with
    kubectl api-resources --namespace=false
    kubectl api-resources --namespace=true

    # Set namespace on apply
    kubectl apply -f deployment.yaml --namespace=my-namespace

    kubectl get all  --namespace=my-namespace

    # Change active namespace
    kubectl config set-context --current --namespace=my-namespace
    ## List namespaces
    kubens
    ## Change namespace
    kubens my-namspace

    ```

## Kubernetes Services - Connecting to Applications inside cluster

Section explains K8s Services, services types of ClusterIP, Headless,
NodePort, LoadBalancer, and differents for types and when to use them

### About Services and What they are needed

- When pods are restarted, they can get new IP address. A service has a
  stable IP address in front of pods and provides load balancing
  - Internal cluster and external clients can use the stable IP and
    service will direct requests to available pods

### Service Type: ClusterIP - default type, used if not specified

- Example: Microservice app
  - Has monitoring log side car container as well
  - App has a IP/port from Node(s)' ranges
  - `kubectl get pod -o wide` can show node and IPs
  - Accessed through Ingress which uses Service, ClusterIP type with
    stable IP and specific port. Service forwards request to an
    available pod, user –\> ingress –\> service –\> pods matching
    selector
    - Which pods to forward to?
      - Use "selector" from Service configuration which matches to pod
        labels. Service will match is pods with labels specificed in
        selector
    - Which port to use?
      - Set in `targetPort` in Service configuration, must match pod's
        `containerPort`
  - K8s creates an Endpoint object with same name as Service, K8s keeps
    track of pods that are members of the object
  - Database also has a Service, ClusterIP type. App will use database's
    Service to reach database pods

### Multi-Port Services

Example: Mongo db pod has a Prometheus metrics exporter
(mongodb-exporter), running on 9216

- Outside pod, Prometheus can access the metrics exporter
- As a result, the Service now has multiple ports defined with names and
  ports

``` yaml

# Rest of Config
  ports:
  - name: mongodb
    protocol: TCP
    port: 27017
    targetPort: 27017
  # Prometheus metrics exporter
  - name: mongodb-exporter
    protocol: TCP
    port: 9216
    targetPort: 9216

```

### Service Type: Headless

- Use case: A client wants to communicate with a specific pod directly,
  not randomly selected by a Service
  - Useful for stateful applications like databases
    - Pod replicas are not identical
      - Main database - can read write
      - Replica instance(s) - can only read, data synchronized
  - Client would need to know IP address of each pod
    - Option 1: API call to K8s API
    - Option 2: DNS lookup with K8s
      - For a Service, it will give an IP (ClusterIP)
      - If setting `clusterIP: None` in Service configuration, K8s will
        return pod IPs on DNS lookup instead, that way a client can
        choose a pod/IP
- Headless allows pod to specific pod communication

### Service Type: NodePort

- Creates a port, accessible from outside the cluster unlike the
  ClusterIP type

  - Port is on the worker node
  - Port range is 30000 - 32767
  - Port will be mapped to a Service which will also have a ClusterIP
    address

- Since a Service can span multiple nodes, the NodePort will be on work
  nodes where the selected pods are running on

- NodePort services are not secure due to open ports for outside clients

- Use case: testing services, not for production use, instead use
  Ingress or provider service to be in front of ClusterIP services

### Service Type: LoadBalancer

- Use case: need a secure version of the NodePort
- Service is available externally through a provider's LoadBalancer
  service (example, a cloud provider's like AWS, Azure, Linode,
  Openstack load balancer service)
  - Client –\> Provider load balancer (ex. cloud service) –\> Service
    nodePort –\> Pod(s)

### Service Types Similarities

- LoadBalancer is an extension of the NodePort
- NordPort type is an extension of the ClusterIP
- `kubectl get service` to see all services and ports

## Ingress - Connecting to Applications outside cluster

List of Ingress Controllers you can choose from:
<https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/>

The Ingress YAML file used in this project can be found here:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/ingress>

### External Service vs Ingress

Example: my-app web used by users

- Option: External service for app, users use IP:port to access
- Option: Ingress - users can use DNS and https
  - user –\> ingress –\> service –\> app

### Configuration of Ingress

- Similar to External Service configuration, but there will not be a
  `nodePort` item and uses a ClusterIP type
- Prerequisite is a Ingress Controller which processes ingress rules
  - Must be installed on K8s cluster
  - Controller will process rules and manage redirections
  - Will be entrypoint to cluster
  - Many [third party implementations of K8s Ingress
    Controller](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)
    - Like K8s Nginx Ingress Controller

1.  Considerations when choosing Ingress Controller

    - If using a service provider like a cloud, they will have a cloud
      load balancer and would redirect to K8s cluster. Advantage is no
      need to implement load balancer yourself
    - If using self managed K8s / bare metal, need to configure an entry
      point
      - Can use external proxy server as an entrypoint to cluster which
        will host public IP and open ports
        - Keeps K8s secure using a separate server

    For Minikube local work:

    - Install Ingress Controller with `minikube addons enable ingress`
      which activates the K8s Nginx Ingress Controller which uses an
      minikube tunnel to enable ingress access

### Create Ingress Rule and Example of Ingress Configuration

Goal: Run kube-dashboard and have it accessible externally

Sample ingress yaml configuration

``` yaml

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: dashboard-ingress
  namespace: kubernetes-dashboard
spec:
  # Routing rules
  rules:
    # Requests for this host go to internal service
    # Domain must be mapped to entrypoint like:
    # - K8s cluster node
    # - Service provider entrypoint
    - host: dashboard.com
      # http protocol
      http:
        paths:
          # Any paths after the domain like dashboard.com/report1
          - path: /
            pathType: Prefix
            backend:
              # Internal service and its name, port
              service:
                name: kubernetes-dashboard
                port:
                  number: 80

---
  # Default backend's settings for information
  defaultBackend:
    service:
      name: kubernetes-dashboard
      port:
        number: 80

```

Set up dashboard and ingress:

``` shell

# Enable minikube dashboard, for web viewing
minikube dashboard
## Dashboard is only internal, making it external with these steps

kubectl apply -f dashboard-ingress.yaml
kubectl get ingress -n kubernetes-dashboard

# Use localhost DNS mapping for local testing
sudo vim /etc/hosts
## add 127.0.0.1 dashboard.com

# Open minikube tunnel for external access
minikube tunnel

```

### Ingress Default Backend

- Default backend is used when no rules are specified, for example for
  invalid paths
- Can be used for error pages, custom pages to redirect users
  - A pod can be configured to host that page

### Multiple Paths for Same Host

- A domain with 2 applications like myapp.com/analytics and
  myapp.com/shopping and subdomains examples

``` yaml
# Single host ingress
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: simple-fanout-example
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
    - host: myapp.com
      http:
        paths:
          - path: /analytics
            backend:
              service:
                name: analytics-service
                port:
                  number: 3000
          - path: /shopping
            backend:
              service:
                name: shopping-service
                port:
                  number: 8080

---
# Ingress with multiple sub-domains
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: virtual-host-ingress
spec:
  rules:
    - host: analytics.myapp.com
      http:
        paths:
          - path: /
            backend:
              service:
                name: analytics-service
                port:
                  number: 3000
    - host: shopping.myapp.com
      http:
        - path: /
          backend:
            service:
              name: shopping-service
              port:
                number: 8080

```

### TLS Certificate

- Set in specification section

``` yaml

# Host with TLS certificate via Secret
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: tls-example-ingress
spec:
  tls:
    - hosts:
        - myapp.com
      secretName: myapp-secret-tls
  rules:
    http:
      paths:
        - path: /analytics
          backend:
            service:
              name: analytics-service
              port:
                number: 3000
---
# Secret configuration with TLS certificate
apiVersion: v1
kind: Secret
metadata:
  name: myapp-secret-tls
  # Namespace must be in same namespace as ingress component
  namespace: default
type: Opaque
data:
  # Must be actual file contents
  tls.crt: base64 encoded certificate
  tls.key: base64 encoded key
type: kubernetes.io/tls

```

## Volumes - Persisting Application Data

### Need for Volumes

Use case 1: In database pod, by default, there is no data persist. Need
storage outside of the pod lifecycle

Use case 2: Application needs to read files from a directory

- Storage must be available from all nodes in case pod(s) are on or
  moved to different nodes
- Storage needs to exist outside cluster in case cluster crashes

How to persist data in K8s using volumes?

- Persistent Volume
- Persistent Volume Claim
- Storage Class

### Persistent Volume

- A cluster resource, created via YAML file

  - Like an "external plugin to the cluster"

- Needs a backing physical storage like local, cloud storage, NFS file
  server

- `kind: PersistentVolume` yaml configuration defines:

  - How much space
  - Additional parameters like access
  - Storage type and its parameters, specification will differ depending
    on storage type
    - Example NFS path, server
    - Example cloud name, disk information

- Do not have a namespace, are accessible to whole cluster

- Applications can use multiple volumes of different types

  - Example: application can use and mount these specific volumes to
    mounts in container:
    - Secret, /var/lib/secret
    - ConfigMap, mounted to /var/lib/config
    - PV backed by AWS Elastic Block Store cloud storage, mounted to
      /var/lib/config

### Local vs Remote Volume Types

Each volume type has a own use case

- Local volume disadvantages:
  - Tied to a specific node
  - May not survive a cluster crashes
  - Good practice is use remote storage

### Creation of volumes

- K8s administrator - creates cluster and manages its capacity
  - Configures storage, example create NFS server or cloud storage
  - Create persistent volume in cluster
- K8s User - deploys applications in cluster
  - Configure application to use existing persistent volume

### Persistent Volume Claim (PVC)

- Created with yaml configuration, used by applications to use an
  existing volume
  - Example: app developer uses volume in pod configuration
    - Define volume in pod configuration
- Specifies access modes, resources, mount point in container for
  storage

### Levels of Volume Abstractions

Pod –request to–\> PVC –connect to–\> Persistent Volume

Pod now has access to volume. If pod is restart, new pod can access
volume as before

Why use abstractions?

- Helps with application development as developer only needs access to
  persistent volume and doesn't need know actual storage backend

### ConfigMap and Secret Volumes

- Use case: attributes and secrets to be used with a pod like
  certificates, values

- Both are local volumes and managed by K8s directly

  - Not created in PV and PVC

### Storage Class (SC)

Use case: K8s developers ask admins for storage. After many requests,
there can be many persistent volumes.

- Storage Class (SC) can create persistent volumes dynamically
- Created with yaml `kind: StorageClass` configuration
  - uses `provisioner` attribute that specifies storage backend
    - There are internal and external provisioners
  - parameters for storage like type, size, filesystem type

Usage:

- Requested by PVC, in specification, state `storageClassName`
- PVC requests storage from SC, SC createds PV that meets claim's needs

## ConfigMap & Secret Volume Types

Demo will use volumes in pods. The configuration files for this demo can
be found here:

Starting code:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/configmap-and-secret-volume-types/-/tree/starting-code>

Final code:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/configmap-and-secret-volume-types>

### Configuration Files Usage in Pods

Use cases: many services and apps have configuration files and
properties

- configuration, properties files
- sensitive properties files
- certificates
- secrets, key-values: Previously we used ConfigMap and Secret

### Demo

- Using mosquitto, a message broker
  - Need to configure it with files on volumes
  - Prepare configuration files and for deployment of pod, include
    volumes configuration
- Use ConfigMap and Secret configuration to store files that pod can
  access
  - Client certificates can also be stored in secret with base 64
    encoded
- Volumes must be mounted explicitly for each container where they must
  be mounted to
  - Choose which containers have access to which volumes
- For files that should not be changed like certificates or permanent
  config files, can add `readOnly: true` to `volumeMount`

1.  Running Demo

    ``` shell

    # Start mosquitto without volumes to see default file system
    kubectl apply -f mosquitto-without-volumes.yaml
    # Use kubectl exec -it to review container

    # Create ConfigMap and Secret first before pod deployment
    kubectl apply -f config-file.yaml
    kubectl apply -f secret-file.yaml

    # Deploy pods
    kubectl apply -f mosquitto.yaml
    # Use kubectl exec -it to review container, see volumes/files are mounted

    ```

2.  Configuration Files

    ``` yaml

    # secret-file.yaml
    apiVersion: v1
    kind: Secret
    metadata:
      name: mosquitto-secret-file
    type: Opaque
    data:
      # Base 64 encoded
      secret.file: |
        VGVjaFdvcmxkMjAyMyEgLW4K

    ---
    # config-file.yaml
    apiVersion: v1
    kind: ConfigMap
    metadata:
      name: mosquitto-config-file
    data:
      # File and its contents defined here
      mosquitto.conf: |
        log_dest stdout
        log_type all
        log_timestamp true
        listener 9001

    ---
    # mosquitto.yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: mosquitto
      labels:
        app: mosquitto
    spec:
      replicas: 1
      selector:
        matchLabels:
          app: mosquitto
      template:
        metadata:
          labels:
            app: mosquitto
        spec:
          containers:
            - name: mosquitto
              image: eclipse-mosquitto:2.0
              ports:
                - containerPort: 1883
              # Volumes must be mounted explicitly for each container where they must be mounted to
              volumeMounts:
                - name: mosquitto-config
                  # Use target paths appropriate for the container/application
                  mountPath: /mosquitto/config
                - name: mosquitto-secret
                  # add read only attribute where app should not be changing it
                  mountPath: /mosquitto/secret
                  readOnly: true
          volumes:
            - name: mosquitto-config
              configMap:
                name: mosquitto-config-file
            - name: mosquitto-secret
              secret:
                secretName: mosquitto-secret-file

    ```

## StatefulSet - Deploying Stateful Applications

- StatefulSet is a K8s components for use with stateful applications
  like:
  - Databases
  - Applications that store data to track its state
  - Deployed in K8s using `StatefulSet`
- Stateless applications do not record state and each request is new
  - Requests to stateless application may have payload with information
  - Often, they are used with stateful applications like queries and
    requesting changes
  - Deployed in K8s using `Deployment`
- Both StatefulSet and Deployment allow multiple replicas, based on a
  container specification and both allow storage

### Deployment vs StatefulSet

Stateful applications are more complex:

- Example: mysql pod handling requests from Java app
  - Want to scale mysql
    - Cannot be randomly addressed, created/stopped
    - Each pod has a pod identity
  - Java app scales easily, random creation/stop, 1 service for load
    balancing

### Pod Identity

- StatefulSet has a sticky identity for each pod
- Persistent identifier that is tracked
  - \$(statefulset name)-\$(ordinal)
    - Compared to Deployments that uses random hash
    - Example: mysql-0, mysql-1, mysql-2
    - ordinal in order of startup, next pod will not start if the last
      failed
    - Deletion in reverse order, starting from last one, again only if
      last delete was successful
  - Ordering ensures data is protected

Why tracking identities for stateful applications?

- Only one stateful pod is allowed to write, all other pods can do
  reading
  - The pod allowed to write and read is called the main, other pods are
    replica pod
- Each pod has their own replica of the storage, they do not use the
  same storage
  - Good practice is each pod has a persistent volume to prevent data
    loss in case cluster or all pods crash
    - Configure PV for each pod, should use remote storage in case node
      dies
    - Pod state is in PV so when pod is restarted, persistent state is
      attached to pod with pod identity
  - Data must be replicated to replicas from the main
  - Replicas must know about changes - continuous data synchronization
- New pods synchronize from the last created pod which may not
  necessarily be the main

### 2 Pod Endpoints

- Loadbalancer service - same a deployment
- Individual service name, DNS for each pod
  - Naming: \${pod name}.\${governing service domain}
    - governing service domain is defined in StatefulSet
    - Example: mysql-0.svc2, mysql-1.svc2, mysql-2.svc2
- During restarts, pod names are predictable and with fixed individual
  DNS name
  - IP address can still change
  - In other words, name and endpoint stay the same
  - Pod state and role is preserved across restarts

### Replicating statful apps - responsibilities outside K8s

You still need to take care of:

- Cloning and data synchronization
- Remote storage management
- Backups

Consideration: Stateful applications are not perfect for containers,
while stateless applications are more suited to containers

## Managed Kubernetes Services Explained

- Use Case: Need to deploy a microservices application in a K8s cluster:
  - Available from browser with https, cluster security and DB
    persistence
  - DEV and PROD environment

### Managed vs Unmanaged K8s Clusters

K8s on cloud:

- Create from scratch (Example: Linode): create nodes/VMs
  - Large overhead due to setup
- Managed K8s (Example: Linode Kubernetes Engine, AWS EKS):
  - K8s pre-installed, only need to care about worker nodes
    - Only pay for worker nodes
  - Control Plane Nodes are managed by provider
  - Less set up time, ongoing maintenance

### Concepts of Creating K8s cluster on Cloud

- Choose Worker Nodes and resources
- Select region
- Connect using kubectl
  - Do Deployments
- Data persistence
  - Create physical storage like cloud storage
  - Create persistent volume, attach volumes
  - Example: use Linode Block Storage and use Linode's Storage Class for
    Linode to automatically create storage and volumes
- Loadbalancing
  - Ingress - routing of requests
  - Install ingress controller
  - Example: Linode, use Linode's NodeBalancer that is entrypoint of
    cluster
    - Load balancer for worker nodes, has public IP, offers session
      stickiness to pod for applications with in memory information
    - Entrypoint for external services, load balancer will forward
      requests to service
    - Secure connection with SSL
      - Linode: use cert-manager to plugin, K8s Secret
- Usage concepts across cloud providers are similar
- Host Worker Nodes close to your users

### Platform and Provider Migration

- Usually when using a cloud provider, it is tied to cloud provider,
  making migration difficult - called vendor lock in where vendor
  provides useful services but make it difficult to move away

### Automating Tasks

- As infrastructure grows complex, need to automate creation,
  configuration, CICD
- Example: use Terraform providers, Ansible modules to automate

## Helm - Package Manager for Kubernetes

### What is Helm

- Helm packages software and helps you with deploying it to k8s and
  things like repeated configurations.

- It packages YAML files and distributes them in public and private
  repositories

  - For example, you want to deploy Elastic stack, you need a Stateful
    Set, ConfigMap, Secret, k8s user, services
  - A bundle of these YAML files are "Helm Charts"
  - Example Helm Charts like database and monitoring apps

- You can create your own Helm charts, reuse other charts

- Sharing Helm Charts made it popular

- Find them at Helm Artifact Hub, private repositories, `helm search`

### Use Case: Templating Engine

Need: you have multiple microservices and need to deploy them and they
are only different by a couple lines and/or you need to deploy the same
solution in different clusters.

Helm allows you to define a blueprint which is a template YAML config
and get Values from a `values.yaml` or in command line using `--set`
flag when calling helm

### Use Case: Same applications across different environments

Create your own chart to re-deploy same application in different
environments

### Helm Chart Structure

``` text

- mychart/
  - Chart.yaml - meta info about chart
  - values.yaml - values for template files, can have defaults for override
  - charts/ - chart dependencies
  - templates/ - templates to be filled from values
  - README
  - LICENSE

```

### Values injection into template files

``` shell

# Can use my-values.yaml to override with custom values
helm install --values=my-values.yaml <chartname>

# set flag
helm install --set version=2.0.0

```

### Release Management

Keeping track of all chart executions

``` shell

helm install <chartname>

# only changes items are changes
helm upgrade <chartname>

# Roll back to previous version
helm rollback <chartname>

```

## Helm Demo - Managed K8s cluster

See:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/helm-demo>

### What we will deploy

- Deploy mongodb using Helm
- 3 Stateful Sets to support instances of mongodb
- Deploy UI client, mongo-express, using deployment file
- Configure ingress controller, nginx-ingress, to allow web access

### Steps

- Create kubernetes cluster on Linode
  - Choose 2 x 4 CPU, 8 GB RAM
- Get Kubeconfig (test-kubeconfig.yaml)
- You could create all configuration files yourself or use bundle like a
  Helm Chart

``` shell

# Be able to connect to cluster using kubectl
# make sure only you can access it
chmod 400 test-kubeconfig.yaml
export KUBECONFIG=test-kubeconfig.yaml

# Add the repo with the mongodb Helm Chart
helm repo add bitnami https://charts.bitnami.com/bitnami
# Find right chart
helm search repo bitnami/mongodb

```

Modify StatefulSet, root password, set StorageClass to Linode's storage

Create a custom `helm-mongodb.yaml` to override values

Look through the mongodb parameters to determine which values you want
to configure for the deployment. For this deployment, the `architecture`
should be `replicaset`, root password, and the volume storage will use
Linode's cloud storage.

``` yaml

# helm-mongodb.yaml
# Values to be used with bitnami/mongodb helm chart

architecture: replicaset
replicaCount: 3
persistence:
  # Linode storage class will automatically managed storage and volumes creation
  storageClass: "linode-block-storage"
auth:
  rootPassword: a-password

---
# helm-mongo-express.yaml
# To deploy mongo express user interface and internal service

apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo-express
  labels:
    app: mongo-express
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongo-express
  template:
    metadata:
      labels:
        app: mongo-express
    spec:
      containers:
      - name: mongo-express
        image: mongo-express
        ports:
        - containerPort: 8081
        env:
        - name: ME_CONFIG_MONGODB_ADMINUSERNAME
          value: root
        - name: ME_CONFIG_MONGODB_SERVER
          value: mongodb-0.mongodb-headless
        - name: ME_CONFIG_MONGODB_ADMINPASSWORD
          valueFrom:
            secretKeyRef:
              name: mongodb
              key: mongodb-root-password
---
apiVersion: v1
kind: Service
metadata:
  name: mongo-express-service
spec:
  selector:
    app: mongo-express
  ports:
    - protocol: TCP
      port: 8081
      targetPort: 8081

```

Ingress rule to allow access to mongo-express. It is a configuration for
ingress controller, for after ingress controller helm chart install

``` yaml

# helm-ingress.yaml

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
    annotations:
      kubernetes.io/ingress.class: nginx
    name: mongo-express
spec:
  rules:
  - host: YOUR_HOST_DNS_NAME
    http:
      paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: mongo-express-service
              port:
                number: 8081

```

Physical storage will be created automatically during helm install

``` shell

# Install
helm install mongodb --values helm-mongodb.yaml bitname/mongodb

# Check status
kubectl get pod
kubectl get all

# To Deploy mongoexpress, manually define configuration and get database values
kubectl apply -f mongo-express.yaml

# Set up Ingress using Helm Chart, nginx controller and set value
helm install nginx-ingress ingress-nginx/ingress-nginx --set controller.publishService.enabled=true
## Sets up a LoadBalancer for use with External IP

# Verify
kubectl get pod

# Verify nginx ingress load balancer, external is running, check EXTERNAL-IP
kubectl get svc

# Set up ingress after inserting the host name in the ingress yaml file
# Get hostname from Linode NodeBalancer details
kubectl apply -f helm-ingress.yaml
kubectl get ingress

```

For Linode, it has an automatically created "NodeBalancer" that provides
an IP that can be used to access the cluster

Visit the host name, note you can make changes and the data is persisted

``` shell

# Remove mongodb
kubectl scale --replicas=0 statefulset/mongodb

# Restart mongodb and see pods will re-establish connection with persistent stores
kubectl scale --replicas=3 statefulset/mongodb

# See charts
helm ls

# Remove mongodb, Helm will reverse all changes
# Persistent volumes will remain
helm uninstall mongodb

```

In Linode, you can delete the cluster and the NodeBalancer to return to
the beginning.

## Deploying Images in Kubernetes from private Docker repository

### Code

The Nodejs application used in this lecture is:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/js-app>

The commands used in this lecture can be found here:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/deploying-images-from-private-docker-repo/-/blob/main/cli-commands.md>

The files used in this project can be found here:

Starting code:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/deploying-images-from-private-docker-repo/-/tree/starting-code>
Final code:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/deploying-images-from-private-docker-repo>

### Private Repository Images

- K8s needs access to the repository

- Set up Secret with Docker registry credentials

- Use Secret in `imagePull`

- First build and push the image to the private repository

1.  Secret Set up on K8s

    ``` shell

    # Login to private repo
    aws ecr get-login-password --profile profile_name1 --region ca-central-1 | docker login --username AWS --password-stdin acr-registry-name-region.amazonaws.com

    # See authentication setup
    cat .docker/config.json

    # Get token for login
    aws ecr get-login-password

    # Go into local K8s / minikube host
    # Use token with K8s cluster
    # Use login with password directory
    docker login --username AWS -p <long-token> acr-registry-name-region.amazonaws.com

    # Copy from Minikube host to your machine
    minikube cp minikube:/home/docker/.docker/config.json /home/user/.docker/config.json

    # Set up Secret
    ## Option 1: Get base64 encoded value of docker authentication
    ## to put into a Secret yaml file
    ## to apply
    cat .docker/config.json | base64
    ## or Option 2: use kubectl command
    kubectl create secret generic my-registry-key \
        --from-file=.dockerconfigjson=.docker/config.json \
        --type=kubernetes.io/dockerconfigjson

    ## See Secret
    kubectl get secret -o yaml

    ## or Option 3: use kubectl command with token directly
    kubectl create secret generic my-registry-key-two \
        --docker-server=https://ecr-server.amazonaws.com \
        --docker-username=AWS \
        --docker-password=<long-token>

    ```

    Using the `.dockerconfigjson` type can be useful for accessing
    multiple repositories using the one Secret file contents

    `docker-secret.yaml` for use in Docker pull image later in
    deployment

    ``` yaml

    apiVersion: v1
    kind: Secret
    metadata:
      name: my-registry-key
    data:
      # Contains repo authentication information
      # Example: AWS ECR token and access information
      .dockerconfigjson: base-64-encoded-value-of-the-config-json-file
    # Type of Secret
    type: kubernetes.io/dockerconfigjson

    ```

2.  Deployment on K8s using Image Repository Secret

    Deploy app to pod, spec has image name with tag

    `my-app-deployment.yaml`

    ``` yaml

    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: my-app-two
      labels:
        app: my-app-two
    spec:
      replicas:
      selector:
        matchLabels:
          app: my-app-two
      template:
        metadata:
          labels:
            app: my-app-two
        spec:
          # Image repository credentials
          # Secret must be in same namespace for deployment
          imagePullSecrets:
            - name: my-registry-key-two
          containers:
            - name: my-app-two
              # Example image name with tag: 12414.ecr.amazonaws.com/my-app:1.2
              # containing repository
              image: IMAGE_NAME_HERE
              # Force pull on deployment
              imagePullPolicy: Always
              ports:
                - containerPort: 3000

    ```

    ``` shell

    # Deploy app and check it
    kubectl apply -f my-app-deployment.yaml
    kubectl get pod

    ```

## Kubernetes Operators for Managing Complex Application

### Stateless Applications on K8s

- Use case:
  - Create a Deployment, ConfigMap, Service. Do deployment and changes
    with configurations like updates and scaling
  - No backups needed
  - K8s will check and try to keep desired state from configuration
    files

### Stateful Applications on K8s without Operators

- Needs data persistence
- Replica state, order, and identity, management
- Usually require manual intervention - human operators
- Can be useful to host stateful application outside of K8s
- Though some applications are for K8s like Prometheus and etcd

### About K8s Operators

- Operators are mainly used for Stateful applications use case
- Replaces human operator with software operator
  - Moves deployment of application to operator, recover, updates
  - Uses same control loop of K8s, watch for changes: Observe \> Check
    difference \> Take action
- Makes use of Custom Resource Definitions (CRD), a custom K8s component
  that extends the K8s API
  - Domain/application-specific knowledge

1.  Who Creates Operators?

    - Built by teams that understand the application (Prometheus,
      Postgres, elastic, mysql)
    - See listings at <https://operatorhub.io/>
    - There is an Operator SDK to create their own operator

### Summary

- K8s manages lifecycle of stateless applications
- Stateful application doesn't natively automate stateful applications,
  operators can meet that need

## Secure your cluster - Authorization with RBAC

About Module: Authentication and authorization in K8s,
users/groups/permissions, role based acccess control (RBAC), K8s
resources for permissions

### Need for Permissions

- Multiple teams like administrators, developers are using the cluster

  - Developer teams are using different namespaces

- Security best practice is least privilege rule

- K8s API Server needs to authenticate users and based on authorization
  (role), users will be granted permissions

### RBAC

- RBAC can set permissions for a role, then bind to a specific Namespace

  - Permissions
  - Which resources in namespace

- Can create role for each team and their namespace

- Bind user or group to role with a RoleBinding

- K8s administrators access?

  - They need cluster wide operators
    - Roles are limited to namespaces
  - ClusterRole defines resources and permissions cluster wide
  - Use ClusterRoleBinding to bind user/groups to the ClusterRole

### User and Groups Management

- K8s doesn't manage users and needs an external source for
  authentication like:
  - Static token file - like a csv file with tokens, users, groups
  - Certificates - created certificates for use by users
  - 3rd Party Identity Service - like LDAP
- Administrator will configure external source - K8s admin will need to
  manage the connection to the authentication option
  - API Server handles authentication of all requests, will use
    authentication method
    - For example, using token file, server will check token

### Authorization for Applications, Service Accounts

- Apps inside and outside cluster

- K8s component that represents an application user is called
  ServiceAccount

- `kubectl create serviceaccount s1`

- Link ServiceAccount to Role with RoleBinding or ClusterRole with
  ClusterRoleBinding

  - ServiceAccount will get permissions in the role

### Role Configuration Files

Role configuration file elements:

- name: name of role
- metadata: like namespace
- apiGroups: can be blank
- resources: like pods, secerts
- verbs: list, create, get
- resourceNames: specific pods/apps

ClusterRole

- resources: namespaces and other resources likd pods

RoleBinding configuration file:

- resources: like nodes

### Creating and Viewing RBAC Resources

``` shell

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

## Microservices in Kubernetes

### Introduction to Microservices

- Example microservices, social media website services:
  - User
  - Messenger
  - Content
  - Blogs
- Changes in 1 microservice does not affect other services
  - In practice, each service can be developed by separate team
- How do microservices communicate? Different options:
  - Service to service API calls, communicate code is inside each
    service
  - Message Broker can manage communication between services
    - Example: Redis, RabbitMQ
  - Service Mesh
    - Each service has its own helper application (K8s SideCar
      container), like a proxy that does communication
      - Example: Istio

### Microservices and DevOps

- Role of DevOps is to deploy existing microservices application in K8s
  cluster

What would DevOps team need to know?

- What microservices to deploy
- Microservices to microservices communications
- How are services communicating, ports
- Other integrations like databases

Then, prepare K8s environment:

- Deploy 3rd party apps
- Create Secrets, ConfigMaps
- Create Deployment and Service for each microservices

## Demo project: Deploy Microservices Application

### Code Repositories

The link for the project used in this lecture can be found here:
<https://github.com/techworld-with-nana/microservices-demo>﻿

The config file used for the microservices demo can be found here:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/helm-chart-microservices/-/blob/main/config.yaml>

### Demo Overview

- Example microservices application for an online shop, could be used by
  DevOps team or developer team to deploy to an K8s
- Uses microservices-demo project from Google
  <https://github.com/GoogleCloudPlatform/microservices-demo>
  - Services are in /src folder
  - To deploy, don't need to know details of code. For DevOps, should
    know:
    - What microservices are being deployed
    - How are they connected
      - Data flow diagram of services and users, other integrations
    - Use of 3rd party services like databases, other platforms,
      existing infrastructure - what do services depend on
    - Which Service(s) is accessible externally

### Microservice Example Application Architecture

- Example data flow:
  <https://github.com/techworld-with-nana/microservices-demo/blob/main/docs/img/architecture-diagram.png>

- User \> Frontend \> CartService \> Redis cache

- Load Generator is an optional deployment to check application, it is
  testing component and not for deployment

- Frontend connects to other services, other services also connect to
  other services

- Need to know:

  - Image names
  - From data flow, know connections
  - Ports each service starts on

- Only 1 developer team, so they can be deployed to 1 namespace

### Create Deployment and Service Configurations

- Each microservice will need for deployment:
  - Deployment with pod(s) info
  - Service with port info
- Will need to deploy 10 services and Redis, so 11 services
- Use labels to group each service with its service selector
- Ensure Service targetPort is same as Deployment containerPort

## Production & Security Best Practices

The link to the project used in this lecture can be found here:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/helm-chart-microservices>

## Demo project: Create Helm Chart for Microservices

The link to the Microservices Helm Chart project can be found here:
<https://gitlab.com/twn-devops-bootcamp/latest/10-kubernetes/helm-chart-microservices>

## Demo project: Deploy Microservices with Helmfile

## See Also

- [kubectl, oc Openshift, Other K8s related command Snippets
  Snippets](../005-computer-snippets-kubectl-oc-kube) - [kubectl, oc
  Openshift, Other K8s related command Snippets
  Snippets](id:1b0d6d70-3fc0-4246-bec2-425fe12d454f)
