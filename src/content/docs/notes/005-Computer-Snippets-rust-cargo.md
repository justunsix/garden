---
filetags: ":rust:cargo:snippets:epubnote:"
id: 92688ec0-8523-4171-88c2-337e34693607
title: Rust and Cargo Snippets
---

## Rust Command Line Snippets

``` shell

# List packages installed by cargo
cargo install --list

# Unstinall my cargo packages
cargo install --list | awk '{print $1}' | xargs -I{} cargo uninstall {}

# Install a crate from Git URL
cargo install --git https://github.com/atuinsh/atuin/

# Install cargo binaries with binstall if they are available
cargo install cargo-binstall
cargo binstall atuin

# Uninstall a package
cargo uninstall cargo-update

```

### Programming with cargo and rustc

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

# Explain a compiler error with rustc --explain
rustc --explain E0284

# Rust Debugging using GUI with rust-gdbgui and gdbgui
rust-gdbgui target/debug/myprog

```

### Rustup

``` shell

# Updated rustup
rustup update

# View Rust documentation
rustup doc

# View The Rust Programming Language Book
rustup doc --book

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
// Like case statement with enumerations (enums) of Ordering
// Made up of arms
match guess.cmp(&secret_number) {
        Ordering::Less => println!("Too small!"),
        Ordering::Greater => println!("Too big!"),
        Ordering::Equal => println!("You win!"), // end of line comment
}

// Number of type u32, unsigned default number
let guess: u32

// Read user input using standard library io module
use std::io;
// ...
io::stdin().read_line(&mut guess)

// Variable shadowing, guess string and number
// and error handling with expect()
// and parsing string to another type with parse() and trimming string with trim()
let guess: u32 = guess.trim().parse().expect("Please type a number!");

// Error handling with enumeration (enum) Result types of: Ok Err
let guess: u32 = match guess.trim().parse() {
    Ok(num) => num,
    Err(_) => {
        if guess.trim() == "q" {
            break;
        } else {
            println!("Please enter a number.");
            continue;
        }
    }
};

// Error handling with match statement
let guess: u32 = match guess.trim().parse() {
    Ok(num) => num,
    Err(_) => continue,
};

// Loop that is infinite
loop {
    // do stuff

    // Leave loop with break
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

// Print to standard out with variables using { var_name }
println!("You guessed: {guess}");

```

## Data Types

``` rust

// String, mutable
let mut guess = String::new()

// Scalars - Integers, immutable
let unsignedint : i18 = 1000 // or 1_000 where _ is visual separator

// Rust's default integer is i32
let defaultint : i32 = 3253

// isize and usize integers can be good for collection indexes

// Floating point, signed decimals
let defaultfloat : f64 = 2.0

// Floating point literal 32.0 used in calculations
let celsius: f64 = (input - 32.0) / 1.8;
println!("The celsius of {input} F is {celsius} C")

// Numeric operators, Booleans, and Character types
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

    // remainder, modulo
    let remainder = 43 % 5;

    let t = true;

    let f: bool = false; // with explicit boolean type annotation

    // Character types
    let c = 'z';
    let z: char = 'ℤ'; // with explicit char type annotation
    let heart_eyed_cat = '😻';
}

// Compound Types - Tuples and Arrays
// Fixed length, can have multiple types
// The variable tup binds to the entire tuple because a tuple is considered a single compound element
// Can use pattern matching to destructure a tuple value, like:
fn main() {
    let tup: (i32, f64, u8) = (500, 6.4, 1);

    let (x, y, z) = tup;

    println!("The value of y is: {y}");

    // Accessing tuple elements by period and index number starting at 0
    let five_hundred = x.0;
    let six_point_four = x.1;
    let one = x.2;

    // Unit is a tuple without any value, empty return type
    let _unit_tup: () = ();
}

// Array Type
// Fixed length, change not allowed, allocated on stack
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

- Use "snake<sub>case</sub>"

``` rust

// Function with integer parameter and multiple parameters
fn main() {
    another_function(5);
    print_labeled_measurement(5, 'h');
}

fn another_function(x: i32) {
    println!("The value of x is: {x}");
}

fn print_labeled_measurement(value: i32, unit_label: char) {
    println!("The measurement is: {value}{unit_label}");
}

// Statements and Expressions
// Statements are instructions that perform some action and do not return a values
// Expressions evaluate to a resultant value

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

    // Println! macro is an expression
    println!("The value of x is: {x}");
}

fn main() {
    // Function call is an expression with let statement
    let x = plus_one(5);

    println!("The value of x is: {x}");
}

fn plus_one(x: i32) -> i32 {
    // Expression returns x plus 1, ; is not present
    x + 1
}

```

## Control Flow

``` rust

// if expressions
fn main() {
    let number = 3;

    if number < 5 {
        // First arm, like match expression
        println!("condition was true");
    } else {
        // Second arm
        println!("condition was false");
    }

    // multiple if else and else if expression
    if number % 4 == 0 {
        println!("number is divisible by 4");
    } else if number % 3 == 0 {
        println!("number is divisible by 3");
    } else if number % 2 == 0 {
        println!("number is divisible by 2");
    } else {
        println!("number is not divisible by 4, 3, or 2");
    }

    // if in a let statement to assign outcome to a variable
    let condition = true;
    let number = if condition { 5 } else { 6 };

    println!("The value of number is: {number}");
}

// Repetition with Loops with loop, while, and for
// Loop with break as an exit
fn main() {
    let mut counter = 0;

    let result = loop {
        counter += 1;

        if counter == 10 {
            // can also return from inside a loop
            // While break only exits the current loop, return always exits the current function
            break counter * 2;
        }
    };

    println!("The result is {result}");
}

// Exit nested loops with a loop label specified by a single quote '
// break and continue wilapply to the innermost loop at that point
// while the loop label allows the keyword to apply to the labelled loop
fn main() {
    let mut count = 0;
    'counting_up: loop {
        println!("count = {count}");
        let mut remaining = 10;

        loop {
            println!("remaining = {remaining}");
            if remaining == 9 {
                break;
            }
            if count == 2 {
                // Exit outer loop with 'counting_up label
                break 'counting_up;
            }
            remaining -= 1;
        }

        count += 1;
    }
    println!("End count = {count}");
}

// Loops with a conditional using while
fn main() {
    let mut number = 3;

    while number != 0 {
        println!("{number}!");

        number -= 1;
    }

    println!("LIFTOFF!!!");
}

// Loops within a range using for, most used type of loop sice it is concise and safer
fn main() {
    let a = [10, 20, 30, 40, 50];

    for element in a {
        println!("the value is: {element}");
    }

    // For loop using a stadard library Range of numbers
    for number in (1..4).rev() {
        println!("{number}!");
    }
    println!("LIFTOFF!!!");
}

// For loop with a loop index variable using enumerate()
for (gift_index, day) in days.into_iter().enumerate() {
    let gift_of_day = gifts[gift_index];
    println!("On the {day} of Christmas\nmy true love sent to me:");
    // First Day
    if gift_index == 0 {
        println!("{gift_of_day}\n");
    } else {
        println!("{gift_of_day}");
        let mut previous_gifts_index = gift_index - 1;
        while previous_gifts_index > 0 {
            let previous_gift = gifts[previous_gifts_index];
            println!("{previous_gift}");
            previous_gifts_index -= 1;
        }
        let first_gift = gifts[0];
        println!("and {first_gift}\n")
    }
}

```

## Memory Allocation

``` rust

// Explicitly drop (deconstruct) an object sooner than its current scope using std::mem::drop
// as drop(), which is a empty function, takes ownership of the object and drops it after execution
fn main() {
    let recorder = Recorder::new();
    std::mem::drop(recorder);

    println!("Further work");
}

```
