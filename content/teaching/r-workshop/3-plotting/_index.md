---
# Page title
title: Our first steps in data visualization

# Title for the menu link if you wish to use a shorter link title, otherwise remove this option.
linktitle: Data visualization

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

## Distribution plots

### Histograms

The primary R package for plotting is called `ggplot2`, and it is included in the tidyverse package you have already installed and downloaded. There are many other plotting packages available, but in this class we will be focusing on `ggplot2` in this class. 

Imagine we can to take a look at the distribution of the anxiety levels across sujects, independently of whether they were presented with a picture of a spider or an actual spider. What kind of plot can we use?

Here's how ggplot works. You first use the ```ggplot()``` function. The function wants at least two things: 

1. the dataset you want to retrieve the data points from; and
2. the kind of plot you want, and the variables which want to plot on the x- and y-axes.

```r
ggplot(data = ___)+ # the dataset it needs to retrieve the data from. This will just draw the frame of plot. You then add a `+` for further instructions to give for plotting.
  geom_histogram(aes(x = ___)) # after the ggplot() function you then specify what kind of plot you want. All kinds of plots have the same form: geom_*(). In this case we want a histogram, so the right function would be: geom_histogram. The one argument you need to finally plot the historam is the aes() function, which stands for "aesthetics" and basically takes the variables you want to plot in the x- and y-axes. Given that this is an histogram, the y-axis is predefined as frequency/count; but the x-axis must be associated to the right variable/column of the dataset define in the line above. What is that variable?
```

> Once you run the two lines above, the plot will appears within the Plots tab in the lower right pane, but it *won't* be stored. This means that you will have to run the two lines every time you want to take a look at that plot. How do we avoid that? We will have to assign it a name like we learnt to do it in the past weeks! Please rewrite the code above -- not copying-and-pasting please! :) - and assign it a variable name. Notice that once you assign the plot a name, it will not appear in Plots tab when you run the code. You will have to call it!

If you want to be fancy, you could easily choose the color of the bars!

```r
___ <- ggplot(data = ___)+ 
  geom_histogram(aes(x = ___), color='___', fill='____') #add the name of the color you want instead of the ____. the `color` argument will change the border color; the `fill` argument will change the filling color of the bars!
____ # Remember that, if you assign your plot a name, you will have to call the plot to make it appear in the Plots tab in the lower right panel
```

Neat, uh?

### Density plots

A density plot can be seen as an extension of the histogram. As opposed to the histogram, the density plot can smooth out the distribution of values and reduce the noise. As such density plots work better at determining the distribution shape (the concept of the shape of a probability distribution arises in questions of finding an appropriate distribution to use to model the statistical properties of a population, given a sample from that population) because they’re not affected by the number of bins. Remember that this also means that both histogram and density plots are suitable for *continuous* variables, but not for discrete variables.

The code structure is the same as we have seen above.

```r
densityAnxiety <- ggplot(data = ___)+ # the dataset it needs to retrieve the data from. This will just draw the frame of plot. You then add a `+` for further instructions to give for plotting.
  geom_?????(aes(x = ___)) # as much as histogram, density is a geometry. So let's see what's the name for it! 
densityAnxiety # call the plot to visualize it
```

We could even have histogram and density overlaid with one another! Just by adding them to the same plot 

```r
histo.densityAnxiety <- ggplot(data = ___)+ 
  geom_histogram(aes(x = ___))+ # you might need to change some parameter here... plot this and see what happens! 
  geom_?????(aes(x = ___))
histo.densityAnxiety # call the plot to visualize it
```

Remeber that to avoid redundancy, if the geometries of your code *share* the same dataset and x and y variables, you can add that info in the `ggplot()` function call, instead of repeating it for each geometry. Let's do it together!

```r
histo.densityAnxietyOverlay <- ggplot()+ 
  geom_?????()+
  geom_?????()
histo.densityAnxietyOverlay # call the plot to visualize it
```