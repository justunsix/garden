---
filetags: ":snippets:epubnote:dotnet:"
id: fcce2f6d-6d6e-4919-8303-f1a59f125457
title: dotnet .NET Snippets
---

Install appropriate SDK or runtime for the application

``` shell

# Build application
dotnet build

# Initialize a new .NET project
dotnet new template_short_name

# Restore NuGet packages
dotnet restore

# Build and execute the .NET project in the current directory
dotnet run

# Run a packaged dotnet application (only needs the runtime, the rest of the commands require the .NET Core SDK installed):
dotnet path/to/application.dll

```
