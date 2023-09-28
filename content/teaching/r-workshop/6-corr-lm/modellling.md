---
# Page title
title: Linear models

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

## Setting up

```r
library(tidyverse) # open our beloved package

salesData <- ____ #load the dataframe "examData.csv"
___(___) # how do look at the *structure* of the dataframe (it's not head()...)

```

The data we will be analyzing today is called `salesData`. A junior data scientist of a music record company is asked to predict physical and downloaded album sales from the mount of money spent advertising that album. They don't know how to do that, let's help them!

> Which variables do you think the data scientist needs? what is the predictor and the predicted variables?

## Visualize the data

Ok, let's scatter plot the two variables.

```r
plotSales <- ggplot(__________)+
  geom_____() #+
  #geom_smooth(method='lm') # with this line we plot of best-fit line
plotSales
```

## Modelling

Now we are ready to construct our linear model.

```r
salesModel <- lm(dv ~ iv, data = ______) # what is our DV and IV/predictor/factor?
salesModel # take a look at the model to retrieve the coefficients for the intercept and the slope
```

You can also test the slope against the null hypothesis 

```r
summary(______) # let's read it together
```

> Given the intercept and the slope values, what is the right equation? 

```r
intercept = ____ # this is the value of y when x=0
slope = ____ # this is the degree of change of y with respect to x 
x = 1 # you can change the value of x so to see the predicted sales!
y_hat = _____ + ( ____ * x ) # this is our equation for albums Sales!
```

## Predicting new data

Cool, can you predict how many album sales will be sold if we spend 400k AED as ads on that album? There are two methods to do this in R. 

1. Our favorite -- apply the equation by hand

```r
x_400k = _______ # this is our new value of x (the amount of money we would be willing to spend as ads to promote the album)
y_hat = # just retype the equation above and replace the old x with our new x
```

2. Use the `predict()` function

First create a new data with the adverts variable (with 3-5 values: 400000, ...). That variable will represent the amount spent for the album promotion.

```r
albumPromo <- data.frame(adverts=c(________))
```  

Then, apply the model to the dataframe `albumPromo`.

```r
predict(your_model, new_data) # substitute the arguments within the function with the right variables! Taaah-daaan! :)
```  




