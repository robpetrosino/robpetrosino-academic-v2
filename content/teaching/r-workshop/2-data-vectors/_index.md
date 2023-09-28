---
# Page title
title: Datasets and vectors

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
#linktitle: Course

# Page summary for search engines.
#summary: Blah, blah, blah...

# Date page published
#date: 2018-09-09

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 20
---

## Setting up

R has a _very_ short memory. This means that everytime we close and open R back again, we will have to remind him to open the packages we will be using.

```r
# install.packages("tidyverse") # you don't need to run this line if you have already 
# installed tidyverse before
library(tidyverse) # run this line to be able to use all the functions we need.
```

## Subsetting from a dataset

```r
eeg <- ______(______) # import the csv file enclosed in the folder you downloaded for the class
eeg # call the dataframe to have a look at it. 
```
Let's have a quick look at the beginning and end of the dataframe, respectively. Do you remember how to do that?

```r
____(_____) # the beginning of the dataframe
____(_____) # the end of the dataframe
```

Similarly to vectors, you can refer to the specific value or variable in your dataset (defined as a pair of row and column number (this is usually called *indexing/subsetting* in programming).

You already know how to select a specific column is by using the `$` operator.

```r
time <- eeg$____  # select the 'Time' column in the eeg data
```

But there are other ways too! 

1. You can select an entire column by using square brackets `[]` right after calling the dataframe. Within the square brackets, you will have to specify a pair of numbers: the first number refers to the row and the second number is for the column you want to extract. 

```r
time2 <- eeg[,_] # select the 'Time' column (i.e. the second column of the dataframe). Notice that you are just defining the column to be subsetting, so you can leave the first digit (for the row) inside the brackets blank.
```

2. You can select an entire row by specifying the number of the row, and leaving the second digit inside the brackets blank.

```r
row25 <- eeg[,_] #  select the entire 25th row
```

You can use the same method if you want a specific cell by specifying both row and col digits inside the brackets. 

```r
eeg[_,_] # select the cell in the 5th row and 2nd column.
```

You can also *subset* the data under specific conditions. There are two ways to do this. 

3. You can use the `subset()` function, which takes two arguments: the dataset you want to subset from, and the values of one the variables you want to include. 

```r
eegSubset1 <- subset(eeg, Time _____) # create a subset dataframe of the 'eeg' dataframe that includes all observations with values of the variable Time higher than 0
```

2. you can use the tidyverse function filter()

```r
eegSubset2 <- eeg %>% #the %>% ('pipe') OPERATOR is likely going to be your best friend in your career. I like to see it as a turbine that takes your data and molds it in the way you want it. 
  filter(Time ____) # the filter function after the %>% will just contain the conditions that the variable at hand (in this case, Time) will need to meet to be included in the new dataframe
```

Once you have a subset, you can make all of the calculations you want with it. For example, imagine you want to know the *mean amplitude* across all datapoints recorded when Time > 0. How do I do it? I just use the `mean()` function on my subset and select the right column

```
meanAmpl <- mean(____$_____)
sdAmpl <- sd() # same thing for *standard deviation*
```