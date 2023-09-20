################## STATISTICS FOR PSYCHOLOGY PSYCH-UH 1004Q #############################################################
######################## RECITATION 8: factorial ANOVAs ################################################################

library(tidyverse) # open our beloved package

#########################################################################################################################
#########################################################################################################################
#### Back in 2008, hospitals were reporting an increase in injuries related to playing Nintendo Wii (http://www.telegraph.co.uk/news/uknews/1576244/Spate-of-injuries-blamed-on-Nintendo-Wii.html). These injuries were attributed mainly to muscle and tendon strains. A researcher was interested to see whether these injuries could be prevented. They hypothesized that a stretching warm-up before playing Wii would help lower injuries, especially for athletes because their regular activity makes them more flexible. She took 60 athletes and 60 non-athletes (factor 1: `athlete`), and within this group half did a 5-minute stretch routine before playing/watching whereas the other half did not (factor 2: `stretch`). The outcome was a pain score out of 10 (where 0 is no pain, and 10 is severe pain) after playing Nintendo Wii for 4 hours (outcome: `injury`). Let's conduct a factorial ANOVA to test whether being an athlete and/or doing stretching before playing could prevent injury.

# Let's store the dataframe as a variable so we can take a look it more clearly.
wii <- 

### Let's revise the commands in the past recitations. Let's create a summary table with the descriptive statistics of the dataset (mean, min, max, sd, se) for each group

wiiSummary <- 

## why don't we plot this?

interactionPlot <- ggplot(_______, aes(x=_______, y=_______, # let's put the athlete factor on the x-axis
                                          # Remember -- the next three arguments of the aes function will tell ggplot the aesthetics of the points and lines we are going to plot:
                                          color=_______, # `color` wants the *variable name* which we want the contour of the geometries below to change by
                                          fill=_______,  # `fill` wants the *variable name* which we want the filling of the geometries below to change by
                                          group=_______)) + # `group` wants the *variable name* which we want to group the dataset by
  geom_????() + geom_?????() # plot overlaying point and line geometries

interactionPlot # call the plot to see it in the pane

## What does the plot suggest? It is ordinal/monotonic or disordinal/non-monotonic?

### Let's build an ANOVA model to see if injury is predicted by either/both factors. But first -- what is the format of the dataset? It is ready to be part of the ANOVA calculations? -> Yes, it is as it is in long format!

# The formula will have now *two* predictors on the right of the tilde ~ operator. Let's take a look at the formula help on the right to see how to properly construct the formula with two (or more) predictors.

model <- aov(_____ ~ _____ ? ___, data=____) # we should name it so to call it
model # like this

_____(model) # let's see what the model says and let's interpret the ANOVA table together.



