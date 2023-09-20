################## STATISTICS FOR PSYCHOLOGY PSYCH-UH 1004Q #############################################################
#################### RECITATION 3: plotting and z #######################################################################
#########################################################################################################################
#########################################################################################################################

#install.packages("tidyverse") # you don't need to run this line if you have already installed tidyverse before
library(tidyverse) # run this line to be able to use all the functions we need.

# Let's read the dataset we are gonna be playing with today.
spiderData <- ______(______) # import the csv file enclosed in the folder you downloaded for the class
spiderData # call the dataframe to have a look at it. 

#########################################################################################################################
#### SECTION 1: distribution plots  #####################################################################################
#########################################################################################################################

# The primary R package for plotting is called `ggplot2`, and it is included in the tidyverse package you have already installed and downloaded. There are many other plotting packages available, but in this class we will be focusing on `ggplot2` in this class. 

## Imagine we can to take a look at the distribution of the anxiety levels across sujects, independently of whether they were presented with a picture of a spider or an actual spider. What kind of plot can we use?

### Here's how ggplot works. You first use the ggplot() function. # The function wants at least one thing: 
ggplot(data = ___)+ # the dataset it needs to retrieve the data from. This will just draw the frame of plot. You then add a `+` for further instructions to give for plotting.
  geom_histogram(aes(x = ___)) # after the ggplot() function you then specify what kind of plot you want. All kinds of plots have the same form: geom_*(). In this case we want a histogram, so the right function would be: geom_histogram. The one argument you need to finally plot the historam is the aes() function, which stands for "aesthetics" and basically takes the variables you want to plot in the x- and y-axes. Given that this is an histogram, the y-axis is predefined as frequency/count; but the x-axis must be associated to the right variable/column of the dataset define in the line above. What is that variable?

# Once you run the two lines above, the plot will appears within the Plots tab in the lower right pane, but it *won't* be stored. This means that you will have to run the two lines every time you want to take a look at that plot. How do we avoid that? We will have to assign it a name like we learnt to do it in the past weeks! Please rewrite the code above -- not copying-and-pasting please! :) - and assign it a variable name. Notice that once you assign the plot a name, it will not appear in Plots tab when you run the code. You will have to call it!

# If you want to be fancy, you could easily choose the color of the bars!
___ <- ggplot(data = ___)+ 
  geom_histogram(aes(x = ___), color='___', fill='____') #add the name of the color you want instead of the ____. the `color` argument will change the border color; the `fill` argument will change the filling color of the bars!
____ # Remember that, if you assign your plot a name, you will have to call the plot to make it appear in the Plots tab in the lower right panel

#########################################################################################################################
#### SECTION 2: summary and plotting ####################################################################################
#########################################################################################################################

# Let's calculate mean, sd, and see for each condition group by using tidyverse.

spiderSummary <- spiderData %>% # first, let's use our %>% (pipe) operator. Remember, think about it as turbine
  group_by(____) %>% # the group_by() function will split the original dataset in two depending on the values of the variable/column we put inside of it. Notice that %>% will have to be typed in at every step
  summarise(meanAnxiety = mean(___), 
            sdAnxiety = _____, 
            obs = n(), # this function (notice that it has the parentheses, but no arguments!) will return the number of observations/rows for each value of the variable you are grouping by
            seAnxiety= _____) # the summarise() function will make up a *brand-new* dataset from the original dataset and takes as many variables as we want.

# How cool is that? You have basically learnt a quick shortcut to calculate descriptive statistics measures in just one line of code!

# We can now plot the means and the standard errors of the dependent variable (Anxiety) in the two groups ("picture" and "real-spider"). Let's do it together!

plotMeans <- _____(data=___)+ # the dataframe first -- which one are we using?
                geom_?????(aes(x=____, y=_____))+ # which geometry should we use? Let's use the helper to find out!
                geom_?????()+ # we also want to put standard error bars -- let's see if the helper could lead us in the right direction
                labs() # finally, we would also like to add a title for the plot and new labels for the axes -- check the helper for further information about the labs() function
plotMeans # let's call the plot and see what it looks like -- do we like it? do we want to change something?

# We are not ready to introduce a new data type: factor! Do you remember what is a factor? A factor is basically another term for the independent variable (along with predictor). A factor may be either continuous or discrete; and may belong to any of the scale types we have seen at the beginning of the semester: nominal, ordinal, interval, ratio. It is important to let R know about what variable of our dataset is a factor for a two reasons. First, it will make it easier for statistical analysis (we will see this in the next units of the class). Second, it is important for plotting. We are introducing factors here, because we care about plotting at the moment. 

# Our dataset the factor is called Group, and have two levels: "picture" and "real-spider". To check that is actually recognized by R as a factor, we can use the is.factor() function

is.factor(____)

# Ha! It's not a factor. We have to fix that. How do we do it? We use the as.factor() function

______ <- as.factor(______)

is.factor(____) # check again if now Group is a factor.

# Now that we have made sure things are labels as they should, we can move on and plot the means! But first let's make sure that the levels are correctly spelt out. 

levels(_____) # type in the predictor variable of the dataset

# The levels for the predictor variable are "picture" and "real-spider". What if we want to rename the levels to, for example, "Picture" and "Real spider", to make it nicer. How do we do that? We use the fct_recode() function - I will show you this line of code for simplicity. 

spiderSummary$Group <- fct_recode(spiderSummary$Group, Picture = "picture", `Real Spider` = "real-spider")

# Also, levels are usually ordered alphabetically. So in our case, "Picture" will precede "Real spider". But what if we want to reorder them, so that, for example, the level "Real spider" precedes "Picture". How we do that? we use the fct_relevel() function - I will show you this line of code for simplicity. 

spiderSummary$Group <- fct_relevel(spiderSummary$Group, "Real Spider", "picture")

# to check that everything is in order we can see the levels of our factor with the levels() function

levels(spiderSummary$Group)

# Let's now plot the means again and see if everything is in order! Do *not* copy and paste pleaaaaaaaase!!!

plotMeansTwo <-
plotMeansTwo # let's call the plot and see what it looks like -- do we like it? do we want to change something?

#########################################################################################################################
#### SECTION 3: z-test and distribution #################################################################################
#########################################################################################################################

## I also wanted to do some practice with z/norm distribution and the pnorm() and qnorm() function. We will be using these functions (and similar ones for the other statistical tests), so it is important to grasp what they do and why they are useful. If you look at the description of the functions in the helper (do that now, please), you will see that pnorm(), qnorm(), and the other functions for the normal distribution, assume a mean of 0 and a sd of 1. This means that if you use these functions without specifying the mean and sd, R will assume you are dealing with a *standard* normal distribution (i.e., the z-distribution). 

# The pnorm() function will spit out the percentile or the p-value corresponding to a given value, mean and sd. The qnorm() function will spit out the quantile (i.e., the value) corresponding to a given p-value, mean, and sd. Essentially, pnorm() and qnorm() are the counterpart of one another. So, let's practice this!

# Find the one-tailed z-score for p=0.32. The functions will assume you want the one-tailed value for the left/lower tail; but if you rather want the right/upper tail, you can change it by specifying the argument lower.tail=FALSE in function. 

_norm(p=___, lower.tail=___)

# Find the one-tailed p-value for z=1.5.

_norm(q=___, lower.tail=___)

#Alternatively, for pnorm() you can also calculate it by subtracting the function from 1.

1 - _norm(q=___)

# Find the two-tailed z-score for p=0.32. If we want the two-tailed quantile value for a given p, it means that the p-value is also two-tailed. What does this mean?

_norm(_=__)

# Find the two-tailed p-value for z=1.5. The p-value spit out by the pnorm() function will always be one-tailed. How do we make two-tailed?

pnorm(q=_, lower.tail=F)____


