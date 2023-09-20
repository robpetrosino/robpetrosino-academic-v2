################## STATISTICS FOR PSYCHOLOGY PSYCH-UH 1004Q #############################################################
################## RECITATION 7: data wrangling and ANOVAs ##############################################################

library(tidyverse) # open our beloved package

#########################################################################################################################
############################### PART 1: wrangling #######################################################################
#########################################################################################################################
#### Today we are going to take a look at the Star Wars database that is included in the tidyverse package.
### It is already pre-loaded by running the line above, so you don't need to import anything. 
### You can just call it by typing 'starwars' in this script and run it, or run it directly in the console

starwars

# Let's store the dataframe as a variable so we can take a look it more clearly.
df <- starwars

### Let's revise the commands in the past recitations. 

starwarsEdit <- df %>% select(-films, -vehicles, -starships) %>% # first, let's remove the columns films, vehicles, and starships; don't forget the pipe %>%!
      group_by(species, gender) %>%
      summarise(meanHeight=mean(height), minHeight=min(height), maxHeight=max(height),# then, let's calculate mean, min and max values of height, mass, and birth_year by species and gender
                meanMass=mean(mass), minMass=min(mass), maxMass=max(mass),
                meanBirthY=mean(birth_year), minBirthY=min(birth_year), maxBirthY=max(birth_year))  
  
# what if I want to know how many observations I have per gender and species?
starwars %>% 
  group_by(gender, species) %>% # by gender and species
  summarise(n=n()) # use the n() function inside summarise()

# there is a faster way to do this using count()
starwars %>% 
  count(gender, species) # insert the two groups here

### Cool. Now we can play a bit with the original data and transform in the opposite format to the original one. 
## We can do this by using the function pivot_longer() or pivot_wider(). Let's have a look and see the arguments these functions take.
  
# let's first select some of the columns so it doesn't get too cluttery. Let's select:  name, height, mass, birth_year
starwarsSelect <- starwars %>% select(name, height, mass, birth_year)

## What kind of format is the dataset? --> It's wide!

# then let's use pivot_longer()
starwarsSelectTransformL <- starwarsSelect %>%
  pivot_longer(cols = height: birth_year, # indicate the columns to pivot into longer format: that is, all columns except name
               names_to = "features", # name of the column with the levels of the group
               values_to = "values") # name of the column with the actual values

# to go back to the original format we can use pivot_wider()
starwarsSelectTransformW <- starwarsSelectTransformL %>%
  pivot_wider(names_from = features, # name of the column to get the names from and transform into columns
              values_from = values) # name of the column to get the values from

### Nice uh? :)

## Now let's import the dataset from exam 1. As you may recall, the dataset you were given in exam 1 reported *real* judgment data for grammatical and ungrammatical sentences.

exam1.data <- read.csv("exam1.data.csv")

## what is the format of the dataset? -> It's wide!

## Let's change it to long!

exam1.dataLong <- exam1.data %>%
  pivot_longer(cols = grammatical:ungrammatical, # indicate the columns to pivot into longer format, that is "grammatical" and "ungrammatical"
               names_to = "condition", # name of the column with the levels of the group
               values_to = "judgment") # name of the column with the actual values

## Let's change it back to wide!

exam1.dataWide <- exam1.dataLong %>%
  pivot_wider(names_from = condition, # name of the column to get the names from and transform into columns
              values_from = judgment) # name of the column to get the values from

# compare the dataset newly wrangled with the original one. It's exactly the same!

#########################################################################################################################
############################### PART 2: ANOVA ###########################################################################
#########################################################################################################################

### To practice with ANOVA, we will use a selection of my data on word recognition. 
# Let's open it first. In this dataset, each participant saw a number of words from one frequency range only. Participants were asked to press a response button when they saw a word they recognize.

wordRT.data <- read.csv("wordRT.data.csv")

# Let's have a look. What's the format? It is okay to run an ANOVA?

# Let's build an ANOVA model to see if response time (RT) is predicted by frequency:
model <- aov(RT ~ condition, data=wordRT.data) # we should name it so to call it

model # like this

summary(model) # let's see what the model says and let's interpret the ANOVA table together.



