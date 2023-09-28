---
# Page title
title: Data types and logical functions

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
#linktitle: Course

# Page summary for search engines.
#summary: Blah, blah, blah...

# Date page published
#date: 2018-09-09

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 10
---

## Basic data types

There are many kinds of data types in R. We will introduce them gradually through the semester. Let's start with the basic two data types: 

1. numeric: numeric values such as `7.9`.
2. character: text/string such as `"roberto"` or `"281928"` (notice the quotes!). 

You can check the data type of a given variable by using the `class()` function. Now that you have the different columns of our dataframe stored as separate variables, you can check the class each variable belong to.  

```r
class(______) # column 1
class(______) # column 2
class(______) # column 3
```

Details about each variable/column of a given dataset is also available in bulk in the `str()` function. Let's read it together.

```r
str(_____) 
```

## Logical functions (I)

You can check if a given variable is of a given data type by using the `is.`-type functions. The console will return a logical (`TRUE/FALSE`) depending on whether the variable is of that type (`TRUE`) or not (`FALSE`).

1. `is.numeric()`
2. `is.character()`

```r
is.numeric(______) # is column 1 numeric?
is.character(______) # is column 1 character?

is.numeric(______) # is column 2 numeric?
is.character(______) # is column 2 character?

is.numeric(______) # is column 3 numeric?
is.character(______) # is column 3 character?

```

Throughout the course, we will keep adding up on these functions as we discover new data types.