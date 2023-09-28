---
# Page title
title: Our first steps in data visualization

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Barplots

# Page summary for search engines.
#summary: Blah, blah, blah...

# Date page published
#date: 2018-09-09

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 30
---

## The usual setup

```r
#install.packages("tidyverse") # you don't need to run this line if you have already installed tidyverse before
library(tidyverse) # run this line to be able to use all the functions we need.
```

Let's read the dataset we are gonna be playing with today.

```r
spiderData <- ______(______) # import the csv file enclosed in the folder you downloaded for the class
spiderData # call the dataframe to have a look at it. 
```

This dataset report the anxiety scores of arachnophic people (like myself) after seeing a real, big, hairy spider (_shivering right now_) or just a picture of it.

## Plotting summary statistics

Let's calculate mean, sd, and see for each condition group by using `tidyverse`.

```r
spiderSummary <- spiderData %>% # first, let's use our %>% (pipe) operator. Remember, think about it as turbine
  group_by(____) %>% # the group_by() function will split the original dataset in two depending on the values of the variable/column we put inside of it. Notice that %>% will have to be typed in at every step
  summarise(meanAnxiety = mean(___), 
            sdAnxiety = _____, 
            obs = n(), # this function (notice that it has the parentheses, but no arguments!) will return the number of observations/rows for each value of the variable you are grouping by
            seAnxiety= _____) # the summarise() function will make up a *brand-new* dataset from the original dataset and takes as many variables as we want.
```

How cool is that? You have basically learnt a quick shortcut to calculate descriptive statistics measures in just one line of code!

We can now plot the means and the standard errors of the dependent variable (Anxiety) in the two groups ("picture" and "real-spider"). Let's do it together!

```r
plotMeans <- _____(data=___)+ # the dataframe first -- which one are we using?
                geom_?????(aes(x=____, y=_____))+ # which geometry should we use? Let's use the helper to find out!
                geom_?????()+ # we also want to put standard error bars -- let's see if the helper could lead us in the right direction
                labs() # finally, we would also like to add a title for the plot and new labels for the axes -- check the helper for further information about the labs() function
plotMeans # let's call the plot and see what it looks like -- do we like it? do we want to change something?
```

We are not ready to introduce a new data type: **factor**! Do you remember what is a factor? A factor is basically another term for the independent variable (along with predictor). A factor may be either continuous or discrete; and may belong to any of the scale types we have seen at the beginning of the semester: nominal, ordinal, interval, ratio. It is important to let R know about what variable of our dataset is a factor for a two reasons. First, it will make it easier for statistical analysis (we will see this in the next units of the class). Second, it is important for plotting. We are introducing factors here, because we care about plotting at the moment. 

Our dataset the factor is called `Group`, and have two levels: `"picture"` and `"real-spider"`. To check that is actually recognized by R as a factor, we can use the `is.factor()` function:

```r
is.factor(____)
```

Ha! It's not a factor. We have to fix that. How do we do it? We use the as.factor() function

```r
______ <- as.factor(______)
is.factor(____) # check again if now Group is a factor
```

Now that we have made sure things are labels as they should, we can move on and plot the means! But first let's make sure that the levels are correctly spelt out. 

```r
levels(_____) # type in the predictor variable of the dataset
```

The levels for the predictor variable are "picture" and "real-spider". What if we want to rename the levels to, for example, "Picture" and "Real spider", to make it nicer. How do we do that? We use the `fct_recode()` function - I will show you this line of code for simplicity. 

```r
spiderSummary$Group <- fct_recode(spiderSummary$Group, Picture = "picture", `Real Spider` = "real-spider")
```

Also, levels are usually ordered alphabetically. So in our case, "Picture" will precede "Real spider". But what if we want to reorder them, so that, for example, the level "Real spider" precedes "Picture". How we do that? we use the `fct_relevel()` function - I will show you this line of code for simplicity. 

```r
spiderSummary$Group <- fct_relevel(spiderSummary$Group, "Real Spider", "picture")
```

To check that everything is in order, we can see the levels of our factor with the `levels()` function:

```r
levels(spiderSummary$Group)
```

Let's now plot the means again and see if everything is in order! Do *not* copy and paste pleaaaaaaaase!!!

```r
plotMeansTwo <-
plotMeansTwo # let's call the plot and see what it looks like -- do we like it? do we want to change something?
```

Over the next classes, we will gradually introduce new geometries as we go through the different statistical tests.