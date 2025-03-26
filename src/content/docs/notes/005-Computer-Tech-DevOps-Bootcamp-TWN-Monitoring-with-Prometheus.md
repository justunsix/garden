---
description: Use cases of monitoring of K8s cluster running
  microservices and how to configure monitoring. Understand monitoring
  components and why use monitors.
filetags: ":devops:nana:bootcamp:prometheus:k8s:epubnote:"
id: eadb0377-b4ae-4194-aea6-5fdd9107f04c
title: DevOps Bootcamp - Monitoring with Prometheus
---

Source: My personal notes from DevOps course by TechWorld with Nana

## Overview

Demo will include:

- Create K8s cluster
- Deploy microservices app
- Deploy Prometheus monitoring stack
- Monitor nodes, K8s components like pods, application metrics including
  redis
  - Deploy Redis exporter and application libraries to allow Prometheus
    to pull metrics
- Monitoring includes:
  - Infrastructure: CPU, RAM, Network
  - Platform: K8s components
  - Application: 3rd party, own applications
- Metrics are pulled with Promotheus and allow visualization with
  Grafana and Grafana dashboard
- Alert on unusual behaviour - configure in Prometheus
  - Alert rules
  - Email notifications

## Introduction to Monitoring with Prometheus

- Prometheus is a monitoring tool for dynamic container environments
  like K8s, docker swarm, and can also monitor traditional, bare metal
  servers
  - Common for container and microservices infrastructure

### Use Case for Monitoring

- Use case: Need to know the status of services and what might be wrong
  - 100s of processes, interconnected
  - Many locations
  - Need to know problems like latency, crashes, errors, capacity
    issues, bugs
- Example: A server ran out of memory and that node failed running pods
  serving databases for authentication services. An app using that
  authentication service fails. To a users, they cannot log in.
  - Operations works back to problem from user perspective
  - Ideal to have a tool constantly monitoring all services, alert on
    service problems or proactive on possible problems like potential
    memory running out on server
- Example: logs no longer being stored, storage space ran out
  - Tool could monitor potential storage issues coming on a threshold,
    like 50% on a life critical application
- Example: app is slow as one service sending many error message on
  network
  - Monitor network loads for capacity issues

### Prometheus Architecture

Prometheus Server which contains:

- Time Series Database
  - Storage
  - Stores metrics data
- Data Retrieval Worker
  - Pulls metrics data from applications, services, servers
  - Stores into Time Services database
- HTTP Server
  - Accepts queries, PromQL queries
  - Web UI
  - Can be used by other UIs like Grafana

### Targets and Metrics

- Prometheus can monitor anything like:

  - Linux/Windows server
  - Apache server
  - Application
  - Service, database

- Items monitored are called targets, units on monitored targets can be
  like:

  - CPU
  - Memory
  - Disk space
  - Errors
  - Requests, request duration
  - Counts

- Unit you want to measure is called a metric and are stored in database

- Metrics are in a human readable format and text based

  - Metrics entries are TYPE and HELP attributes, example below
    - HELP: describes metric
    - TYPE: 3 metrics type
      - Count: how many times x happened
      - Gauge: current value of x?
      - Histogram: how long, or how big?

``` txt

# HELP http_requests_total Total number of HTTP API requests
# TYPE http_requests_total counter
http_requests_total{api="add_product"} 4633433

# HELP memory_usage_bytes Current memory usage in bytes
# TYPE memory_usage_bytes gauge
memory_usage_bytes{instance="host1"} 943348382

# HELP request_duration_seconds Duration of HTTP requests in seconds
# TYPE request_duration_seconds histogram
request_duration_seconds_bucket{le="0.1", method="GET"} 2400
request_duration_seconds_bucket{le="0.2", method="GET"} 3000

# HELP api_response_size_bytes Size of API responses in bytes
# TYPE api_response_size_bytes summary
api_response_size_bytes{api="get_user"} 1500

```

### Collecting Metrics from Targets

- Data Retrieval Worker pulls over HTTP from targets
  - Pulls from HTTP endpoints: host<sub>address</sub>/metrics
  - Endpoint Metrics must be in correct format
- Some target endpoints will have support and others need exporters
  - Exporters gets metrics from the target and exposes /metrics endpoint
    for Prometheus
  - Can use 3rd party exporters
    - Example:
      - Linux server, use node exporter
      - mysql, use a side car container using an exporter container
        image

1.  Monitoring Own Applications

    - Example: want to see how many requests, exceptions, server
      resources used
    - Use client libraries to expose /metrics endpoint in app
      - Infrastructure can then pull metrics

### Monitoring Systems

Push systems:

- Most other monitoring systems use push systems, where services push to
  a centralized collection platform
- Can result in high load of network traffic with central platform as
  bottleneck
- Requires software or tool to push metrics

Pull systems:

- Multiple instances can pull metrics data, decentralized
- Insight if service is up and running if /metrics is down

Pushgateway:

- Example: What happens when target only runs for a short time?
- Can use a pushgateway where short lived job pushes metrics at exit,
  Prometheus will pull metrics later

### Configuring Prometheus

- Set what to scrape and when with `prometheus.yaml`
  - Which target
    - Prometheus can monitor itself at `localhost:9090` with /metrics at
      that path
  - Interval
  - Rules for aggregating metric values or creating alerts when
    condition is met like threshold
    - Rules will create new time series entries and alerts
- Define your own jobs
  - Targets and intervals

### Alert Manager

- Prometheus can trigger alerts through a configured channel like Email,
  messaging platform

### Prometheus Data Storage and Querying

- Time Series Database is custom format and cannot directly write to a
  relational database
- Can store in local or remote storage
- Queries using PromQL Query Language to look at target metrics
- Data Visualization tools like Prometheus web UI and Grafana can us
  PromQL
  - Grafana UI can create dashboards

Example Queries

``` promql

# Query all HTTP status codes except 4xx ones
http_requests_total{status!~"4..."}

# Return the 5-minute rate of the http_requests_total metric for the past 30 minutes
rate(http_requests_total[5m])[30m]

```

### Prometheus Characteristics

Advantages:

- Reliable
- Stand alone, self contained
- Works even if other parts of infrastructure is broken
- Relatively low set up needs due to low complexity

Disadvantages:

- Difficult to scale
- Limits monitoring
  - Workarounds:
    - Increase server capacity
    - Limit number of metrics

1.  Scaling using Prometheus Federation

    - Scalable cloud apps need monitoring that also scales
    - Federation allows Prometheus servers to scrape from other
      Prometheus servers

### Prometheus with Docker and K8s

- Prometheus compatible with Docker and K8s
  - Has Docker images
  - Monitoring of K8s cluster node resources out of the box

## Install Prometheus Stack in Kubernetes

The microservices YAML file used in the lecture is part of the project
found here:
<https://gitlab.com/twn-devops-bootcamp/latest/16-prometheus/monitoring>

### Options on Prometheus deployment to K8s Cluster

- Create all configuration YAML files yourself and execute in order (not
  recommended)
  - Prometheus
  - Grafana
  - Alertmanager
  - StatefulSet, ConfigMap Secret
  - Deployments
- Using an operator
  - Operator is like a Management of all Promethus components, manages
    them as one unit
  - Find an operator for Prometheus and deploy in K8s cluster
- Using a Helm chart to deploy the operator (Recommended)
  - Maintained by Prometheus
  - Helm does setup, operator manages it

### Install Prometheus on AWS EKS - Demo

- Create an EKS cluster
  - Deploy Microservices application
- Deploy Prometheus Stack
- Monitor K8s Cluster and Microservices application

``` shell

# Create K8s cluster in default region with default AWS credentials
# with 2 worker nodes, takes 10-15 mins
eksctl create cluster

kubectl get node

# Deploy microservices application
kubectl apply -f config-microservices.yaml

# Deploy Prometheus monitoring stack
## https://github.com/prometheus-community/helm-charts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Install Prometheus in own namespace
kubectl create namespace monitoring
helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring

# Check deployment
kubectl get all -n monitoring
## See above mentioned components are installed

```

1.  Components of Prometheus deployed with Helm Chart, Managed by
    Operator

    Prometheus is setup and Worker Nodes and K8s components are being
    monitored by default

    - Deployments
      - Operator
      - Grafana
      - kube-state-metrics
        - Has its own helm chart
        - Scrapes K8s metrics
      - ReplicaSet of above deployment
    - Daemonset - runs on every worker Node
      - node-exporter
        - Connects to server and translates Worker Node metrics to
          Prometheus metrics
    - Services
    - StatefulSet
      - Prometheus server
      - Alertmanager
    - ConfigMap
      - Managed by Operator
      - Configurations for different parts
      - How to connect to default metrics
      - Default rules
    - Secrets
      - Certificates, credentials
      - For Grafana, Prometheus, Alert Manager
    - Custom Resource Definiations (CRD)

    1.  Looking at Components

        Use `kubectl get` and `describe -o yaml` to explore each
        component, take away is understand how to add/adjust rules and
        change Prometheus configuration

        - Prometheus:
          - See container and its parameters
          - Mounts (certs, config, rules, web config)
            - Configuration data, targets (/metrics endpoints) and
              intervals
            - Rules: alert rules
          - config-reloader - side container with parameters
            - Reloading when configuration file changes
            - Can access config, rules files
            - Mounts
              - With Secrets
        - Alertmanager
          - Container
          - Mounts
        - Operator - orchestrator of monitoring stack
          - Container
          - Mount (cert)
        - ConfigMap
          - Comes with default rules and configurations
          - `describe configmap` to see default rules

## Data Visualization with Prometheus UI

### Goal now is decide what to monitor

- Want to see when unexpected happens with
  - Cluster Node
  - Applications
- Observe anomalies
  - CPU spikes
  - Low storage
  - High load
  - Unauthorized requests
- Analyze and react

How to get this information?

- Need visible monitoring data
- What data is available from cluster, application, K8s component?

### Prometheus User Interface UI

Activate web UI:

``` shell

# Check service information for monitoring-kube-prometheus-prometheus access the user interface
kubectl get svc -n monitoring

# Set Port forward service for user's localhost
kubectl port-forward service/monitoring-kube-prometheus-prometheus -n monitoring 9090:9090 &

```

- Open UI at localhost:9090
- Browse targets: Status \> Targets
  - See metrics endpoints, state, what is being monitored
- Look up metrics using search or use Metrics Explorer (globe button)
  - CPU, container processes
- Configuration: Status \> Configuration
  - See jobs
    - Jobs = Collection of Instances (endpoints that can be scrape) with
      the same purpose, like application
      - Example API server endpoints will be grouped in a job with
        label: job="apiserver"
        - In Status \> Configuration, see job for apiserver
  - Each metric will have job, instance identifier
    - Can be used to filter metrics when searching
- Prometheus UI is good to see overview, configuration, but not ideal
  for visualization

## Introduction to Grafana User Interface (UI)

- Grafana can access metrics form Prometheus server and present them
  with visualizations

- Enable Grafana UI

``` shell

kubectl get svc -n monitoring

# Set Port forward service for user's localhost
kubectl port-forward service/monitoring-grafana -n monitoring 8080:80 &

```

- Open Grafana on localhost:8080
- Default login configured in helm chart is
  - user: admin
  - password: prom-operator
- Dashboards \> Browse list available
  - Hierarchy:
    - Folders
      - Dashboards
        - Rows
          - Panels
  - Dashboards are a set of panels
    - Panels are a measurement:
      - Number, tables, visualization like graphs
    - Add rows, groups of panels,
      - Example rows: CPU, memory, tables of namespace and metrics
        - Drill down into Node (Pods) to see CPU usage
          - Helps identify which application CPU usage
        - Can change time period
        - Can edit panel
          - See PromQL query/queries used to create visualization
  - Default dashboards will be available in folders
    - Example: Kubernetes Compute Resources Cluster
- PromQL - basic PromQL queries can meet most monitoring use cases

### Create a Dashboard

- In panel creation, select metric (same list as Prometheus metric
  explorer), labels, values
  - Select visualization options like graph styles, table display
  - Need to know name of metrics

### Resource Consumption of Nodes

- Go to: Dashboards \> Nord Exporter \> nodes
  - See cluster CPU, memory, storage per node
  - Example: different people/teams will be interested in different
    metrics:
    - Network
    - Application
    - Load

### Demo: Create an Anomaly

- Trigger a CPU spike using a script to visit the online application in
  a loop
  - Using curl

``` shell

# Create a pod to run script
kubectl run curl-test --image=radial/busyboxplus:curl -i --tty --rm

# Get frontend app endpoint
kubectl get svc
## Look for endpoint IP of front end external

vi script.sh
# Bash script to run 10,000 times, curl command
for i in $(seq 1 10000)
do
    # Output to file
    curl endpoint_ip > text.txt
done

chmod +x script.sh

sh script.sh

```

- After running script, see spikes in dashboards:
  - K8s / Compute Resources of Cluster Dashboard
  - K8s / Compute Resources / Node (Pods)

### Configure Users

- Go to Administration \> Users and Access

- How does Grafana know about Prometheus connection?

  - See Connections \> Data Sources

### Grafana Data Source

- New sources can be added, Grafana supports other built in data
  sources, see with Add Data Source button
- [Listing of data
  sources](https://grafana.com/docs/grafana/latest/datasources/#built-in-core-data-sources)
- Grafana is a data visualization tool for many other types of sources,
  Prometheus is just one of them
  - Allow queries of other data sources

## Alert Rules in Prometheus

Goal: configure monitoring to notify us when something unusual happens,
for example:

- CPU usage over 50%
- Pod cannot restart
- Send notification
  - Alertmanager will send out note

### Alerting Demo

- In dashboard, we know average CPU usage like 20-40% max, if it exceeds
  50%, trigger than alert
- Prometheus UI Main page \> Alerts
  - See existing alerts, mostly for Prometheus stack, etcd, K8s cluster
    - See configuration under each rule
  - Status:
    - Inactive
    - Firing - alert has happened, alert sent to Alertmanager

Example alert configuration

``` yaml

alert: AlertmanagerFailedReload
    # Expression like if statement, alert trigger
    # Written in PromQL:
    # - querying function of max_over_time
    #   - with 5 minute interval
    # - metric
    # - with filters: job, namespace
    # - Condition == 0 means failure
    expr: max_over_time(alertmanager_config_last_reload_successful{job="monitoring-kube-prometheus-alertmanager",namespace="monitoring"}[5m] == 0)
    # Duration to wait to see if expression above continues
    # For example, alert will fire after 10 minutes of above expr being true
    for: 10m
    labels:
      # critical, warning to prioritize
      severity: critical
    annotations:
      # $labels comes from metric
      description: Configuration has failed to load for {{ $labels.namespace }}/{{ $labels.pod }}.
      # Explanation of the issue
      runbook_url: https://runbooks.prometheus-operator.dev/runbooks/alertmanager/alertmanagerfailedreload/
      # Summary of issue
      summary: Relaoding an Alertmanager configuration has failed.

```

- Can add more labels for example to help manage where notification go
  to, for example all critical severity, go to a messaging platform and
  label with app goes to app team
- When condition happens, alert will be in pending state until `for:`
  duration is reached, then alert will be in firing state

## Create own Alert Rules - Part 1 CPU usage, Pod stopped

- Create `alert-rules.yaml`

``` yaml

# High CPU load alert
name: HostHighCpuLoad
# Metric: node_cpu_seconds_total with mode=idle filter
# Query function: rate over 2 mins and average the rates by node / instance
# Convert to percentage, 100 minus the value to get activate percentage time
# Check if average activity is greater than 50
expr: 100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[2m])) * 100) > 50
# Condition must last for 2 minutes before firing
for: 2m
labels:
  severity: warning
  # Label for use later in alertmanager configuration
  namespace: monitoring
annotations:
  # Show value of CPU load
  description: "CPU load on host is over 50%\n Value = {{ $value }}\n Instance = {{ $labels.instance }}\n"
  summary: "Host CPU load high"
  runbook_url: https://your.runbook.com/info

```

## Create own Alert Rules - Part 2

- See Prometheus configuration alert rules: Status \> Configuration
  - Note `rule_files` location
- Use Prometheus Operator, Custom Resource Definition (CRD) to add
  alerts
  - Prometheus Operator is maintained by RedHat and part of OpenShift,
    see operator documentation on `monitoring.coreos.com/v1` for CRD
    information for `PrometheusRule` at
    <https://docs.openshift.com/container-platform/4.10/rest_api/monitoring_apis/prometheusrule-monitoring-coreos-com-v1.html>
  - Without the operator, you would have to add rule file to the
    Prometheus rule location
  - With Operator in K8s, it will take the rule file, put it into the
    configuration and ask Prometheus to reload it, Operator won't allow
    manual updates to the configuration (it will overwrite changes)

Updated `alert-rules.yaml` in Operator CRD format

``` yaml

# Prometheus Operator CRD
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: main-rules
  namespace: monitoring
  labels:
    app: kube-prometheus-stack
    release: monitoring
spec:
  groups:
    - name: main.rules
    - rules:
        # Name of alert for High CPU load
        - alert: HostHighCpuLoad
          # Metric: node_cpu_seconds_total with mode=idle filter
          # Query function: rate over 2 mins and average the rates by node / instance
          # Convert to percentage, 100 minus the value to get activate percentage time
          # Check if average activity is greater than 50
          expr: 100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[2m])) * 100) > 50
          # Condition must last for 2 minutes before firing
          for: 2m
          labels:
            severity: warning
            # Label for use later in alertmanager configuration
            namespace: monitoring
          annotations:
            # Show value of CPU load
            description: "CPU load on host is over 50%\n Value = {{ $value }}\n Instance = {{ $labels.instance }}\n"
            summary: "Host CPU load high"
            runbook_url: https://your.runbook.com/info
        # Alert for pod crash, restart loop
        - alert: KubernetesPodCrashLooping
          expr: kube_pod_container_status_restarts_total > 5
          for: 0m
          labels:
            severity: critical
            namespace: monitoring
          annotations:
            description: "Pod { $labels.pod } is crash looping\n Value = {{ $value }}"
            summary: "Kubernetes pod crash looping"

```

Apply the CRD for Prometheus Operator to pick up rules

``` shell

kubectl apply -f alert-rules.yaml

# Get rules
kubectl get PrometheusRule -n monitoring
## See the main-rules added

# Get pods
kubectl get pod -n monitoring

# Look at logs of prometheus logs
kubectl logs prometheus-monitoring-kube-prometheus-prometheus-number
## See Reload triggered if rulefiles

# See prometheus was loaded new configuration
kubectl logs prometheus

```

- In Prometheus UI, see new Alerts configured

## Create own Alert Rules - Part 3 Testing the Rule

- Simulate a high CPU load, using a new pod with an application a
  accumulates CPU load
  - use image: `containerstack/cpustress` from Docker Hub
- Prepare by adding a panel in a dashboard in Grafana with the rule from
  the CPU load: 100 - (avg
  (rate(node<sub>cpusecondstotal</sub>{mode="idle"}\[2m\])) \* 100) \>
  50
  - Set a percentage for easier reading

``` shell

# Run specified image with parameters
## cpu-test : name of pod
## --image= : name of image, in this case from Docker Hub
## -- <text> : parameters for image
kubectl run cpu-test --image=containerstack/cpustress -- --cpu 4 --timeout 30s --metrics-brief

```

- See in Grafana that average CPU usage metric is raising
- In Prometheus UI \> Alerts, see high CPU load alert is pending the
  `for: 2m` duration

## Introduction to Alertmanager

- In rule configured in last module, the alert was firing and sent to
  the Alertmanager
  - As no notifications were configured, nothing was done with the alert

### About Alertmanager

- Alertmanager is its own application and has its own configuration
- It has its own UI

``` shell

kubectl port-forward svc/monitoring-kube-prometheus-alertmanager -n monitoring 9093:9093 &

```

### Alertmanager configuration overview

- See UI at 127.0.0.1:9093
- See configuration at Status
  - Will have default at start
    - global
      - like global variables that can be used in other sections
    - route
      - Where to send which alerts where
      - matchers
        - matches on certain conditions like labels or names and which
          receiver to use
      - interval
      - group alerts or not
    - receivers
      - Notification integration - where alerts are sent to, for example
        email, messaging platform
      - By default, null is set, alerts are not sent anywhere

      <!-- -->

      - inhibit rules
        - Suppress notifications on target alerts, example can be useful
          when more serious alerts need to be seen like in a outage and
          suppress other ones

## Configure Alertmanager with Email Receiver

Project used for upcoming modules:
<https://gitlab.com/twn-devops-bootcamp/latest/16-prometheus/monitoring>

### Configuration inside K8s Cluster

- From kubectl describe, see alertmanager config-volume to see where
  configuration is stored
- It is stored in a secret which can be viewed with

``` shell

kubectl get secret alertmanager-monitoring-kube-prometheus-alertmanager-generated -n monitoring -o yaml

# Decode and unzip secret to see actual yaml
echo <secret_contents> | base64 -D | gunzip | less

```

- Configuration is managed by the Operator. Like Prometheus Alert Rules,
  CRDs can be used to update the Alertmanager configuration
- See CRD at: \#
  <https://docs.openshift.com/container-platform/latest/rest_api/monitoring_apis/alertmanagerconfig-monitoring-coreos-com-v1beta1.html>
  - Note API version can change
  - Use it to write the configuration file

### Alertmanager Configuration

``` yaml

# alert-management-configuration.yaml
apiVersion: monitoring.coreos.com/v1beta1
kind: AlertmanagerConfig
metadata:
  name: main-rules-alert-config
  namespace: monitoring
spec:
  route:
    # Apply to all routes
    receiver: "email"
    repeatInterval: 30m
    # Child routes
    routes:
      # Match to existing rule names
      - matchers:
          - name: alertname
            value: HostHighCpuLoad
      - matchers:
          - name: alertname
            value: KubernetesPodCrashLooping
        # Higher repeat interval for a more critical alert on pod crash
        repeatInterval: 10m
  receivers:
    # See docs for different receiver types
    - name: "email"
      emailConfigs:
        - to: "destination@domain.com"
          from: "from.name@domain.com"
          # SMTP
          smarthost: "smtp.gmail.com:587"
          authUsername: "myname@gmail.com"
          authIdentity: "myname@gmail.com"
          authPassword:
            # Use K8s Secret instead of putting it here
            name: gmail-auth
            key: password
          # Whether to send notification alert is clear
          sendResolved: true
          # Option Headers template
          # headers:


---
# email-secret.yaml

# Just example, not normally checked into source control
# Store email receiver authentication secret
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: gmail-auth
  # Name namespace as Alertmanager config
  namespace: monitoring
data:
  password: base64-encoded-value-of-your-password

```

- Note email from automation is usually blocked by providers though
  there are methods. For email, recommend to use 2 step authentication,
  then set up an app password with the email provider for use in the
  Alertmanager

Apply configurations

``` shell

# Apply Secret first
kubectl apply -f email-secret.yaml

kubectl apply -f alert-manager-configuration.yaml

# Confirm changes
kubectl get alertmanagerconfig
kubectl logs
# -c See container
alertmanager-monitoring-kube-prometheus-alertmanager-0 -n monitoring -c config-reloader

```

- In Alertmanager UI, see configuration above is now added to the
  default configuration
  - Receiver will be named with a custom config, then the name defined
    in the above file
  - There are slight changes like a matcher for the namespace and
    default values for email receiver configuration

## Trigger Alerts for Email Receiver - Test email notification

``` shell

# Remove existing cpu loader
kubectl delete pod cpu-test

# Can increase timeout to trigger alert
kubectl run cpu-test --image=containerstack/cpustress -- --cpu 4 --timeout 60s --metrics-brief

```

- See alerts that fired in Alertmanager
  - <http://127.0.0.1:9093/api/v2/alerts>
  - Check for alert name HostHighCpuLoad

Example, note syntax may not be 100% correct

``` json

"annotations": {
"description": "CPU load on host01.example.com has exceeded 90%.",
"summary": "High CPU load on host01.example.com"
},
"receivers": <email receive information>
"startsAt": "2024-11-06T12:00:00Z",
"endsAt": "0001-01-01T00:00:00Z",
"generatorURL": "http://prometheus.example.com/graph?g0.expr=avg%28rate%28node_cpu_seconds_total%5B1m%5D%29%29&g0.tab=1",
"labels": {
"alertname": "HostHighCpuLoad",
"instance": "host01.example.com",
"severity": "critical",
"namespace": "monitoring"
},

```

- Email will contain labels, annotations, instance and other information

- if email did not arrive, check alertmanager logs, like authentication
  errors

- To test the pod crash loop alert, leave the cpu-test pod running, it
  will eventually trigger the KubernetesPodCrashLooping alert

- Again check alerts that fired in Alertmanager:

  - <http://127.0.0.1:9093/api/v2/alerts>

## Monitor Third-Party Application

- Previous modules covered monitoring
  - K8s components
  - Resources on Nodes
  - Prometheus stack
- Want to monitor Redis cache and microservices
- Monitor if:
  - Too much load
  - Too many connections
  - Low capacity, memory
  - Redis/application is down

### How to monitor applications themselves?

- Use Prometheus exporters
  - They connect to a service and get metrics, than translates to time
    services format for Prometheus and exposes /metrics endpoint for
    Prometheus
  - Need to set deploy a ServiceMonitor (K8s custom resource with CRD)
    that tells Prometheus about the Exporter's location

## Deploy Redis Exporter

- Use: <https://github.com/oliver006/redis_exporter>
- How to deploy? reuse a Helm Chart:
  <https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-redis-exporter>
  - Repository has charts for other services
  - Check `values.yaml` for defaults and what can be overridden
- Redis Helm chart:
  - ServiceMonitor - describes set of targets to be monitored
  - Get redis SVC name with `kubectl get svc | grep redis`
  - We are using a Redis without connection protection by default,
    otherwise would need to set authentication information in values
    file
  - Note values has PrometheusRule definition, in demo will do redis
    rulse separately due to rules likely to change over time

`redis-values.yaml` for use in Helm Chart

Install Chart, install redis exporter:

``` shell

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
helm repo update

helm install redis-exporter prometheus-community/prometheus-redis-exporter -f redis-values.yaml

# Check deployment
helm ls
# See new redis exporter pod
kubectl get pod
kubectl get servicemonitor
kubectl get servicemonitor redis-exporter-prometheus-redis-exporter -o yaml

kubectl describe svc redis-exporter

```

- In Prometheus UI, see Status \> Targets
- See new redis exporter is detected and metrics is being scraped
- In metrics explorer, new redis metrics will be available

## Alert Rules & Grafana Dashboard for Redis

- Goal: Notify whenever Redis is down and when there are too many
  connections
- Reuse Awesome Prometheus alerts that are written for common services
  and use cases: <https://samber.github.io/awesome-prometheus-alerts/>

`redis-rules.yaml`

``` yaml

# Prometheus Operator CRD
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: redis-rules
  # Leave in default namespace where redis is running
  labels:
    app: kube-prometheus-stack
    release: monitoring
spec:
  groups:
    # Rules from https://samber.github.io/awesome-prometheus-alerts/rules#redis
    - name: redis.rules
      rules:
        # Alert on redis outage immediately
        - alert: RedisDown
          expr: redis_up == 0
          for: 0m
          labels:
            severity: critical
          annotations:
            summary: Redis down (instance {{ $labels.instance }})
            description: "Redis instance is down\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"
        - alert: RedisTooManyConnections
          # If over 90% of max clients, trigger
          expr: redis_connected_clients / redis_config_maxclients * 100 > 90
          for: 2m
          labels:
            severity: warning
          annotations:
            summary: Redis too many connections (instance {{ $labels.instance }})
            description: "Redis has {{ $value }} connections\n  LABELS = {{ $labels }}"


```

``` shell

kubectl apply -f redis-rules.yaml

```

- See in Prometheus UI Alerts that Redis rules are there and inactive
  status

### Trigger Redis Outage

``` shell

kubectl edit deployment redis-cart
# Change replicas to 0
# See alert
# Change replicas back to 1

```

- Alert will trigger when the scrape interval is up, set during Helm
  Chart configuration with `interval`

### Redis Dashboard in Grafana

- Goal: see visualization of Redis status
- How to create?
  - Manually create it
  - Reuse existing dashboards from Grafana Labs dashboards listing:
    <https://grafana.com/grafana/dashboards/>
    - Verify it is using the exporter you are using and metrics present
      in your cluster

1.  Import Grafana Dashboard

    - Go to your Grafana \> Dashboard
    - Copy the dashboard ID from grafana.com/dashboards
    - Name the dashboard
    - Configure the data source
    - The dashboard will list it is getting data from the exporter (IP
      from `kubectl describe svc redis-exporter`)
    - See PromQL in each panel

## Collect & Expose Metrics with Prometheus Client Library (Monitor own App - Part 1)

Module will use these files:
<https://gitlab.com/twn-devops-bootcamp/latest/16-prometheus/nodejs-app-monitoring>

Goal: Monitor custom applications

### How to Monitoring Custom Applications?

- Need to use Prometheus client libraries that match the language of the
  application
- Interface to expose metrics
- Libraries implement the Prometheus metric types

Demo will:

- Expose metrics in a NodeJS application with a NodeJS Prometheus client
  library
- Deploy NodeJS app
- Configure Prometheus to scrape the new target (ServiceMonitor)
- Visualize metrics in Grafana

### NodeJS Client Library

- App will listen on port 3000
- Want to expose metrics:
  - Number of Requests
  - Duration of Requests
    - If requests too slow, want to let developers know
  - Possible interactions:
    - DevOps teams asks Development Team to expose metrics
    - Demo assumes developers have added the library
- In app NodeJS, dependency is prom-client
  - In `server.js`:
    - By default, there are default metrics collected
    - http requests total are collect with a counter
    - http request duration is histogram type: Histogram metric type
      - Sample observations and counts them in configurable buckets
      - Measure size and frequency
    - /metrics endpoint is exposed in application and can be see at
      <http://localhost:3000/metrics>

Excerpt of `server.js` with client libraries constants

``` javascript

// Prometheus client library - Collect default metrics
const client = require("prom-client");
const collectDefaultMetrics = client.collectDefaultMetrics;
// Probe every 5th second.
collectDefaultMetrics({ timeout: 5000 });

// Prometheus client library - HTTP requests metric
const httpRequestsTotal = new client.Counter({
  name: "http_request_operations_total",
  help: "Total number of Http requests",
});

// Histogram metric type
// Using configurable buckets
// In this case, how many request in the
// given time bucket
const httpRequestDurationSeconds = new client.Histogram({
  name: "http_request_duration_seconds",
  help: "Duration of Http requests in seconds",
  buckets: [0.1, 0.5, 2, 5, 10],
});

// Set contentType, time series
// Send metrics to /metrics, available in browser
app.get("/metrics", async (req, res) => {
  res.set("Content-Type", client.register.contentType);
  res.end(await client.register.metrics());
});

// Simulate a request time
// Actual code would not have simulation
app.get("/", function (req, res) {
  // Simulate sleep for a random number of milliseconds
  var start = new Date();
  var simulateTime = Math.floor(Math.random() * (10000 - 500 + 1) + 500);

  setTimeout(function (argument) {
    // Simulate execution time
    var end = new Date() - start;
    // Use Prometheus client library
    httpRequestDurationSeconds.observe(end / 1000); //convert to seconds
  }, simulateTime);

  httpRequestsTotal.inc();
  res.sendFile(path.join(__dirname, "index.html"));
});

```

### Deploying application

1.  Build Image, Push to Repository

    - Build image, then push to private repo in Docker Hub
    - Use Dockerfile

    ``` Dockerfile

    FROM node:13-alpine

    RUN mkdir -p /usr/app

    # Copy frequently changing files first
    COPY package*.json /usr/app/
    COPY app /usr/app/

    WORKDIR /usr/app

    EXPOSE 3000

    # Get dependencies
    RUN npm install
    CMD ["node", "server.js"]

    ```

    Steps belows can also be automated with CICD

    ``` shell

    # Build image
    docker build -t user/demo-app:nodeapp .

    docker login
    docker push user/demo-app:nodeapp

    ```

2.  Deployment App into K8s Cluster

    - Set up deployment: `k8s-config.yaml`
    - Requires Docker Hub secret set up below

    `k8s-config.yaml`

    ``` yaml

    ---
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: nodeapp
      labels:
        app: nodeapp
    spec:
      selector:
        matchLabels:
          app: nodeapp
      template:
        metadata:
          labels:
            app: nodeapp
        spec:
          # Secret for image pull Docker Hub
          imagePullSecrets:
            - name: my-registry-key
          containers:
            - name: nodeapp
              image: nanajanashia/demo-app:nodeapp
              ports:
                - containerPort: 3000
              imagePullPolicy: Always
    ---
    apiVersion: v1
    kind: Service
    metadata:
      name: nodeapp
      labels:
        app: nodeapp
    spec:
      type: ClusterIP
      selector:
        app: nodeapp
      ports:
        - name: service
          protocol: TCP
          # Based on Dockerfile
          port: 3000
          targetPort: 3000

    ```

    ``` shell

    kubectl create secret docker-registrry my-registry-key --docker-server=https://index.docker.io/v1/ --docker-username-nanatwn --docker-password=password

    kubectl apply -f k8s-config.yaml

    # Verify deployment
    kubectl get pod
    kubectl get svc
    # Test app on localhost
    kubectl port-forward svc/nodeapp 3000:3000

    ```

    - Test app localhost:3000, populate metrics

## Scrape Own Application Metrics & Configure Own Grafana Dashboard (Monitor own App - Part 2)

### Create ServiceMonitor

- Configure Prometheus to scrape Node App /metrics endpoint
- Add ServiceMonitor CRD to the node app deployment yaml

Complete `k8s-config.yaml` with ServiceMonitor added

``` yaml

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nodeapp
  labels:
    app: nodeapp
spec:
  selector:
    matchLabels:
      app: nodeapp
  template:
    metadata:
      labels:
        app: nodeapp
    spec:
      # Secret for image pull Docker Hub
      imagePullSecrets:
        - name: my-registry-key
      containers:
        - name: nodeapp
          image: nanajanashia/demo-app:nodeapp
          ports:
            - containerPort: 3000
          imagePullPolicy: Always
---
apiVersion: v1
kind: Service
metadata:
  name: nodeapp
  labels:
    app: nodeapp
spec:
  type: ClusterIP
  selector:
    app: nodeapp
  ports:
    # Name of port, for use in ServiceMonitor later
    - name: service
      protocol: TCP
      # Based on Dockerfile
      port: 3000
      targetPort: 3000
---
# Prometheus CRD
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: monitoring-node-app
  labels:
    # Used by Prometheus to match all ServiceMonitor
    release: monitoring
    app: nodeapp
spec:
  # Define endpoints for scraping
  endpoints:
    - path: /metrics
      # Name from deployment
      port: service
      targetPort: 3000
  namespaceSelector:
    # Match to namespace where app is running
    # optional match any
    # any: true
    matchNames:
      - default
  selector:
    # Find application with nodeapp label
    matchLabels:
      app: nodeapp

```

Apply updated configuration

``` shell

kubectl apply -f k8s-config.yaml

```

- Check Prometheus UI localhost:9090 from port forward before and see
  new target of node app is scraping
  - In metrics explorer, see http<sub>requestoperationstotal</sub>,
    http<sub>requestduration</sub> metrics are available
  - In configuration, see new job name for monitoring-node-app

### Create Grafana Dashboard

- Create New dashboard

http requests per second:

- Create panel for Node App: Requests per second
  `http_request_operations_total`
  - Want to see requests per second to check load
  - Use PromQL, graph visualization:
    `rate(http_request_operations_total[2m])`
- Visit app many times
- Check dashboard again to see spike in requests per second

http<sub>requestdurationsecondssum</sub>:

- Create panel
  - Want to see total requests in an interval
  - PromQL: `rate(http_request_duration_seconds_sum[2m])`
