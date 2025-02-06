---
filetags: ":kql:snippets:epubnote:"
id: 45cb5a49-50ec-4159-843c-34195f380ee7
title: KQL Snippets
---

``` kql

// Check activity in scope of log
AzureActivity

// Check activity bound by time range
AzureActivity | where TimeGenerated > startofday(datetime("2021-09-14")) and TimeGenerated < endofday(datetime("2021-09-14"))

AzureActivity | where TimeGenerated >= datetime("2025-01-05T16:00:00") and TimeGenerated < datetime("2025-01-05T17:00:00")

// Summary like log of recent Azure Activity
AzureActivity
| where TimeGenerated > ago(7d)
| project TimeGenerated , OperationName, ActivityStatus, ResourceGroup, Caller, Level

// Check audit events (e.g. SQL Security)
AzureDiagnostics

AzureDiagnostics | where TimeGenerated >= datetime("2024-12-13T00:00:00") and TimeGenerated < datetime("2024-12-13T23:59:00")

// Check audit events for Event Hub
AzureDiagnostics
| where ResourceProvider == "MICROSOFT.EVENTHUB"

// Check Azure usage?
Usage
| order by TimeGenerated desc

// Get all AppRequests records
AppRequests

// Get all AppRequests records and pipe to filter where result code is 200
AppRequests
| where ResultCode == ```200```

// Function App logs - select all fields
FunctionAppLogs

// Function App logs - select non informational logs
FunctionAppLogs
| where Level != 'Information'

// Function Error rate
// Summarizing functions success and errors per hour.
FunctionAppLogs
| where Category startswith "Function." and Message startswith "Executed "
| parse Message with "Executed '" Name "' ("  Result ", Id=" Id ", Duration=" Duration:long "ms)"
// | where Name == "MyFunction" // Use this to restrict to a specific function
| summarize count() by bin(TimeGenerated, 1h), Name, Result, _ResourceId
| order by TimeGenerated desc

// Get all Security Events for a VM, sort by time and get 10 most recent records
SecurityEvent
| sort by TimeGenerated desc
| take 10

// Get all events with two conditions, use multiple where commands for futher conditions.
// Where in this case uses the AND operator
SecurityEvent
| where Level == 8
| where EventID !=4688

// Similar to above, but restrict time to 3 days ago.
//  TimeGenerated will overwrite any time settings in the logging console
SecurityEvent
| where Level == 8
| where EventID !=4688
| where TimeGenerated > ago(3d)

// Same as above, but select which columns to display
SecurityEvent
| where Level == 8
| where EventID !=4688
| where TimeGenerated > ago(3d)
| project TimeGenerated , Computer , Activity

// Same as above, extend maintains previous query and adds another column.
// This extend also calls a function to extract a part of the EventCode
SecurityEvent
| where Level == 8
| where EventID !=4688
| where TimeGenerated > ago(3d)
| project TimeGenerated , Computer , Activity
| extend EventCode = substring(Activity, 0, 4)

// Summarize the query above by computer and include the EventCode
// Pipe all to the render command see a chart. Without render, it will appear as a table
SecurityEvent
| where Level == 8
| where EventID !=4688
| where TimeGenerated > ago(3d)
| project TimeGenerated , Computer , Activity
| extend EventCode = substring(Activity, 0, 4)
| summarize count() by Computer , EventCode
| render piechart

// Get performance data from last 7 days
// With a filter and summarize the counter value average over 1 hour increments
Perf
| where TimeGenerated > ago(7d)
| where CounterName == "Available MBytes"
| summarize avg(CounterValue) by bin(TimeGenerated, 1h)
| render timechart

// Find authenticate errors in Azure Activity related to a resource
AzureActivity
| where ActivityStatusValue == ```Failed```
| where OperationName contains "Authenticate"
| where TimeGenerated > ago(7d)
| project TimeGenerated, OperationName, OperationNameValue, Resource

// Similar to above, but find counts of errors by days
AzureActivity
| where ActivityStatusValue == ```Failed```
| where OperationName contains "Authenticate"
| where TimeGenerated > ago(7d)
| summarize count() by bin(TimeGenerated, 1d)

// Check activity for a user in last 30 days
AzureActivity
| where Caller contains "John.Smith"
| where TimeGenerated > ago(30d)

// ==== Check Streaming Analytics Errors ====

// List all input data errors
// Shows all errors that occurred while processing the data from inputs.
// To create an alert for this query, click '+ New alert rule'
AzureDiagnostics
| where ResourceProvider == "MICROSOFT.STREAMANALYTICS" and parse_json(properties_s).Type == "DataError"
| project TimeGenerated, Resource, Region_s, OperationName, properties_s, Level, _ResourceId


// Operations that have "Failed"
// Shows all operations on your job that have resulted in a failure.
// To create an alert for this query, click '+ New alert rule'
AzureDiagnostics
| where ResourceProvider == "MICROSOFT.STREAMANALYTICS" and status_s == "Failed"
| project TimeGenerated, Resource, Region_s, OperationName, properties_s, Level, _ResourceId

// Summary of all errors in the last 7 days.
AzureDiagnostics
| where TimeGenerated > ago(7d) //last 7 days
| where ResourceProvider == "MICROSOFT.STREAMANALYTICS"
| extend ErrorType = tostring(parse_json(properties_s).Type)
| summarize Count=count(), sampleEvent=any(properties_s)  by ErrorType, JobName=Resource

// ASA Authentication error
// Operations that have "Failed"
// Shows all operations on your job that have resulted in a failure.
// To create an alert for this query, click '+ New alert rule'
AzureDiagnostics
| order by TimeGenerated
| where ResourceProvider == "MICROSOFT.STREAMANALYTICS" and status_s == "Failed" and OperationName == "Authenticate: The job has encountered an authentication error at ResponseComments. Please ensure that the account name is configured properly and the job's Managed Identity has access to SQL."
| project TimeGenerated, Resource, Region_s, OperationName, properties_s, Level, _ResourceId

// ASA SQL Connection errors periodically
// All output data errors
// Shows all errors that occurred while writing the results of the query to the outputs in your job.
// To create an alert for this query, click '+ New alert rule'
AzureDiagnostics
| where ResourceProvider == "MICROSOFT.STREAMANALYTICS" and parse_json(properties_s).DataErrorType in ("OutputDataConversionError.RequiredColumnMissing", "OutputDataConversionError.ColumnNameInvalid", "OutputDataConversionError.TypeConversionError", "OutputDataConversionError.RecordExceededSizeLimit", "OutputDataConversionError.DuplicateKey")
| project TimeGenerated, Resource, Region_s, OperationName, properties_s, Level, _ResourceId

// Log Analytics Workspace *Table* queries
ADFActivityRun

ADFPipelineRun

ADFTriggerRun

AzureActivity

AzureDiagnostics

AzureMetrics

FunctionAppLogs

StorageBlobLogs

StorageFileLogs

Usage

// 2021-09-17 Azure Stream Analytics Troubleshooting
// All Azure Activity
// The query presents all AzureActivity events between a specific timestamps
AzureActivity
| where ResourceId == "<long_id>"
| where TimeGenerated > startofday(datetime("2021-09-14")) and TimeGenerated < endofday(datetime("2021-09-14"))

```
