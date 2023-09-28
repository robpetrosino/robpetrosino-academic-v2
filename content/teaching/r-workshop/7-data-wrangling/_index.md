---
# Page title
title: Data wrangling

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
#linktitle: Course

# Page summary for search engines.
#summary: Blah, blah, blah...

# Date page published
#date: 2018-09-09

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 70
---

## Setting up

Today we are going to take a look at the `starwars` database that is included in the `tidyverse` package.

```r
library(tidyverse) # open our beloved package

starwars
```

## New data wrangling functions: `count()`, `pivot_longer()`, `pivot_wider()`

Before moving to more advanced data wrangling functions, let's revise the commands in the past recitations. 

```r
starwarsEdit <- ____ %>% 
  ____(____) %>% # first, let's remove the columns films, vehicles, and starships; don't forget the pipe %>%!
  group_by(_______) %>%
  summarise(___________)# then, let's calculate mean, min and max values of height, mass, and birth_year by species and gender
```

Now, what if I want to know how many observations I have per gender and species?

```r
starwars %>% 
  ________(______________) %>% # by gender and species
  summarise(n=n()) # use the n() function inside summarise()
```

Just so you know -- there is a faster way to do this using count()

```r
starwars %>% 
  count(____________) # insert the two groups here
```

Now we can play a bit with the original data and transform in the opposite format to the original one. We can do this by using the function `pivot_longer()` and `pivot_wider()`. Let's have a look and see the arguments these functions take.
  
Let's first select some of the columns so it doesn't get too cluttery. Let's select:  name, height, mass, birth_year

```r
starwarsSelect <- _______________ %>% ________(_____________________)
```

> What kind of format is the dataset? Wide or long?

It's *wide* indeed, so then let's use `pivot_longer()` to make it longer. 

```r
_______________________ <- starwarsSelect %>% # identify the dataframe
  pivot_longer(cols = _______________, # indicate the columns to pivot into longer format: that is, all columns except name
               names_to = __________, # name of the column with the levels of the group; it should be in quotes
               values_to = __________) # name of the column with the actual values; it should be in quotes
```

If you wanted, you could also go back to the original format by using `pivot_wider()`:

```r
starwarsSelectTransformW <- starwarsSelectTransformL %>%
  pivot_wider(names_from = features, # name of the column to get the names from and transform into columns
              values_from = values) # name of the column to get the values from
```

Nice uh? :)

## Some more practice 

Now, let's import the dataset from exam 1. As you may recall, the dataset you were given in exam 1 reported *real* judgment data for grammatical and ungrammatical sentences.

```r
exam1.data <- read.csv("exam1.data.csv")
```

> What is the format of the dataset?

Whatever that was, let's change it!

```r
___________ <- exam1.data %>%
  pivot_????(   )
```

Aaaaand let's change it back again!

```r
___________ <- exam1.data %>%
  pivot_????(   )
```

If you compared the dataset newly wrangled with the original one, you would see that they are exactly the same!
