---
filetags: ":microsoft:tech:monitoring:epubnote:"
id: 06cce72d-182c-4956-ace3-7c4281dc93b2
title: Microsoft Technology - Azure Monitor
---

## Azure Monitoring

### Monitoring Data

- As soon as you create an Azure resource, Azure Monitor is enabled and
  starts collecting metrics and activity logs. Additional configuration
  allows more data to be gathered.
- Azure Monitor Metrics stores numeric data from monitored resources
  into a time series database. The metric database is automatically
  created for each Azure subscription.
  - Use metrics explorer to analyze data from Azure Monitor Logs.
    - Available from resource's tab
  - Azure Monitor Logs collects logs and performance data where they can
    be retrieved and analyzed in a different ways using log queries.
    - Use a Log Analytics workspace to collect log data and query it
- Resources generate these monitoring data types:
  - Activity log: subscription level events for operations on each
    resource (e.g. starting, modifying a resource configuration)
  - Platform metrics - number values of resources collected at time
    intervals
  - Resource logs - operations done by a resource, e.g. making a
    request, requires a diagnostic setting to send them to logs
  - Virtual machine guest metrics and logs - for guest OSs of VMs,
    requires an agent on the VM
- Activity logs, platform metrics types can be seen in a resource's tab.
  Insights are available in the monitoring menu if available for the
  resource
- Logs can be sent to an log analytics workspace or other storage using
  the resource's diagnostic setting

## See Also

- [Azure Data
  Fundamentals](/garden/notes/004-67-tech-microsoft-azure-data-fundamentals)

### Resources

- [Azure Monitor documentation - Azure Monitor \| Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/azure-monitor/)
- [Monitor Azure resources with Azure Monitor - Azure Monitor \|
  Microsoft
  Learn](https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/monitor-azure-resource)
- [Monitoring Azure Event Hubs - Azure Event Hubs \| Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/event-hubs/monitor-event-hubs)
