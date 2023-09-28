---
# Page title
title: Correlation and linear models

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
#linktitle: Course

# Page summary for search engines.
#summary: Blah, blah, blah...

# Date page published
#date: 2018-09-09

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 60
---

## Setting up

```r
library(tidyverse) # open our beloved package

examData <- ____ #load the dataframe "examData.csv"
___(___) # how do look at the *structure* of the dataframe (it's not head()...)

```

The data we will be analyzing today is called `examData`. A psychologist was interested in the effects of exam stress on exam performance. So, they devised and validated a questionnaire to assess state anxiety relating to exams (called the Exam Anxiety Questionnaire, or EAQ). This scale produced a measure of anxiety scored out of 100. Anxiety was measured before an exam, and the percentage mark of each student on the exam was used to assess the exam performance.

## Visualizing the data

Ok, let's plot the two variables. We will want to plot it as a scatterplot, what is the appropriate geometry?

```r
plotExam <- ggplot(__________)+
  geom_?????()
plotExam
```

## Calculating *r*

Let's calculate the correlation between the two variables....this function just gives you Pearson's *r*.

```r
r <- cor(examData$x, examData$y) # what are our x and y? Replace them with the appropriate variable from the dataset
```

But remember you can always calculate Pearson's *r* manually. Let's try that. First, we need the covariance of the two variables. For that, we need:

1. the covariance

> Wait, how do we calculate the covariance?

```r
n <-  # the sample size -- in this case, the number of observations/rows...
meanExamScore <- ______ # the mean of the exam score variable
meanAnxietyScore <- _____ # the mean of the anxiety score variable

cov.byHand <- sum(______)  # Now, we are ready to calculate the covariance. It's the summation of the product between the differences between each value of each variable and its mean, divided by n-1
cov.byFormula <- cov(____, ____) # this is the function for covariance, just to make sure our manual calculations are correct
```

2. The maximum *variance* that the two variables could possibly have: s_x * s_y

```r
max_variance <- ____
```

Now we are ready to calculate *r*!

```r
r.byHand <- _____ # is the output the same as the one spit out by the function in l. 24?
```

### ...and, why not?, *t*!

Imagine that you want to have both *r*, and the corresponding *t* and *p*-value. Did you really think that R was gonna leave you to do it manually?

```r
cor.test(x, y, alternative) #what are our x and y? what's our alternative hypothesis?
```

Although, you *could* calculate *t* manually... if you wanted. 

> How do we do that again? The denominator is hard to remember -- it's {{< math >}}$\sqrt{\frac{1-r^2}{n-2}}${{< /math >}}.

the square root of the division of 1-r^2 and n-2.

```r
tCorr.byHand <- r.byHand/_______ # 
```

And from there retrieve the p-value

```r
pt() # we want the two-tailed p-value of our t; so, what do we do here?
```

