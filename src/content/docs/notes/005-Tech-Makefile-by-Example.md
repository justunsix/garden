---
filetags: ":makefile:epubnote:"
id: dbbd3429-31a7-4f1a-98c9-8c639f6f667b
title: Makefile by Example
---

Source: [Makefile Tutorial By Example](https://makefiletutorial.com)

## Getting Started

- Makefiles exist to decide whick parts of a large program need to be
  recompiled
- Alternatives exist like CMake, Bazel and in Java: Ant, Maven, and
  Gradle, and in other languages specific tools.
- Not required for interpreted languages like Python

``` makefile

files := file1 file2
varx := dude
thing_wrong := *.o # Don't do this! '*' will not get expanded
thing_right := $(wildcard *.o)

targets: prerequisites
    command
    command
    command
    # Reference variabe varx
    echo ${varx}
    echo $(varx)

blah: blah.o
    # compile a file
    cc blah.c -o blah

file1:
    touch file1

clean:
    rm -f blah file1

```

- Make executes the commands
  - Make decides if it should run the blah target. It will only run if
    blah doesn't exist, or blah.c is newer than blah
  - Uses file system timestamps
- `make clean` is often used as a target that removes the output for
  other targets. It is a convention but not a special word in make.
- Variables can only be strings
  - Reference using \${} and \$() like example above
- Single or double quotes have no meaning to Make

## Targets

- `all` target is a convention to run all targets. It will run by
  default if make is called without target
- `$@` is an automatic variable that contains the current target's name

## Automatic Variables and Wildcards

- `*` and `%` are wildcards in Make
  - `*` searches the filesystem for matching filenames
    - Good practice is wrap `*` in a wildcard function as
      `thing_right ... $(wildcard *.o)`
  - `%` can be used as:
    - "matching" mode to match one or more characters in a string. This
      match is called a stem.
    - "replacing" mode, it takes a stem that was matched and replaces
      that in a string
    - Often used to define rules and in functions

### Other Automatic Variables

``` makefile
hey: one two
        # Outputs "hey", since this is the target name
        echo $@

        # Outputs all prerequisites newer than the target
        echo $?

        # Outputs all prerequisites
        echo $^

        touch hey

one:
        touch one

two:
        touch two

```

## Fancy Rules
