---
# Page title
title: Vectors

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

## Diving in to vector manipulation

Dataframes/dataset are nothing but variables (i.e., columns) bound together. In R, variables are also called *vectors*, i.e. a series of values stored within the same variable. In the past two weeks we have been playing with column subsetting in various ways... which basically has meant for you to create separate vectors from a dataframe. Now we will learn how to create a vector by hand, i.e. without passing by a dataframe. This may sound useless a first, but it will come handy if you want to use R to make calculations for your next homework assignments. 

We can make up a vector by using the `c()` function (where "c" is for "combine").

```r
# Add 5 numeric values to the vector "my_vec" below by adding them in the parenthesis and separating them with a comma.
my_vec <- c(____, _____, _____, _____, _____)
```

Notice that a vector cannot contain different datatypes. All values contained in a vector must be of the *same* datatype.

```r
my_vec2 <- c("jon", "roberto", "sandra", "panini", "bowie")
my_vec3 <- c(my_vec, my_vec2) # This won't give you an error, but it will convert everything to character by default.
```

We are now going to work on the vectors above, and explore some of the properties and functions. Similarly to dataframes, vectors can be subset by using the square brackets `[]` and adding the number corresponding to the position of the number you want to refer to. 

```r
first <- my_vec3[1] # among the numbers stored in 'my_vec3', what number will this be?
second <- my_vec3[_] # gimme the second number stored in 'my_vec3'
third <- ____ # gimme the third number stored in 'my_vec3'
eighth <- ____ # gimme the eighth number stored in 'my_vec3'
last <- ____ # gimme the last number stored in 'my_vec3'
```

> QUESTION: Why can't we use the '$' operator for vectors? 

Once you have a vector you can do all of the calculations you want -- exactly in the same way you did it for a dataframe. You can check the length of the vector `my_vec3`, i.e. the number of values stored in the vector. Use the function `length()`.

```r
my_vec3.length <- _____ # can you already guess that the length is before running this?
```

You can also sum the values stored in the vector. Use the sum() function.

```r
my_vec3.sum <- _____
```

Now, calculate the mean *by hand*. I know the `mean()` function is very convenient... but it'll be just 5 values, and it's always good to brush things up, right? Use the variables we just created above (i.e., sum and length).

```r
my_vec3.meanHand <- _____
```
  
Does the `mean()` function give you the same result?

```r
my_vec3.mean <- _____ 
```

Calculate the standard deviation of `my_vec3` above *by hand*. It's gonna be a pain, I know -- bear with me please!

```r
my_vec3.SS <-  # You could use the square-bracket method to refer to each value of the vector. You also have already calculated and stored the mean above; make sure you use it! Finally, don't forget to square each difference! 
variance <- _____ # what do we do now?
my_vec3.sdHand <- _____ # what should we finally do to get the standard deviation from the variance? Here, the function sqrt() may be kinda helpful here...
```

Cool -- now let's check if you get the same result with the sd() function

```r
my_vec3.sd <- ____ # does this give you the same result?
```

As I was saying before, dataframes (or datasets) are just vectors bound together. This means you can creat your own dataframe by combining vectors! The `data.frame()` function will help with that. 

```r
_____ <- data.frame(___, ___) # make a dataframe of the vectors 'my_vec' and 'my_vec2'
____ # call the new dataframe and see what it looks like!
```