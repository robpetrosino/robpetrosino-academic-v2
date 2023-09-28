---
# Page title
title: T-tests

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
#linktitle: t-test and CIs

# Page summary for search engines.
#summary: Blah, blah, blah...

# Date page published
#date: 2018-09-09

# Book page type (do not modify).
type: book

# Position of this page in the menu. Remove this option to sort alphabetically.
weight: 10
---

Let's now run a statistical test! 

> Given our research question, which should we run? A one-sample or a two-sample (independent) t-test? why?

Let's calculate *t* manually first

```r
t = ____
```

Once we have *t*, we can also retrieve the corresponding p-value, right?

```r
pt(t=___, df=___, lower.tail=_) # this is going to be the one-tailed p-value, how to I get the two-tailed p-value?
```

Then, we can use the t.test function to prove ourselves we grasped the calculations under the hood.

```r
t.test(dv ~ iv, data=___, alternative.hypothesis="_____") # let's look at the help and see how the function works!
```

Finally, Let's calculate the standardized effect size (Cohen's *d*)?

```r
d = 
```

Remember that we could retrieve `d` directly from our `t` to.

```r
d.fromt = abs(t)*sqrt(2/nrow(spiderData))
```

