---
filetags: ":lua:snippets:epubnote:"
id: 2484c395-d27c-44b4-8706-7abab107d2ed
title: Lua Snippets
---

Source: Personal comments and snippets from [Everything You Need To
Start Writing Lua - TJ DeVries -
YouTube](filehttps://www.youtube.com/watch?v=CuWfgiwI73Q&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=3) -
28 minute tutorial on Lua comments, variables, control flow, modules,
functions, metatables, Part 3 of "Advent of Neovim" introduction to
Neovim, with
[notes](https://github.com/tjdevries/advent-of-nvim/blob/master/03%20-%20Lua%20Crash%20Course/03%20-%20Lua%20Crash%20Course.md).

``` lua

-- This is a comment, starting with two dashes

--[[ This is a
     multi line
     comment.
--]]

-- Variables, Literals
local number = 5

local string = "hello world"
local anotherstring = 'hello world'
local anotherliteral = [[ this
is a multi line and literal ]]

-- Declare multiple values in one line
local truth, lies = true, false

-- Nothing value
local nothing = nil

-- Variables: Functions
local function hello(name)
  print("Hello!"m name)
end

local greet = function(name)
  -- .. is string concatenation
  print("Greetings, " .. name .. "!")
end

-- Function returning another function
local higher_order = function(value)
  return function(another)
    return value + another
  end
end

-- Functions: Multiple Returns
local returns_four_values = function()
  return 1, 2, 3, 4
end

first, second, last = returns_four_values()

print("first: ", first)
print("second:", second)
print("last:  ", last)
-- the `4` is discarded

-- Function with multiple arguments using ...
local variable_arguments = function(...)
  local arguments = { ... }
  for i, v in ipairs({...}) do print(i, v) end
  return unpack(arguments)
end

print("===================")
-- Print will print the arguments
print("1:", variable_arguments("hello", "world", "!"))
print("===================")
-- Will print only hello and <lost> because a function argument has 1 slot
print("2:", variable_arguments("hello", "world", "!"), "<lost>")

-- Function: Calling with function_name() or with literal
local single_string = function(s)
  return s .. " - WOW!"
end

local x = single_string("hi")
-- Call with just literal
local y = single_string "hi"
print(x, y)

-- Function: Calling with a table with named arguments
local setup = function(opts)
  if opts.default == nil then
    opts.default = 17
  end

  print(opts.default, opts.other)
end

setup { default = 12, other = false}
setup { other = true}

-- Function: Colon Functions, can indicate table's properties
local MyTable = {}

-- These two calls are the same
function MyTable.something(self, ...) end
-- Make call with self as first argument
function MyTable:something(...) end

-- Variables: Tables, Lua's main data structure for maps and lists

-- Table: List
local list = { "first", 2, false, function() print("Fourth!") end }
-- Lua uses 1 index for first element instead of 0 index
print("Yup, 1-indexed:", list[1])
print("Fourth is 4...:", list[4]())

-- Table: Map
local mymap = {
  literal_key = "a string",
  ["an expression"] = "also works",
  -- a function can be used as a key
  [function() end] = true
}

print("literal_key   : ", mymap.literal_key)
print("an expression : ", mymap["an expression"])
print("function() end: ", mymap[function() end])

-- Control flow: For loop
local favourite_fruit = { "peach", "apple", "strawberry" }
-- For loop will work with lists, but not maps
for index = 1, #favourite_fruit do
  print(index, favourite_fruit[index])
end

for index, value in ipairs(favourite_fruit) do
  print(index, value)
end

-- Control flow: For loop for maps with keys
local reading_scores = { alice = 3, bob = "N/A" }
-- Map iteration requires pairs
for key, value in pairs(reading_scores) do
  print(key, value)
end

-- Control flow: If
local function action(loves_coffee)
  if loves_coffee then
    print("Check out `ssh terminal.shop` - it's cool!")
  else
    print("Check out `ssh terminal.shop` - it's still cool!")
  end
end

-- "falsey": only nil and false will return the false condition
action() -- Same as: action(nil)
action(false)

-- Everything else is "truthy"
action(true)
action(0)
action({})

-- Modules - they are just files
-- mymodule.lua
local M = {}
M.my_function = function() end
return M

-- my2ndmodule.lua
local mymodule = require('mymodule')
-- Call the function from the other module called mymodule
mymodule.my_function()

-- Metatables - feature to fit different scenarios
local vector_mt = {}
-- Vector addition function using tables
vector_mt.__add = function(left, right)
  return setmetatable({
    left[1] + right[1],
    left[2] + right[2],
    left[3] + right[3],
  }, vector_mt)
end

local v1 = setmetatable({ 3, 1, 5 }, vector_mt)
local v2 = setmetatable({ -3, 2, 2 }, vector_mt)
-- Uses meta method of addition
local v3 = v1 + v2
vim.print(v3[1], v3[2], v3[3])
vim.print(v3 + v3)

-- Metatables - index
local fib_mt = {
  __index = function(self, key)
    if key < 2 then return 1 end
    -- Update the table, to save the intermediate results
    self[key] = self[key - 2] + self[key - 1]
    -- Return the result
    return self[key]
  end
}

local fib = setmetatable({}, fib_mt)

-- When indexes do not exist, metatable can calculate it
print(fib[5])
print(fib[1000])

-- Metatables methods

-- Get index of self with a key and value
__newindex(self, key, value)
-- Call table as a function
__call(self, ...)

```
