---
filetags: ":golang:epubnote:index:"
title: Go aka Golang
---

## Why Go - From book Go for Dummies

- Static typing
- C runtime efficiency
- Ease of readability
- Good for microservice apps including:
  - CLI applications
  - Network systems

### Hello World

``` go

package main

import "fmt"

func main() {
  fmt.Println("Hello")
  // type inferred as int
  var num1 = 5
  // Explicit type default set as 0
  var num5 int
}

```

### Go CLI commands

``` bash

go build main.go
# Run hello world program
./main

# Check go environment
go env
## Change GOOS and GOARCH for different
## operating system builds

```

## See Also

- [Golang Todolist app](../005-1-tech-golang-learn-todolist-app) -
  [Golang Todolist app](id:52c0126f-6ec3-4923-a575-a3472ef38681)
- [Go Libraries](../005-1-tech-golang-libraries) - [Golang
  Libraries](id:bec30a9d-eaa6-4237-811b-2cb6ed503832)
