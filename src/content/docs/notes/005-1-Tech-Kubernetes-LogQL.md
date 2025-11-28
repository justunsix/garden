---
filetags: ":k8s:logql:epubnote:"
id: bb6c47a4-e8e3-4fa3-a26a-00ab32400e41
title: LogQL
---

Source: [Log Queries \| Grafana Loki LogQL
Documentation](https://grafana.com/docs/loki/latest/query/log_queries/)

``` logql

# Check logs with type error in pod
{ kubernetes_pod_name = "prod-connect-cluster-0" }
| json
| level = "error"


# Log lines that contain an error
{container="frontend"} |= "error"

# Filter on dates
{ kubernetes_pod_name = "prod-connect-cluster-0" } | json | level = "error"

```
