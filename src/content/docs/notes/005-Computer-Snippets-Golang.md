---
filetags: ":go:golang:tech:snippets:epubnote:"
id: 68fa2f78-3752-4893-93a9-0979bee579f4
title: Golang Snippets
---

``` shell

# Version
go version

# Build program, then run compiled program main
go build main.go
./main

# Build and run program
go run main.go

# Check go environment
go env
## Change GOOS and GOARCH for different
## operating system builds

```

``` go

// String in between quotes " "
"a string"

// Number
5

// Variable with var or :=, useful for dealing with values that appear in multiple places in the code, like duplicated use
var task1 = "Watch Golang Course"

// Variables: multiple declarations, at global level if outside a function
var (
    task2     = "Watch tutorial"
    task3     = "Create Todolist app"
    reward1   = "Reward myself with a smoothie"
    taskItems = []string{task1, task2, reward1, task3}
)

// Slice of strings with []string, list with unlimited items
taskItemsSlice := []string { task1, task2 }
// Slice: add an item with append for slice
append(taskItemsSlice, "My next task")

// Array of items with fixed size [number]<type>
taskItemsFixedLengthArray := [2]string { task1, task2 }

// Declare package for program
package main

// This sentence is a comment
import "fmt"

// Main function, entry point of program
func main() {

  // Variable within function and shorter syntax with :=
  task2 := "Another task using shorter syntax within a function"

  // Print hello
  fmt.Print("Hello")
  // Print string with newline
  fmt.Println(task1)
  // Type inferred as int
  var num1 = 5
  // Explicit type default set as 0
  var num5 int
  fmt.Print(num1+num5)
  // Print with string and variable
  fmt.Println("Tasks: ", taskItemsSlice)

  // Loop: for with index and item for iteration
  for index, task := range taskItems {
      fmt.Println(index, task)
      // Print with format with Printf with placeholders:
      // %d - decimal
      // %s - string
      fmt.Printf("%d. %s\n", index+1, task)
  }
  // index will start with 0

  // Loop: for with index ignored and item for iteration
  for _, task := range taskItems {
      fmt.Println(task)
  }

  // Call function with function name and ()
  printTasks()

  // Call function with parameter inside ()
  printTasks(taskItems)

}

// Function with func for code reuse and easier reading and maintenance
func printTasks() {
    printTasks(taskItems)
}

// Function with argument
func printTasks(taskItems []string) {
    fmt.Println("List of Todos")
    for index, task := range taskItems {
        fmt.Printf("%d. %s\n", index+1, task)
    }
}

// Function with return value
func addTask(taskItems []string, newTask string) []string {
    return append(taskItems, newTask)
}

// Using net/http to server messages on localhost:8080
import (
    "fmt"
    "net/http"
)

func main() {
    cliApp()

    fmt.Println("Starting Web API")

    // Register handlers when serverhost/ pattern is visited in browser
    http.HandleFunc("/", helloUser)
    http.HandleFunc("/show-tasks", showTasks)
    http.ListenAndServe(":8080", nil)
}

func showTasks(writer http.ResponseWriter, request *http.Request) {
    for index, task := range taskItems {
        fmt.Fprintln(writer, index+1, ":", task)
    }
}


```

## See Also

- [Golang Todolist app](../005-1-tech-golang-learn-todolist-app) -
  [Golang Todolist app](id:52c0126f-6ec3-4923-a575-a3472ef38681) -
  application using the basic snippets
