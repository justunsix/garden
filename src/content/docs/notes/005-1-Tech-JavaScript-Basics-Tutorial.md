---
date: 2025-01-27
description: JavaScript Tutorial for Beginners
filetags: ":javascript:language:epubnote:"
id: d0d19eb8-ef71-4afe-ab6b-51e51bf7071c
title: JavaScript Basics Tutorial
---

Source: [JavaScript Tutorial for Beginners JS Crash Course
2024](https://www.youtube.com/watch?v=FtaQSdrl7YA)

## Introduction

- Websites are built with HTML, CSS, and JavaScript (JS)
- HTML handles the structure of the site content, CSS adds style and
  makes the site beautiful and JavaScript provides interactivity and
  logic.
  - For example, JS allows image uploads, comments, interactive forms
- Websites usually have what a user sees (front end), the back end that
  processes data, and databases that store the data
  - Front end is commonly served with HTML, CSS, and JS
- HTML, CSS, JS files has keywords and structure that a web browser uses
  and written in text editor

### Frameworks and Changes

- HTML, CSS specifications do not change frequently
- JS since it is a logic, it changes frequently. JS has frameworks to
  provide solutions for use cases, like React, Angular, and Vue for
  front end. NodeJS is a framework for back end.
- All JS frameworks still use JS syntax so best to learn that first

### Syntax

- Syntax concepts will be similar for other computer programming
  languages
- Browsers can interpret JS code, have developer tools:
  - See elements
  - Console to write and execute JS. Use console to learn.

## Datatypes and Variables

- Datatypes allow storing data like numbers, words

### What is a Variable, Why they are useful

- Variables store the data under a name like user names, store product
  prices
  - They allow putting/using data in multiple places under name
  - The name of the reference is a variable
  - Use `var` keyword
- Variabe use cases:
  - Multi language text
  - User input stored in variables

## Where to write and execute JS

- Can write into the browser console using browser developer tools
- Save the code into a file, tell the browser to execute the code
  - Can store inside an HTML file

``` html

<script>
  var user = "John"

</script>

<body>

</body>

```

## Jetbrains Webstorm IDE and create new Project

- Best to use an editor or integrated development environment (IDE) that
  helps you with keyword highlighting, see errors
- Suggestion is use WebStorm - made for JavaScript / TypeScript
  development

## var vs let vs const

- let and const prevent accidental overwriting of variables
- For variables that will not change, use `const`
- For variables that will change but will not be re-created, use `let`

## Create index.html file

``` html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>JS App</title>
    <link href="css/style.css" rel="stylesheet" />
    <script>
      let user = "John";
      console.log("User's name:");
      console.log(user);
    </script>
  </head>
  <body>
    This is a JS Application.
  </body>
</html>

```

## Execute HTML file in Browser

- Run the `index.html`
  - Move the file into the browser, drag and drop the file
  - Open the file in your operating system, double click on file
  - Open the file from WebStorm with built in preview
    - Files will be refreshed on save
- Using the developer tools, see elements, console output

## Console.log

- See `console.log` output in browser console

## JavaScript in a separate File (Project Structure)

- As JS content grows, best practice is move JS to a separate file
- Can move existing script to `app.js` file
- Link the HTML file to the `app.js` using `html` `<script>` tag

``` html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>JS App</title>
    <link href="css/style.css" rel="stylesheet" />
    <script src="app.js"></script>
  </head>
  <body>
    This is a JS Application.
  </body>
</html>

```

`app.js`

``` javascript

const standardShippingCost = 6;
const discountedShippingCost = 4;
let totalPrice;

function calculateShippingCost(totalPriceParam) {
  let shippingCost;

  if (totalPriceParam <= 10) {
    shippingCost = standardShippingCost;
  } else if (totalPriceParam <= 20) {
    shippingCost = discountedShippingCost;
  } else {
    shippingCost = 0;
  }

  console.log(`Shipping cost for you is ${shippingCost}`);
  console.log(`Total price ${totalPrice}`);
  console.log("----------------------------");
}

// user starts shopping
totalPrice = 10;
// user does more shopping
totalPrice = 19;
// user is ready to pay
// user adds more items to get free shipping
totalPrice = totalPrice + 5;
calculateShippingCost(totalPrice);

```

## Conditionals and Operators

- Comparisons of data, checking if two values are equal
- Good practice is to use '`=`' triple equals to check it is equal in
  value and data type

## Comparison Operator

- Check if values are higher or lower

## Conditionals (if / else statement)

- Based on conditionals, do different steps

## Logical Operator (AND, OR operator)

- Combine multiple conditions

## Functions in JavaScript

- Use for repeating code
- Similar to a variable, saving a code block and reference it using a
  function name
- Like variables, function needs to be declared and then is called to
  run the logic

## Function Parameters

- Parameters are used when need to give values to functions for
  processing

## Const Use Cases

- Set values that will not change when program is running
- Make it easy to change values in one place to change references
  throughout the program

## Naming Conventions

- Variable and functions use a naming convention called camel case
- Camel case starts with lower case and then capitlize other words

## See also

- [JavaScript Snippets](../005-computer-snippets-javascript) -
  [JavaScript Snippets](id:9d66cc02-f8c7-46e0-8f92-da79b107f1c7)
