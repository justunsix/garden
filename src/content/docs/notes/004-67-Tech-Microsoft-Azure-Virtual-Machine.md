---
date: 2024-06-14
filetags: ":microsoft:azure:virtual-machine:epubnote:"
id: d35fe92e-9ada-4e3a-b191-819cd44a8330
title: Azure Virtual Machine
---

## Monitor your Azure Virtual Machines with Azure Monitor

Source: [Monitor your Azure virtual machines with Azure
Monitor](https://learn.microsoft.com/en-gb/training/modules/monitor-azure-vm-using-diagnostic-data/?WT.mc_id=Portal-Microsoft_Azure_Compute&source=learn)

### Use case

- Virtual machines (VM) are hosting business services and we need to
  monitor to ensure they can host effectively without causing
  unnecessary costs.
- To ensure availability of business services, respond to access,
  security, and performance issues.

### Monitoring VMs

Monitoring features:

- Azure Monitor Metrics - collected to describe things like performance,
  utilization, errors, users
- Azure Monitor Logs - system events with timestamp and data, available
  at Azure resource level. Stored in log analytics workspace

VM Monitoring Layers

- Host - compute, storage, network, state, disk
  - Can trigger alerts, use for pattern analysis, cost control
- OS
- Client workloads
- Applications in VM

OS and below monitoring requires Azure Monitor Agent.

### Monitor VM host data (Lab)

- Create a VM in portal and check it's built in monitoring features
  - Create a Linux VM with alert and boot diagnostics
  - Start VM and see collection of basic metrics and activity logs
  - View built in metrics graphs, activity logs, boot diagnostics

1.  Use Metrics Explorer to view detailed host metrics

    - Metrics explorer has charts to display VM CPU, data and other
      metrics
    - Add metrics in the explorer and change types of charts and
      aggregation type like Avg, Min, Max

2.  Collect client performance counters by using VM insights

    - To monitor operating system workloads and applications, the Azure
      Monitor Agent needs to be installed inside the VM
    - VM insights:
      - Installs Azure Monitor Agent on your VM.
      - Creates a data collection rule (DCR) that collects and sends a
        predefined set of client performance data to a Log Analytics
        workspace
      - Presents the data in workbooks

3.  Collect VM client event logs

    - Set up a data collection rule (DCR) to collect Linux VM syslog
      data and view log data in log analytics using Kusto Query Language
      (KQL)
    - Created DCRs can select from different performance counters and
      sampling rates or custom counters
