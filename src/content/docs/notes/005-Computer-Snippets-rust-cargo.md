---
filetags: ":rust:cargo:snippets:epubnote:"
id: 92688ec0-8523-4171-88c2-337e34693607
title: Rust Cargo Snippets
---

## Rust Command Line Snippets

``` shell

# List packages installed by cargo
cargo install --list

# Unstinall my cargo packages
cargo install --list | awk '{print $1}' | xargs -I{} cargo uninstall {}

```

### Programming

``` shell

# Create a new project
cargo new my-project

# Run the project
cargo run

# Check project compiles, but do not make binary
cargo check

# Build the project for development
cargo build

# Build for release with opimtizations
cargo build --release

# Build and see documentation for current project and dependencies
cargo doc --open

# Update non-breaking packages
cargo update

# Compiling and running
rustc main.rs
## Linux, macOS, nix systems
./main
## Windows
.\main.exe

```

### Rustup

``` shell

# Updated rustup
rustup update

# View Rust documentation
rustup doc

# Add rust-analyzer
rustup component add rust-analyzer

# Uninstall cargo and rust
rustup self uninstall

# Install components like LSP, formatter, linter
rustup component add rust-analyzer rustfmt clippy

```

## Rust Language Examples

``` rust

// Trait - The Rng trait defines methods that random number generators implement
use rand::Rng;

// Example of multiple line comments
// Match Expression
// Made up of arms
match guess.cmp(&secret_number) {
        Ordering::Less => println!("Too small!"),
        Ordering::Greater => println!("Too big!"),
        Ordering::Equal => println!("You win!"),
}

// Number of type u32, unsigned default number
let guess: u32

// Variable shadowing, guess string and number
let guess: u32 = guess.trim().parse().expect("Please type a number!");

// Loop that is infinite
loop {
    // do stuff

    // break out of loop
    break;
}

// Result type and error handling
let guess: u32 = match guess.trim().parse() {
        Ok(num) => num,
        Err(_) => continue,
};

// Immutable variable
let x = 5;

// Mutable variable
let mut x = 5;

// Constant - hard coded unchanging value
const THREE_HOURS_IN_SECONDS: u32 = 60 * 60 * 3;

// Shadowing - allow changes to variable value
// with same name using let and variable
let x = 5;
let x = x + 1; // x is 6

```

## Data Types

``` rust

// Scalars - Integers
let unsignedint : i18 = 1000 // or 1_000 where _ is visual separator

let defaultint : i32 = 3253

// isize and usize integers can be good for collection indexes

// Floating point, signed decimals
let defaultfloat : f64 = 2.0

// Numeric operators and Booleans types
fn main() {
    // addition
    let sum = 5 + 10;

    // subtraction
    let difference = 95.5 - 4.3;

    // multiplication
    let product = 4 * 30;

    // division
    let quotient = 56.7 / 32.2;
    let truncated = -5 / 3; // Results in -1

    // remainder
    let remainder = 43 % 5;

    let t = true;

    let f: bool = false; // with explicit type annotation
}

// Compound Types - Tuples and Arrays
// Fixed length, can have multiple types
// The variable tup binds to the entire tuple because a tuple is considered a single compound element
// Can use pattern matching to destructure a tuple value, like:
fn main() {
    let tup = (500, 6.4, 1);

    let (x, y, z) = tup;

    println!("The value of y is: {y}");
}

// Array Type
// Fixed length, cannot be changed, allocated on stack
fn main() {
    let a = [1, 2, 3, 4, 5];
}

#![allow(unused)]
fn main() {
let months = ["January", "February", "March", "April", "May", "June", "July",
              "August", "September", "October", "November", "December"];
}

// Array using square brackets with the type of each element, a semicolon,
// and then the number of elements in the array
#![allow(unused)]
fn main() {
let a: [i32; 5] = [1, 2, 3, 4, 5];
}

// Create array with same value for each element by
// specifying the initial value, followed by a semicolon, and then
// length of the array in square brackets
#![allow(unused)]
fn main() {
    let a = [3; 5];
    // Accessing array elements
    let first = a[0];
    let second = a[1];

}

```

## Functions

- Use snake<sub>case</sub>

``` rust

// Function with parameter
fn main() {
    another_function(5);
}

fn another_function(x: i32) {
    println!("The value of x is: {x}");
}

// Statements and Expressions
// Statements are instructions that perform some action and do not return a values
// Expressions evaluate to a resultant value. Let’s look at some examples.

let y = 6; // a statement

fn main() {
    let y = 6;
    // expression evaluating to 7
    y + 1
}

// Functions with return values
fn five() -> i32 {
    5
}

fn main() {
    let x = five();

    println!("The value of x is: {x}");
}

fn main() {
    let x = plus_one(5);

    println!("The value of x is: {x}");
}

fn plus_one(x: i32) -> i32 {
    // return
    x + 1
}



```
