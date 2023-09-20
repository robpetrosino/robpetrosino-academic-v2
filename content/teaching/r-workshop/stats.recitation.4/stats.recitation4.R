################## STATISTICS FOR PSYCHOLOGY PSYCH-UH 1004Q #############################################################
#################### RECITATION 4: plotting, z and CIs ##################################################################
#########################################################################################################################
#########################################################################################################################

#install.packages("tidyverse") # you don't need to run this line if you have already installed tidyverse before
library(tidyverse) # run this line to be able to use all the functions we need.

#########################################################################################################################
#### SECTION 1: more distribution plots  ################################################################################
#########################################################################################################################

spiderData <- ______(______) # import the csv file enclosed in the folder you downloaded for the class
spiderData # call the dataframe to have a look at it. 

### Last time we learned how to plot a histogram and a barplot. Today we will add one more plot type: density plots. A density plot can be seen as an extension of the histogram. As opposed to the histogram, the density plot can smooth out the distribution of values and reduce the noise. As such density plots work better at determining the distribution shape (the concept of the shape of a probability distribution arises in questions of finding an appropriate distribution to use to model the statistical properties of a population, given a sample from that population) because they’re not affected by the number of bins. Remember that this also means that both histogram and density plots are suitable for *continuous* variables, but not for discrete variables.

# The code structure is the same as we have seen last time.
densityAnxiety <- ggplot(data = ___)+ # the dataset it needs to retrieve the data from. This will just draw the frame of plot. You then add a `+` for further instructions to give for plotting.
  geom_?????(aes(x = ___)) # as much as histogram, density is a geometry. So let's see what's the name for it! 
densityAnxiety # call the plot to visualize it

# We could even have histogram and density overlaid with one another! Just by adding them to the same plot 
histo.densityAnxiety <- ggplot(data = ___)+ 
  geom_histogram(aes(x = ___))+ # you might need to change some parameter here... plot this and see what happens! 
  geom_?????(aes(x = ___))
histo.densityAnxiety # call the plot to visualize it

# Remeber that to avoid redundancy, if the geometries of your code *share* the same dataset and x and y variables, you can add that info in the ggplot() function call, instead of repeating it for each geometry. Let's do it together!
histo.densityAnxietyOverlay <- ggplot()+ 
  geom_?????()+
  geom_?????()
histo.densityAnxietyOverlay # call the plot to visualize it

#########################################################################################################################
#### SECTION 2: z-test and distribution #################################################################################
#########################################################################################################################

## Let's do some practice with z/norm distribution and the pnorm() and qnorm() function. We will be using these functions (and similar ones for the other statistical tests), so it is important to grasp what they do and why they are useful. If you look at the description of the functions in the helper (do that now, please), you will see that pnorm(), qnorm(), and the other functions for the normal distribution, assume a mean of 0 and a sd of 1. This means that if you use these functions without specifying the mean and sd, R will assume you are dealing with a *standard* normal distribution (i.e., the z-distribution). 

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

_norm(q=_, lower.tail=F)____

#########################################################################################################################
#### SECTION 3: confidence intervals ####################################################################################
#########################################################################################################################

#### Let's now read the EEG dataset. To review what we have done so far, let's calculate the mean, sd, var, and se of the amplitude for the electrodes "Cz", and "T7". Let's use the %>% operator, the group_by() function, and the summarise() function to do that in one shot!

eegData <- _____(____) # load the eeg dataset

summaryEEG <- eegData %>% # take the original dataset
  ______(________) %>% # filter the electrode variable 
  ______(________) %>% # group by electrode
  _________(meanAmpl = mean(_____), # make a new dataframe with these variables
            sdAmpl = sd(______),
            varAmpl = var(______),
            nObs = _____,
            seAmpl= _________)

## Let's also plot the mean of the amplitude for the electrode "Cz", together with the error bars showing its standard error. Feel free to use the help engine if you don't remember the function names!
plotAmplSE <- ggplot(_______, ____(___, ____))+ #load the dataset and set aesthetics
  _____(____)+ # set geometry barplot
  ______(___________) # add errorbars with SE; you may want to adjust the width of the skewers too
plotAmplSE

## Cool. Now, What if I want to plot 95% CIs instead of SEs? How do we calculate CIs again?
ci = tcrit * se # Remember you can't run this just yet, If you try, it will give you an error! We will first need to store each term as a variable!

_____ = qt(__, __) # first term
_____ = _____ # second term

ci = tcrit * se # now you can run it!
  
# And now are actually ready to plot the CIs as error bars!  Don't copy and paste pleaaaaaaase!!!
plotAmplCI <-  _____(_______, ____(___, ____))+ # load the dataset and set aesthetics
  _____(____)+ # set geometry barplot
  ______(___________) # add errorbars with CIs; you may want to adjust the width of the skewers too
plotAmplCI

### Boom. Neat, uh?

