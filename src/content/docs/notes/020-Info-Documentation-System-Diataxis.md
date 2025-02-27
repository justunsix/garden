---
filetags: ":diataxis:documentation:system:epubnote:"
id: 4bfa28b9-2233-44d7-84dc-7e612e5dd447
title: Information Documentation System Diataxis
---

Source: [Diátaxis - Tutorials, How-To guides, Explanation,
Reference](https://diataxis.fr/) - Also a forked version at
[DIVIO](https://documentation.divio.com/)

- There are tutorials, how-to guides, technical reference and
  explanation types of documentation.

Tutorials

- Learning oriented
- Serve out study
- Practical Steps

How-to Guides

- Task oriented
- Serve our work
- Practical Steps

Explanation

- Understanding oriented
- Theoretical knowledge
- Serve our study

Reference

- Information oriented
- Theoretical knowledge
- Serve our work

## Tutorials

- Lessons for a reader to learn
- Series of steps to complete a project
- Take beginner to becoming competent with product, turning them into a
  new user
- Provide a base that learner can understand rest of documentation
- Must be:
  - Meaningful - sense of achievement
  - Successful - able to complete it
  - logical - makes sense, orderly
  - usefully complete - learner encounters all actions, concepts, and
    tools they need to be familiar with

### Challenges

- It is the most misunderstood type of documentation and most projects
  have poor or no tutorials
- There isn't a teacher present to go through with the student, only
  written materials may not be sufficient
- Creating and maintaining tutorials is a lot of work as a product
  changes. The teachers has to continually go through the tutorial to
  ensure it can be done successfully.
- It may need to be rewritten as the product changes or there is a
  better learning experience

### Example: Tutorial on Food and cooking

- Introduce working in a kitchen, give confidence
- Pace appropriate for cook
- Create opportunity for repetition later (wash hands, clean knife,
  measuring ingredients)

### Writing a Good Tutorial

- Tell them what to do, learn by doing, not just teaching
- Get them started
  - If a high level of experience is desired, state prerequisites like
    previous tasks or skill level
  - It can be done a "beginner's way" and does not have to be the
    "correct" or best practice way
- Tell them what they will accomplish at the beginning
- Ensure the tutorial works and is repeatable
  - Users have different skills levels, context (tools, operating
    systems)
  - Test your tutorials regularly
- Ensure user sees results immediately
- Describe steps, not abstract concepts
  - Avoids confusion
- Offer only minimum explanation necessary to complete tasks
  - Include links and explanations later
- Ignore options and alternatives
  - Focus on the conclusion
  - That information can be presented later

### Language of Tutorials

- You will learn…
- First do x, now do y, with y complete, do z
- We must always do x before y because … - minimal explanation
- The output should be… - clear expectations
- Notice that.. Remember that… - tips
- You have created a…. - describe the learner's achievement

## How to Guides

- Steps/directions the reader uses to solve a real problem.

- Must be a specific goal and not open ended like how to build a web
  application

- Frames what the product can do

- List of how to guides suggests a product's capabilities

- Can be the most read of all documentation

- Not same as tutorial which is for learning.

  - Example: cooking recipe:
    - A skilled cook will still follow a recipe.
    - Focuses only on how to make a dish, not teaching cooking.

### Example - How to

- How to calibrate a radar array
- Cooking recipe

### Writing a good how-to guide

- Describe sequence of steps
- Must be reliable though lower reliability of a tutorial is allowed
- Focus on practical goal
- Avoid:
  - Teaching
  - Explain concepts
  - Be complete
- Choose titles of guide
  - "How to integrate application monitoring" not "Application
    performance monitoring"

### Language

- This guide shows you how to…
- If you want x, do y. To do w, do z
- Refer to the x reference guide for a list of options…
  - Push related information to other documents

## Reference

- Describe concisely in an orderly way
- Reference information is led by the product
- In software, describe the software like APIs, classes, functions
- Designed for reader to consult it, not read
- Like a map, tells you about a location without you going to it
- Describes the product and how it works
- Should avoid how to, though can describe how to use something
  correctly

### Example - Reference

- Cooking ingredient
  - Accurate, up to date information
  - Properties
  - Related ingredients
  - health effect
- Encyclopedia article

### Writing a good reference guide

- Follow logical order
  - e.g. map follows territory, software follows architecture of product
- Consistent in structure, language
- Focus on describing
- Provide examples to allow readers to understand reference

### Language of Reference Guides

- X is an example of y. W needs to be initialized with z. This option
  does that…
- Sub-commands are: a, b, c
  - List options, features, flags, limitations, messages, errors
- You must use a, You must not apply b unles c. Never do d.
  - Provide warnings

## Explanation

- Clarifies, deepens, and broadens understanding
- Approach information from different angles
- Can be read away from the product itself unlike other types of
  documents
- Explanations are not the highest priority, but are required for a
  reader to developer relationships and understand the product and their
  skills in using it

### Challenges in Explanation

- Explanation is often included in other documentation without its own
  section
- Explanation needs real or imagined why questions as prompts for
  content

### Example - Explanation

- Harold McGee's On Food and Cooking
  - Explains cooking in contexts of historical, social, science, and
    technology
  - We cannot learn practical, though it changes how we think about
    cooking and our craft

### Writing a good explanation

- Make connections to other things
- Provide context, background, explain why things are though decisions,
  history, constraints. Use examples
- Use topics, you can place "about" before the area like examples:
  - About user authentication
  - About connection policies
- Discuss options and opinions
- Avoid instruction or reference

### Language of Explanation

- The reason for x is because historically, y…
- W is better than z, because…
- An x is system y is similar to w in system z. However…
- Some people prefer w because of z. This can be a good approach and
  other options..
- X is related to y as follows…

## Understanding User's Needs

- Diátaxis provides:
  - Map of documentation types rather than a list of documents
  - Types will naturally provide structure
  - Provide documentation for users in their cycle of interacting with
    the product
    - Learning \> task \> information \> explanation phase \> back to
      beginning or deeper in a specific area
    - Accessing a piece of document and jumping around

## Tutorial vs How-to Guide

- Tutorial is for learners
- How to's focus on task for a goal and may be repeatable and used by
  users regularly or by advanced users

## How to use Diátaxis

- It is a guide, a map, but not to be used as a plan
- Check you are in the right place/direction and keep going. Do not
  start with structure.

Approach:

- Publish documents immediately and improve like agile, avoid big
  picture perfection
- Just start, even with paragraphs to pages to articles
- Like a plant, living organism always growing and never finished and
  always complete

## Citation

This CITATION.cff file was generated with cffinit. Visit
<https://bit.ly/cffinit> to generate yours today!

``` txt
# This CITATION.cff file was generated with cffinit.
# Visit https://bit.ly/cffinit to generate yours today!
cff-version: 1.2.0
title: Diátaxis documentation framework
message: >-
  Please cite this software using the metadata from 'preferred-citation'
type: software
authors:
  - email: daniele@vurt.org
    orcid: 'https://orcid.org/0000-0001-5141-7509'
    given-names: Daniele
    family-names: Procida
preferred-citation:
  type: generic
  authors:
  - given-names: Daniele
    family-names: Procida
    orcid: 'https://orcid.org/0000-0001-5141-7509'
  title: Diátaxis documentation framework
  url: "https://diataxis.fr/"
```
