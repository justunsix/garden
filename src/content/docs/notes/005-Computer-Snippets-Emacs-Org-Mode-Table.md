---
filetags: ":emacs:org-mode:snippets:epubnote:"
id: 43771c13-7b1a-49d0-9a25-95ea5a644844
TBLFM: "@2\\$8..@\\>\\>\\$8 = '(length(org-lookup-all \"\" '(\\$3..\\$7)
  nil));E"
title: Emacs Org-Mode Table Snippets
---

Source: [Org tutorial for tables -
orgmode.org](https://orgmode.org/worg/org-tutorials/tables.html),
[james-stoup/org-mode-table-tutorial: A simplified guide to mastering
Org Mode table functions ·
GitHub](https://github.com/james-stoup/org-mode-table-tutorial). Examples
below are [by james-stoup and under GPL-3.0
license](https://github.com/james-stoup/org-mode-table-tutorial?tab=readme-ov-file)

See [Emacs org-mode shortcuts](/garden/notes/005-tech-emacs-shortcuts-mode) -
[Emacs Shortcuts for org-mode](id:f3812051-ffec-4691-bdd0-c6bf791bb870)
for table notation like `@` symbol to denote rows and the `$` symbol to
denote columns

## Column Width

Restrict column width `org-table-shrink` to reduce column width given
cookie length in table like `<10>`. Use `org-table-expand` to restore
normal column width.

|                  |                             |
|------------------|-----------------------------|
| A very wide cell | Another very very wide cell |

## Formulas

Create a formula by adding `#+TBLFM: <insert formula here>` to the end
of any table.

Example: The formula should be read as "column 2 equals column 1
multiplied by 3":

|     |     |
|-----|-----|
| 1   | 3   |
| 2   | 6   |
| 3   | 9   |
| 4   | 12  |
| 5   | 15  |

### Summing Column

We need a way to tell the formula to always write to the last line,
regardless of how many lines are in the table. What we need is the @\>
operator, that signifies the last row of the table.

Summing column with `@>$2`

| ITEM    | COST | PRICE |
|---------|------|-------|
| Bike    | 50   | 100   |
| Sword   | 20   | 35    |
| Drill   | 30   | 60    |
| Cooler  | 10   | 70    |
| TV      | 50   | 40    |
| Blender | 25   | 45    |
| Boots   | 10   | 20    |
|         | 195  |       |

Summing all columns into last row:

| ITEM                                                 | COST | PRICE |
|------------------------------------------------------|------|-------|
| Bike                                                 | 50   | 100   |
| Sword                                                | 20   | 35    |
| Drill                                                | 30   | 60    |
| Cooler                                               | 10   | 70    |
| TV                                                   | 50   | 40    |
| Blender                                              | 25   | 45    |
| Boots                                                | 20   | 20    |
| Bike + Sword + Drill + Cooler + TV + Blender + Boots | 205  | 370   |

Summing only columns 2 and 3

| ITEM    | COST | PRICE |
|---------|------|-------|
| Bike    | 50   | 100   |
| Sword   | 20   | 35    |
| Drill   | 30   | 60    |
| Cooler  | 10   | 70    |
| TV      | 50   | 40    |
| Blender | 25   | 45    |
| Boots   | 20   | 20    |
|         | 205  | 370   |

Summing only columns 2 and beyond

| ITEM    | COST | PRICE | SHIPPING | MILEAGE |
|---------|------|-------|----------|---------|
| Bike    | 50   | 100   | 0        | 23      |
| Sword   | 20   | 35    | 10       | 12      |
| Drill   | 30   | 60    | 5        | 51      |
| Cooler  | 10   | 70    | 0        | 32      |
| TV      | 50   | 40    | 20       | 19      |
| Blender | 25   | 45    | 0        | 9       |
| Boots   | 20   | 20    | 0        | 38      |
|         | 205  | 370   | 35       | 184     |

### Summing Rows

| PLAYER | CMP% | PASSING YARDS | RUSHING YARDS | TOTAL YARDS | PASSING TDs | RUSHING TDs | TOTAL TDs |
|----|----|----|----|----|----|----|----|
| Joe Burrow | 69.8 | 4641 | 202 | 4843 | 42 | 2 | 44 |
| Lamar Jackson | 67.9 | 3955 | 852 | 4807 | 39 | 4 | 43 |
| Josh Allen | 63.6 | 3731 | 531 | 4262 | 28 | 12 | 40 |
| Jayden Daniels | 69.4 | 3530 | 864 | 4394 | 25 | 6 | 31 |

## Auto Incrementing

The formula is smart enough to know that we don't want to include
something before the separator. However, it still isn't correct. Even
though it didn't show the first value, it still incremented it, which
leaves our starting value at 2. We can do better. Modify the formula to
subtract one from each value to produce the result we want.

|     | BOOKS             | READ? |
|-----|-------------------|-------|
| 1   | IT                | yes   |
| 2   | The Hobbit        | yes   |
| 3   | The Black Company | yes   |
| 4   | Salem's Lot       | no    |
| 5   | Leaves of grass   | no    |

## Horizontal Separators and Referencing Rows

Horizontal lines can make your table much easier to read but they have a
hidden use as well. You can specify all of the values between the first
and second lines using @I..@II. These are NOT Roman numerals, so you
must put IIIII for the 5th horizontal line, not V which would be the
correct Roman numeral. In the example below you have decided to host a
party and are trying to tally up the costs of different types of
expenses.

| ITEM    | COST |
|---------|------|
| rum     | 20   |
| gin     | 18   |
| beer    | 50   |
| coke    | 10   |
| sprite  | 5    |
| chips   | 10   |
| cookies | 20   |
| pizza   | 60   |
| plates  | 10   |
| napkins | 8    |
| cups    | 12   |
| ALCOHOL | 88   |
| SODA    | 15   |
| FOOD    | 90   |
| MISC    | 30   |

## Sums, Averages, and Other Transforms

See `Calc` package for other math libraries `info-display-manual` and
select `calc`.

### Averages and Weighted Average

The field marked AVERAGE GRADE should contain an average of the 3 tests
and the final exam grades. The CLASS GRADE is computed similarly but the
final exam is now weighted in respect to the other grades.

| STUDENT | TEST 1 | TEST 2 | TEST 3 | FINAL EXAM | AVERAGE GRADE | CLASS GRADE |
|---------|--------|--------|--------|------------|---------------|-------------|
| Alice   | 89     | 93     | 75     | 77         | 83.5          | 82.2        |
| Bob     | 78     | 99     | 69     | 80         | 81.5          | 81.2        |
| Cathy   | 91     | 90     | 90     | 75         | 86.5          | 84.2        |
| Doug    | 48     | 90     | 85     | 82         | 76.25         | 77.4        |

### Mean, Median, and Standard Deviation

Here is three different things in one formula:

1.  There are several math functions (such as vsdev - standard deviation
    of the data values per calc manual)
2.  The output lines are being referenced with the @\> operator. Each
    additional \> references one more line above the last line. Thus
    @\>\>\> should be read as "third line from the last line of the
    table"
3.  All four functions are executed at once because each is separated by
    a :: operator.

| INDEX   | VALUE     |
|---------|-----------|
| 1       | 1         |
| 2       | 2         |
| 3       | 4         |
| 4       | 2         |
| 5       | 3         |
| 6       | 1         |
| 7       | 4         |
| 8       | 1         |
| 9       | 5         |
| MEAN    | 2.5555556 |
| MEDIAN  | 2         |
| STD DEV | 1.5092309 |
| SUM     | 23        |

## Formatting

- Standard Deviation with prettier table if the output was but to only
  three decimal places using `;%.3f`
- Medium with 3 digits with `;%.3d`

| INDEX   | VALUE |
|---------|-------|
| 1       | 1     |
| 2       | 2     |
| 3       | 4     |
| 4       | 2     |
| 5       | 3     |
| 6       | 1     |
| 7       | 4     |
| 8       | 1     |
| 9       | 5     |
| MEDIAN  | 002   |
| STD DEV | 1.509 |

## Clearing Cells and Random Values

- \$1=0 simply clears everything in the first column by setting each
  value to 0. Useful for resetting table values

- @2\$1..@\>\>\$1 = random(1000);%.3d, creates random numbers. Here we
  create a random number between 1 and 1,000. Then we ensure that at
  least 3 digits are displayed with ;%.3d. This formula generates random
  numbers that will be used as student IDs. When testing out this
  formula (or any similar one) you will find that it is helpful to use
  the previous formula to reset everything to 0 while testing out your
  code.

- '(length'(@I..@II)), simply counts all the records between the two
  horizontal lines and returns them. This is a handy way of dealing with
  large tables that require a count, but don't require a column
  dedicated to indexes.

| STUDENT NUMBER | NAME   | TEST 1 | TEST 2 | TEST 3 | HOMEWORK | FINAL EXAM |
|----------------|--------|--------|--------|--------|----------|------------|
| 221            | Amy    | 78     | 82     | 91     | 94       | 77         |
| 931            | Bob    | 77     | 83     | 89     | 90       | 70         |
| 067            | Clara  | 84     | 88     | 99     | 100      | 80         |
| 632            | Dylan  | 69     | 74     | 83     | 91       | 65         |
| 921            | Ed     | 74     | 70     | 77     | 85       | 69         |
| 726            | Fiona  | 80     | 81     | 86     | 88       | 74         |
| 663            | Gareth | 79     | 85     | 84     | 89       | 68         |
| 7              |        |        |        |        |          |            |

## Empty Cells

Continuing with our theme of a teacher checking grades, look at this
table of grades. Some of the students have missing work. We need a
breakdown of which students have missing assignments and how many
assignments are missing.

We are looking for empty cells ("") and returning lists for each record.
Then we count how many empty records were found, and set that number to
the value in the MISSING column.

| STUDENT NUMBER | NAME   | TEST 1 | TEST 2 | TEST 3 | HOMEWORK | FINAL EXAM | MISSING |
|----------------|--------|--------|--------|--------|----------|------------|---------|
| 409            | Amy    | 78     | 82     |        | 94       |            | 2       |
| 016            | Bob    | 77     | 83     | 89     | 90       | 70         | 0       |
| 432            | Clara  | 84     | 88     | 99     | 100      | 80         | 0       |
| 869            | Dylan  | 69     |        | 83     | 91       | 65         | 1       |
| 925            | Ed     | 74     | 70     | 77     | 85       | 69         | 0       |
| 723            | Fiona  | 80     | 81     | 86     |          | 74         | 1       |
| 688            | Gareth | 79     | 85     | 84     | 89       | 68         | 0       |
| 7              |        |        |        |        |          |            |         |
