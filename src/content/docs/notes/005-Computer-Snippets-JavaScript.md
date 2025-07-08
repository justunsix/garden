---
filetags: ":javascript:snippets:epubnote:"
id: 9d66cc02-f8c7-46e0-8f92-da79b107f1c7
title: JavaScript Snippets
---

## Console

``` javascript

// In web browser console, allow editing directly on web page
// Useful for viewing content changes
document.designMode = "on";

```

## Basics

### Datatypes and Variables

``` javascript

// Numbers - example: number of likes, prices
// Integer - whole numbers
0

// Decimal
0
35.6
-40

// String - example: letters, words, symbols, anything on your keyboard
// 0 or more characters
"a"
"a long string"
'another string'
"5"
"first.name@email.com"

// Character
"a"

// Boolean
// - example: wrong password, invalid email (incorrect),
// available (true)
true
false

// Array - example: list of friends, comments
["John", "Mary", "Ralph"]
[4, 4.6, 6]
// Data types can be mixed in array

// Object - example: product review has group of information
// written using curly braces { ... }
// Any datatype can be used inside an object, as well as objects
{authorName: "user12", rating: 5, explanation: "great product", images ["imageLink1", "imageLink2"]}

// Array of objects
[
    {authorName: "user12", rating: 5, explanation: "great product", images ["imageLink1", "imageLink2"]},
    {authorName: "user62", rating: 4, explanation: "great product", images ["imageLink6", "imageLink7"]},
    // Other objects

]

// Working with numbers - example: calculate prices, distances
3 + 4
6 * 5
// Strings with + will combine strings
// String concatenation
"12" + "12" = "1212"

// Variable
var userName = "app-user-A"
var price = "50"
// Display $50
"$" + 50

// var, let, const
// variables that will not change
const = "Brand Name"

// variables that can change, but not recreated
let userName = "James"

```

### Conditions and Operators, Functions

``` javascript

// Equality comparision

// Set variable
let age = 30
// True equality check of values
age == 30
// False, equality check of values and data type
// using triple equals ===, good practice to use it most of time
age === "30"

// Not equals comparison
let userMembership = "regular"
if (userMembership !== "premium"){
    // show user regular content
} else {
    // show premium content
}

// Comparisions
let totalPrice = 19
// False - check greater than
totalPrice > 20
// True - check greater than, equal to
totalPrice >= 19

// If, else conditions
let totalPrice = 19;
let shippingCost;
if (totalPrice <= 10) {
    shippingCost = 0
} else if (totalPrice <= 20 ){
    shippingCost = 3
} else {
    shippingCost = 0
}

// Logical AND, OR || operators
// OR operator
(totalPrice > 20 || premiumMember === true)

// AND operator
(today === birthday && birthdayDisplayed === true)

// Negate condition with !()
!((totalPrice > 20 || premiumMember === true))

// Log text with variable
console.log(`Shipping cost for you is ${shippingCost}`);

// Function with no parameters and void return
function calculateShippingCost() {
  let totalPrice = 19;

  if (totalPrice <= 10) {
    shippingCost = 5;
  } else if (totalPrice <= 20) {
    shippingCost = 3;
  } else {
    shippingCost = 0;
  }

  console.log(`Shipping cost for you is ${shippingCost}`);
}

```

## Debugger

``` javascript

function startsWithJ(array) {
  {const jStudents = [];
    // Add debugger, will run in things like web tools or node inspect
    debugger;
    for (let i = 0; i < array.length; i++) {
      const currentStudent = array[i];
      const firstLetter = currentStudent[0];
      if (firstLetter === "J") {
        jStudents.push(currentStudent);
      }
    }
  }
  return jStudents;
}

```

## Other

``` javascript

// Sleep, set a timeout
setTimeout(1000);

```

## Bookmarklets

Source: [What are Bookmarklets? How to Use JavaScript to Make a
Bookmarklet in Chromium and
Firefox](https://www.freecodecamp.md/news/what-are-bookmarklets/)

Creating a bookmarklet is like creating a regular bookmark in the
browser. Instead of the URL HTTP/HTTPS in the URL field, write
JavaScript.

Avoid comments in Bookmarklets to prevent issues at run time

``` javascript

// Bookmarklet with (() => { }) as an anonymous (lambda) function
// Select a button inside a specific div
// Click dismiss for each topic
// generate and return HTML
// function within a bookmarklet
javascript: (() => {
    alert('Dismissing topics');
    const selector = 'div[aria-label=Dismiss][role=button]';
    const topics = document.querySelectorAll(selector);

    for (let i = 0; i < topics.length; i++) {
      let topic = topics[i];
      setTimeout(() => topic.click(), i * 250);
    }

    function hello() {
        alert("Hello World!")
    }

    return '<h1 style="color: white; background-color: black;">Hello, World!</h1>';
})();

// Find unique emails on page
javascript: (() => {
  const documentHTML = document.documentElement.outerHTML;
  const matches = documentHTML.matchAll(/[\w.+=~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*/g);
  const flatMatches = Array.from(matches).map((item) => item[0]);
  const uniqueMatches = Array.from(new Set(flatMatches));

  if (uniqueMatches.length > 0) {
    const result = uniqueMatches.join('\n');
    alert(result);
  } else {
    alert('No emails found!');
  }
})();

// Change all font elements
javascript: (() => {
  const allElements = document.querySelectorAll('*');

  for (let element of allElements) {
    element.style.fontFamily = 'Comic Sans MS';
  }
})();

// Menu system using functions and alert messages
javascript:(function() {
    function extractText() {
        alert("my extract text function")
    }

    function showMenu() {
        const menuOptions = `
            Please choose an option:
            1. Extract text
            2. Option 2 (Add your own function here)
            3. Option 3 (Add your own function here)
            4. Exit
        `;
        const choice = prompt(menuOptions);

        switch (choice) {
            case '1':
                extractText();
                break;
            case '2':
                // Call another function here
                alert('Option 2 selected. (Function not implemented)');
                break;
            case '3':
                // Call another function here
                alert('Option 3 selected. (Function not implemented)');
                break;
            case '4':
                alert('Exiting menu.');
                break;
            default:
                alert('Invalid choice. Please try again.');
                showMenu(); // Show the menu again for invalid input
        }
    }

    // Show the menu when the bookmarklet is activated
    showMenu();
})();

```

``` html

<!-- Create a link for someone to bookmark the link as a bookmarklet -->
<a href="javascript: (() => {   alert('Hello, World!'); })();">
  Hello, World!
</a>

```
