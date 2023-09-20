################## STATISTICS FOR PSYCHOLOGY PSYCH-UH 1004Q ###########################
#################### RECITATION 2: vectors ############################################
#######################################################################################
#######################################################################################

#install.packages("tidyverse") # you don't need to run this line if you have already 
# installed tidyverse before
library(tidyverse) # run this line to be able to use all the functions we need.

#######################################################################################
#### SECTION 1: subsetting ############################################################
#######################################################################################

eeg <- ______(______) # import the csv file enclosed in the folder you downloaded for the class
eeg # call the dataframe to have a look at it. 

# Let's have a quick look at the beginning and end of the dataframe, respectively. Do you remember how to do that?
____(_____) # the beginning of the dataframe
____(_____) # the end of the dataframe

# Similarly to vectors, you can refer to the specific value or variable in your dataset (defined as a pair of row and column number (this is usually called *indexing/subsetting* in programming).

# You already know how to select a specific column is by using the $ operator.
time <- eeg$____  # select the 'Time' column in the eeg data

# But there are another way.You can select an entire column by using square brackets '[]' right after calling the dataframe. Within the square brackets, you will have to specify a pair of numbers: the first number refers to the row and the second number is for the column you want to extract. 
time2 <- eeg[,_] # select the 'Time' column (i.e. the second column of the dataframe). Notice that you are just defining the column to be subsetting, so you can leave the first digit (for the row) inside the brackets blank.

# Similarly, you can select an entire row by specifying the number of the row, and leaving the second digit inside the brackets blank.
row25 <- eeg[,_] #  select the entire 25th row.

# You can use the same method if you want a specific cell by specifying both row and col digits inside the brackets. 

eeg[_,_] # select the cell in the 5th row and 2nd column.

## You can also *subset* the data under specific conditions. There are two ways to do this. 
# First, you can use the subset() function, which takes two arguments: the dataset you want to subset from, and the values of one the variables you want to include. 
eegSubset1 <- subset(eeg, Time _____) # create a subset dataframe of the 'eeg' dataframe that includes all observations with values of the variable Time higher than 0

# Second, you can use the tidyverse function filter()
eegSubset2 <- eeg %>% #the %>% ('pipe') OPERATOR is likely going to be your best friend in your career. I like to see it as a turbine that takes your data and molds it in the way you want it. 
  filter(Time ____) # the filter function after the %>% will just contain the conditions that the variable at hand (in this case, Time) will need to meet to be included in the new dataframe

# Once you have a subset, you can make all of the calculations you want with it. For example, imagine you want to know the *mean amplitude* across all datapoints recorded when Time > 0. How do I do it? I just use the mean() function on my subset and select the right column
meanAmpl <- mean(____$_____)
sdAmpl <- sd() # same thing for *standard deviation*

#######################################################################################
#### SECTION 2: vectors ###############################################################
#######################################################################################
## Dataframes/dataset are nothing but variables (i.e., columns) bound together. In R, variables are also called *vectors*, i.e. a series of values stored within the same variable. In the past two weeks we have been playing with column subsetting in various ways... which basically has meant for you to create separate vectors from a dataframe. Now we will learn how to create a vector by hand, i.e. without passing by a dataframe. This may sound useless a first, but it will come handy if you want to use R to make calculations for your next homework assignments. 

# We can make up a vector by using the c() function (where "c" is for "combine").
# Add 5 numeric values to the vector "my_vec" below by adding them in the parenthesis and separating them with a comma.
my_vec <- c(____, _____, _____, _____, _____)

## Notice that a vector cannot contain different datatypes. All values contained in a vector must be of the *same* datatype.
my_vec2 <- c("jon", "roberto", "sandra", "panini", "bowie")
my_vec3 <- c(my_vec, my_vec2) # This won't give you an error, but it will convert everything to character by default.

## We are now going to work on 'vector' and explore some of the properties and functions.
##
# Similarly to dataframes, vectors can be subset by using the square brackets '[]' and adding the number corresponding to the position of the number you want to refer to. 
first <- my_vec3[1] # among the numbers stored in 'my_vec3', what number will this be?
second <- my_vec3[_] # gimme the second number stored in 'my_vec3'
third <- ____ # gimme the third number stored in 'my_vec3'
eighth <- ____ # gimme the eighth number stored in 'my_vec3'
last <- ____ # gimme the last number stored in 'my_vec3'

### QUESTION: Why can't we use the '$' operator for vectors? <----

# Once you have a vector you can do all of the calculations you want -- exactly in the same way you did it for a dataframe. You can check the length of the vector 'my_vec3', i.e. the number of values stored in the vector. Use the function length().
my_vec3.length <- _____ # can you already guess that the length is before running this?

# You can also sum the values stored in the vector. Use the sum() function.
my_vec3.sum <- _____

# Now, calculate the mean *by hand*. I know the mean() function is very convenient... but it'll be just 5 values, and it's always good to brush things up, right? Use the variables we just created above (i.e., sum and length).
my_vec3.meanHand <- _____
  
# does the mean() funciton give you the same result?
my_vec3.mean <- _____ 

# Calculate the standard deviation the 'set' vector above *by hand*. It's gonna be a pain, I know -- bear with me please!
my_vec3.SS <-  # You could use the square-bracket method to refer to each value of the vector. You also have already calculated and stored the mean above; make sure you use it! Finally, don't forget to square each difference! 
variance <- _____ # what do we do now?
my_vec3.sdHand <- _____ # what should we finally do to get the standard deviation from the variance? Here, the function sqrt() may be kinda helpful here...

# Cool -- now let's check if you get the same result with the sd() function
my_vec3.sd <- ____ # does this give you the same result?

## As I was saying before, dataframes (or datasets) are just vectors bound together. This means you can creat your own dataframe by combining vectors! The data.frame() function will help with that. 
_____ <- data.frame(___, ___) # make a dataframe of the vectors 'my_vec' and 'my_vec2'
____ # call the new dataframe and see what it looks like!
