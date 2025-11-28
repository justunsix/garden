---
filetags: ":rust:cargo:snippets:epubnote:"
id: e130960f-bd15-4667-9625-acf1c2a8abc4
title: The Rust Programming Language, The Book
---

## Second Edition

## 1 - Getting Started, Installing Rust, Hello World

Recommendations

- Use rustfmt for code formatting
- For IDE support, see rust-analyzer

## 2 - Programming a Guessing Game

- By default, Rust brings in a set of items in the standard library
  called the prelude. It is in scope for every program.

- For types outside the prelude, need a `use` statement to bring it in
  explicitly

- `Result` from the `io::stdin().read_line(&mut guess)` in an
  enumeration, also called enum. Enums have variants. For `Result` it is
  `Ok` (operation succeeded) and `Err` (operation failed). The
  `expect()` method is called during an `Err` variant.

## 3 - Rust features that are similar to those of other programming languages

## 4 - Ownership system

## 5 - Structs and methods

## 6 enums, match expressions, and the if let control flow construct, Use structs and enums to make custom types in Rust.

## 7 module system and privacy rules for organizing your code and its public Application Programming Interface (API)

## 8 Common collection data structures that the standard library provides, such as vectors, strings, and hash maps.

## 9 error-handling philosophy and techniques

## 10 generics, traits, and lifetimes, power to define code that applies to multiple types

## 11 - testing

## 12 - project to build subset of grep CLI tool

## 13 - closures and iterators, features from functional programming

## 14 - cargo and best practices for sharing libraries

## 15 - smart pointers from standard library, traits

## 16 - concurrent programming, multiple threads

## 17 - Rust idioms and comparing to object oriented programming

## 18 - patterns and pattern match

## 19 - advanced topics: unsafe rust, macros, lifetimes, traits, types, functions, closure

## 20 - project to implement low-level multithreaded web server

## See Also

- [Rust and Cargo Snippets](/garden/notes/005-computer-snippets-rust-cargo) - [Rust
  Cargo Snippets](id:92688ec0-8523-4171-88c2-337e34693607)
