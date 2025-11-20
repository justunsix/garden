---
description: Using pattern to extract elements from text
filetags: ":regex:snippets:epubnote:"
id: 1ff1942e-2077-44a4-9ab1-38401efb2631
title: Regex Regular Expression Snippets
---

Source: [Regular expression syntax cheat sheet - JavaScript \|
MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Cheatsheet) -
Regex syntax and explanations with examples

``` shell

# Match any single character except new line, like a wild card
.

# Quatifiers + * and ? can be used with matches, groups
# Match 1 or many characters with +
.+
# Match 0 or more characters with * (wildcard)
.*
# Match 0 or 1 character with ?
.?

# Match digits (numbers)
\d
# Match digit pattern, like a phone number
\d\d\d-\d\d\d-\d\d\d\d
# Match digit pattern, like a phone number using quantifier
\d{3}-\d{3}-\d{4}

# Match exactly 4 word characters with ^ for start with and $ for end with
^\w{4}$

# Match non digits
\D

# Match word boundary, where word character not followed or preceded by another word character
\b

# Match word character, includes [a-zA-Z0-9_] alpha, number, and underscore characters
\w

# Match 1 or more word characters
\w+

# Match a character optionally with <char>?
ab?c
## Matches abc and ac since b is optional

# Match exact word
'jump'
"hello"
## Matches jump inside jumped or jump by itself

# Match word itself with \b, not surrounded by other characters
'\bfor\b'

# Match 1 or more digits
\d+

# Match any 1 character in a given set using [ ]
[abc]
# Match to a, b, or c, also called character group

# Match either of defined character groups using (  )
Jo(n|hn)
## | is for or
## Match John or Jon for alternate spellings
I love (cat|dog)s

# Group for matching and can be used operations like replace
\d{3}-\d{3}-(\d{4})
## Use a phone number pattern and group last 4 digits

# Group multiple elements with capture groups
(\d{3})-(\d{3})-(\d{4})
## 3 groups will be created for text operations

# Named capture groups
?<areacode>^(\d{3})-(\d{3})-?<last4digits>(\d{4}$)

# Reference capture groups (depends on implementation) with \#
\1
## Capture group 1 with \1
## Capture group 2
\2

# Match words consisting of the same letter repeating exactly 3 times
^([a-zA-Z])\1{2}
# First (brackets) matches a letter, \1 will reference the capture group
# and {2} indicates only match capture group 1, two more times

# Match not characters group
[^dog]
## ^ matches not in character group

# Match ranges
# Match lower case alphabet characters
[a-z]
[n-p]
# Match to not a range
[^a-t]
# Match multiple ranges
[a-z][a-z]
## Matchs any 2 lower case characters together
# Match upper case alpha characters
[A-Z]
# Match numbers 0 through 9
[0-9]
# Match multiple ranges in a single character group
[a-zA-Z0-9]
## Matches all upper and lowercase alpha characters and numbers

# Match start of string with ^
^The

# Match end of string with $
dog$

# Match start and end strings
^The.+dog$
# ^ match start
# .+ 1 or more characters
# $ match end

# Match a specific {number}, or {min,} or {min,max} with quantifiers
^a.{5}g$
## {5} matches exactly 5 characters between a and g
^a.{1,}g$
## {1,} matches at minimum 1 character but can be more
^a.{0,5}g$
## {0,5} matches at minimum 0 characters and maximum 5

# Search for the words "apple" and "banana" in any order
^(?=.*apple)(?=.*banana).*

# search for apple, banana and/or cherry in any order
^(?=.*apple)(?=.*banana)(?=.*cherry).*

# Check an email address, simplified, doesn't work for all emails
^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$
## ^[a-zA-Z0-9]+ match start with 1 or more of character group
## @ match @ character
## \. match . character itself, needs to be escaped, not regex character
## [a-zA-Z0-9]+$ match ending domain of email
## See RFC 5322 for official email regex

# Escaped characters [ ] \ with \
\[part\]backslash_coming\\
# Escape plus (+) sign with \, works for other symbols
\+

# Match tab
\t

# Match newline
\n

# Match whitespace character
\s

# Match non-whitespace character
\S

# Match any character
[\s\S]

# Match with constraint using ?, "lazy" matching
([\s\S])*?[ \t]*
## Lazy matching means only match the minimum
## The match will match whitespace and non whitespact characters
## to allow other match groups to match further items
## *? will match the first set 0 or more and allow further
## tabs and spaces to match
## Without ?, ([\s\S])* will match all instances and not leave
## matches for other matches, it's greedy

## Example <div class="hello">My text</div>
## Match My text
[\s\S]*?<div class"hello">([\s\S]*?)</div>
## Match 0 or more any character lazily, then div tag
## then match text inside div tag lazily, then match closing tag

# Match with no constraint, match all available with +
([0-9]*+)([0-9]{2})
## In a long number, ([0-9]*+) will match all numbers and not
## leave any matches for the 2nd part
## Using *? will leave matches for the [0-9]{2}

# Match with look behind with ?<=pattern
(?<=\$)\d+
## Look behind the $ symbol for digits

## For example, A pizza is $10.99 today.
## Match will look behind $ and get 10.99
(?<=\$)\d+(\.\d{2})?
## Same match, but do not capture the second group to improve efficiency
(?<=\$)\d+?(\.\d{2})?

# Match with look behind not with (?<!)
(?<!\$\d+)
## Match for digits when not preceded by a $ sign

# Match with look ahead with ?=pattern
\d+(?=pattern)

# Match with look ahead with ?!pattern
\d+(?!pattern)

# Match

```

## Examples of Testing Regex setup

Examples above and tests follow closely from this source: [A look at
using Regular Expressions (RegEx) - John Savill's Technical Training on
YouTube](https://youtu.be/UI3w3Ttw9Xo)

Install `grep` or `ripgrep` for tests

``` shell

# Create a file with a sentence for using regex
cat <<EOF > test.md
The quick brown fox jumped over the lazy dog
EOF

# Use grep with regex PATTERN on current directory
grep PATTERN *

# Recursively (-r) search current directory
grep -r 'f.x'
# . will match only 1 of any character

# Match fox or fix using character group
grep -r 'f[io]x'


```

## See Also

### Resources

- [RegExr: Learn, Build, & Test RegEx](https://regexr.com/) - test regex
  on text and explanations of syntax
- [Debuggex: Online visual regex tester. JavaScript, Python, and
  PCRE](https://www.debuggex.com/) - visual representation of regex
- [RegexOne - Learn Regular Expressions - Lesson 1: An Introduction, and
  the ABCs](https://www.regexone.com/) - test yourself with sample text
- [Regular Expressions Exercises at Sketch
  Engine](https://regex.sketchengine.eu/index.html) - exercises and
  tutorial
