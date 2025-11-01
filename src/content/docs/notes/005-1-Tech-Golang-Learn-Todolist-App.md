---
description: Learn about Golang and apply learning to build a todo
  application
filetags: ":go:golang:epubnote:"
id: 52c0126f-6ec3-4923-a575-a3472ef38681
title: Golang Todolist app
---

Source: [Full Golang Tutorial - Learn Go by Building a TodoList
App](https://www.youtube.com/watch?v=XCZWyN9ZbEQ) with TWN

## Why use Golang

Go also known as Golang was Created by Google in 2007 and open source in
2009

### Why use Go? Purpose? and Different from other languages?

Background:

- Infrastructure changes in multicore process, cloud infrastructure, and
  clustering. Providing scale, dynamic infrastructure and capacity.
- Applications could be written to do multiple tasks at once. For
  example, cloud drive managers and video websites allowing multiple
  tasks going for users
- Challenges of multithreading
  - Modifying the same data source
  - Concurrency - conflict management of resources

### Use Case of Go

It is good for applications that need to perform well and run on scaled,
distributed systems.

Go was designed to run on multiple cores and concurrent applications. It
works well for server side and back-end software, for example docker,
HashiCorp Vault, Kubernetes, Cockroach DB, and command line
applications.

## Characteristics and Use Cases

Go tries to combine simple and readable syntax like Python with
efficiency and safety of a statically type language like C++.

Programs usually have fast build, start up and run time and require less
computer resources. It compiles to a binary that can run on different
operating systems.

## Setting up a Development environment

For an integrated development environment, can use
[GoLand](https://www.jetbrains.com/go/) from JetBrains with project
management, compilation, completion, and other features.

Install the Go compiler. If using GoLand, selecting the SDK version will
automatically install it.

To run source in GoLand, press the run button or use terminal.

## Concepts and Syntax

For syntax and `go` commands for building and running programs, see
[Golang Snippets](../005-computer-snippets-golang) - [Golang
Snippets](id:68fa2f78-3752-4893-93a9-0979bee579f4)

Packages are a set of source files available for reuse for application
functionality. They can be browsed at [pkg.go.dev](https://pkg.go.dev).

Use the `net/http` import, HTTP functionality can be added to the
application.
