################## STATISTICS FOR PSYCHOLOGY PSYCH-UH 1004Q #############################################################
####################### RECITATION 5: t-test and CIs ####################################################################
#########################################################################################################################
#########################################################################################################################

library(tidyverse) # open our beloved package

#The example relates to whether arachnophobia (fear of spiders) is specific to real spiders or whether pictures of spiders can evoke similar levels of anxiety. Twenty-four arachnophobes were used in all. Twelve were asked to play with a big hairy tarantula spider with big “fangs and an evil look in its eight eyes. Their subsequent anxiety was measured. The remaining 12 were shown only pictures of the same big hairy tarantula and again their anxiety was measured.

# load the csv file
spiderData <- ________

# what is the research question? what's the IV? what's the DV? how can we formalize it mathematically?
# ____________

# calculate means and standard error for each group using the %>% operator, the group_by() and summarize() functions... Do we remember how we do this?
spiderData.Summary <- #first take the original dataset and then add the %>% operator
  # group by the independent variable name, and then add the %>% operation
  # create a new dataset with the summarize() function, with mean, sample size, sd, var, and se as variables
  
# let's plot our means!
ggplot(_____, aes(_____))+ # define the dataset you want to plot the data from, and the aesthetics
  geom_????() + # define the kind of plot you want
  geom_????() # define the error bar skewers


# Now, what if I want to plot 95% CIs instead of SEs?
# how to we calculate CIs again? t*se/t*sp

tcrit = qt(p=0.975, ...) # why p=0.975?
sp = 
ci = tcrit*sp

# let's replot the means of our data with the CIs as error bars (instead of the SEs)... don't copy and paste, pleeeeeeaseeee! :)


# Let's now run a statistical test! which should we run? O one-sample or a two-sample (independent) t-test? why?

## let's calculate t manually first
t =

# once we have t, we can also retrieve the corresponding p-value, right?
pt() # this is going to be the one-tailed p-value, how to I get the two-tailed p-value?

## then we can use the t.test function to prove ourselves we grasped the calculations under the hood
t.test() # let's look at the help and see how the function works!

# how do we calculate the standardized effect size (Cohen's d)?
d = 

#d.fromt = abs(t)*sqrt(2/nrow(spiderData))

