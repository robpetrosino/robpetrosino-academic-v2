---
# Page title
title: t-test and confidence intervals

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
#linktitle: t-test and CIs

# Page summary for search engines.
#summary: Blah, blah, blah...

# Date page published
#date: 2018-09-09

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 50
---

## Setting up

```r
library(tidyverse) # open our beloved package
```

The example relates to whether arachnophobia (fear of spiders) is specific to real spiders or whether pictures of spiders can evoke similar levels of anxiety. Twenty-four arachnophobes were used in all. Twelve were asked to play with a big hairy tarantula spider with big “fangs and an evil look in its eight eyes. Their subsequent anxiety was measured. The remaining 12 were shown only pictures of the same big hairy tarantula and again their anxiety was measured.

```r
# load the csv file
spiderData <- ________
```

> What is the research question? what's the IV? what's the DV? how can we formalize it mathematically?

Let's calculate means and standard error for each group using the %>% operator, the group_by() and summarize() functions... Do we remember how we do this?

```r
spiderData.Summary <- #first take the original dataset and then add the %>% operator
  # group by the independent variable name, and then add the %>% operation
  # create a new dataset with the summarize() function, with mean, sample size, sd, var, and se as variables
```  

Now let's plot our means!

```r
ggplot(_____, aes(_____))+ # define the dataset you want to plot the data from, and the aesthetics
  geom_????() + # define the kind of plot you want
  geom_????() # define the error bar skewers
```

## Confidence intervals

Now, what if I want to plot 95% CIs instead of SEs?

> How do we calculate CIs again?

```r
tcrit = qt(p=0.975, ___) # why p=0.975?
sp = ____
ci = tcrit*sp
```

Let's replot the means of our data with the CIs as error bars (instead of the SEs)... don't copy and paste, pleeeeeeaseeee! :)