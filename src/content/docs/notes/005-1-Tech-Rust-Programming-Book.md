---
filetags: ":rust:cargo:snippets:epubnote:"
id: e130960f-bd15-4667-9625-acf1c2a8abc4
title: The Rust Programming Language, The Book (Book)
---

Source: My notes from book: [The Rust Programming
Language](https://doc.rust-lang.org/stable/book/) \[fn:1\] and book
source at [rust-lang/book: The Rust Programming Language ·
GitHub](https://github.com/rust-lang/book)

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

Code examples of game at [justunsix/rust-tests: Tests with Rust language
· GitHub](https://github.com/justunsix/rust-tests) \[fn:2\].

## 3 - Rust features that are similar to those of other programming languages

See data types, functions, loops, control flow at [Rust and Cargo
Snippets](/garden/notes/005-computer-snippets-rust-cargo) - [Rust Cargo
Snippets](id:92688ec0-8523-4171-88c2-337e34693607)

## 4 - Ownership system

### Stack and Heap

Stack - The stack stores values in the order it gets them and removes
the values in the opposite order. This is referred to as last in, first
out (LIFO).

- Fixed size data that is known
- Example: stack of plates
- Pushing to stack is faster than heap allocation

Heap - less organized than stack. Memory allocator find empty space in
heap of a certain size and marks it as in use and returns a pointer
(address of the location on heap).

- Process is called `allocating on the heap`
- Example: table at restaurant where host (memory allocator) finds a
  seat for you and guests can ask host where you are later
- Slower to access data on heap due to following pointer

#### Stack and Heap Running

When calling a function, values passed to function which could be
pointers to data on heap and function's local variables are pushed to
stack. When function is over, values are popper off the stack.

#### Relation to Ownership

Ownership helps with:

- Minimizing duplicate data on heap
- Cleaning up unused data on heap to avoid space problems

### Ownership Rules

Rust defines thee ownership rules \[fn:1\]:

> - Each value in Rust has an owner.
> - There can only be one owner at a time.
> - When the owner goes out of scope, the value will be dropped.

Example of rules in practice where a variables scope has a limited life
time:

``` rust

{ // s is not valid here, since it's not yet declared
  let s = "hello";   // s is valid from this point forward
  // do stuff with s
} // this scope is now over, and s is no longer valid

{
  let s = String::from("hello"); // s is valid from this point forward
  // do stuff with s
} // this scope is now over, and s is no
  // longer valid
  // drop() is automatically called on the variable to return the memory
  // https://doc.rust-lang.org/std/mem/fn.drop.html

let s1 = String::from("hello");
let s2 = s1;
// s1 is no longer valid
// s2 will hold the pointer to the heap where the "hello" string is stored

```

#### Resource Acquisition Is Initialization (RAII)

> In C++, this pattern of deallocating resources at the end of an item’s
> lifetime is sometimes called Resource Acquisition Is Initialization
> (RAII). The drop function in Rust will be familiar to you if you’ve
> used RAII patterns.

Deallocation may also be called using the resource's deconstructor to
free up memory used by the resource.

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

- [Rust and Cargo Snippets](/garden/notes/005-computer-snippets-rust-cargo)

## References

- \[fn:1\] [The Rust Programming
  Language](https://doc.rust-lang.org/stable/book/), Steve Klabnik, Carol
  Nichols, and Chris Krycho, with contributions from the Rust Community.
  “The Rust Programming Language - the Rust Programming Language.”
  Doc.rust-Lang.org, doc.rust-lang.org/stable/book/. 2026
- \[fn:2\] [justunsix/rust-tests: Tests with Rust language ·
  GitHub](https://github.com/justunsix/rust-tests)
