---
# Page title
title: Some practice

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

Let's do some practice with z/norm distribution and the `pnorm()` and `qnorm()` function. We will be using these functions (and similar ones for the other statistical tests), so it is important to grasp what they do and why they are useful. If you look at the description of the functions in the helper (do that now, please), you will see that `pnorm()`, `qnorm()`, and the other functions for the normal distribution, assume a mean of 0 and a sd of 1. This means that if you use these functions without specifying the mean and sd, R will assume you are dealing with a *standard* normal distribution (i.e., the z-distribution). 

The `pnorm()` function will spit out the percentile or the p-value corresponding to a given value, mean and sd. The `qnorm()` function will spit out the quantile (i.e., the value) corresponding to a given p-value, mean, and sd. Essentially, `pnorm()` and `qnorm()` are the counterpart of one another. So, let's practice this!

1. Find the one-tailed z-score for p=0.32. The functions will assume you want the one-tailed value for the left/lower tail; but if you rather want the right/upper tail, you can change it by specifying the argument lower.tail=FALSE in function. 

```r
_norm(p=___, lower.tail=___)
```

2. Find the one-tailed p-value for z=1.5.

```r
_norm(q=___, lower.tail=___)
```

Alternatively, for `pnorm()` you can also calculate it by subtracting the function from 1.

```r
1 - _norm(q=___)
```

3. Find the two-tailed z-score for p=0.32. If we want the two-tailed quantile value for a given p, it means that the p-value is also two-tailed. What does this mean?

```r
_norm(_=__)
```

3. Find the two-tailed p-value for z=1.5. The p-value spit out by the pnorm() function will always be one-tailed. How do we make two-tailed?

```r
pnorm(q=_, lower.tail=F)____

```
