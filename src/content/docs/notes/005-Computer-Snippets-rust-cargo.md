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

/* Match Expression
   Made up of arms */
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


```
