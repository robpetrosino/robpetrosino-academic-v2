---
# Page title
title: ANOVAs

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
#linktitle: Course

# Page summary for search engines.
#summary: Blah, blah, blah...

# Date page published
#date: 2018-09-09

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 80
---

## Setting up

To practice with ANOVA, we will use a selection of my data on word recognition. Let's open it first. In this dataset, each participant saw a number of words from one frequency range only. Participants were asked to press a response button when they saw a word they recognize.

```r
library(tidyverse) # what would we do without it?

_________ <- ______________ # we are not expert of read_csv() aren't we?
```

> Let's have a look. What's the format? It is okay to run an ANOVA?

## One-way ANOVA

Let's build an ANOVA model to see if response time (`RT`) is predicted by `frequency`:

```r
model <- ___(__ ~ _______, data=_______) # we should name it so to call it

model # like this

______(model) # let's see what the model says and let's interpret the ANOVA table together.
```

> What does the model tell us? What's the the interpretation of the results?