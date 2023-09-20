#################### STATISTICS FOR PSYCHOLOGY PSYCH-UH 1004Q #########################
#######################################################################################
#################### RECITATION 1: loading dataset ####################################
#######################################################################################

# This is a *script*. It is just a simple text file where you can *type in* commands as if you were in your favorite noting app; but the commands won't necessarily be computed automatically. By itself, R is just the console tab in the pane below in RStudio. To run a command in a script, you have two options: 1. click the "Run" button above; 2. Use a key combination: COMMAND+RETURN (for macs) and CTRL+RETURN (for PCs)

install.packages("tidyverse") # If this is the first time you are using R, you need to install this. You will have to do this only once
library(tidyverse) # run this line to be able to use all the functions we need. You will have to run line everytime you quit RStudio and open it again. 

### IMPORTANT: Notice that most of the text gets colored in green everything that it is preceded by a hash '#'. This is what in computer programming is called COMMENT. Comments are ignored by the computer (they won't be run), and they are useful to make notes on the code. You can for example comment on the purpose of the code, why you did it in that way, etc. I know this may sound wordy, but you'll be thankful to yourself when you go back to the code after some time and have comments on it -- it will spare you a lot of time trying to figure out the details you might have forgotten in the meantime!

### The first we should do before anything else is setting up our working directory. The working directory is basically the main folder where all your files are stored (and where the new files created in R, e.g. plots and new datasets will be saved). It is convenient to set it before doing anything so we can easily call files without having to define the whole path. 

getwd() # this will return your *current* working directory (which is the home directly by default)
setwd(____) # this will set your new directory. In all our activity scripts, underscores are placeholders for something else that you will have to figure out to type in. Here, just copy and paste the full path of your favourite folder (you can change this anytime).

#### R is a great tool to store variables. You can see a variable as a set of values or objects you can later call just by referring to its name. When you will have tons to datapoints to calculate over, it will be useful to choose good names for them. A good variable name should be explicit (i.e., it should clearly states what it stores) and catchy to you (i.e., it should be easy to remember.) In R, you assign a variable by the assignment operator, which can either be <- or =. You first choose a name, use the assignment operator, and then assign it to a variable. 

my_name <- ____ # type in your name in quotes
my_birth_year <- ____ # type in your birth year

# Now you've stored variables you can do operations on them. 
this_year <- ____ #For example, type in the current year we are in
my_age <- _______ - ______ # calculate your current age

#### Now you are ready to learn how to read data! To do this, you have to use a function that has the path of the file you want to import as its argument. Our datasets will always be csv (comma-separated value) files, so we will primarily use the function read_csv().

____ <- read_csv() # create a variable and insert (between quotes) the right path to import the data enclosed in the folder you downloaded.

# You can use the functions head() and tail() to have a quick look at the beginning and end of the dataframe, respectively. 
head(_____) # the beginning of the dataframe
tail(_____) # the end of the dataframe

# You can create a new variable from a specific column of the dataset. To do that, you can use the '$' operator right after calling the dataframe and selecting the column you want from the window popping up.
col1 <- ____$____ # column 1
col2 <- ____$____ # column 2
col3 <- ____$____ # column 3

#######################################################################################
#### SECTION 2: basic data types ######################################################
#### There are many kinds of data types in R. We will introduce them gradually through the semester. Let's start with the basic two data types: 
## 1. numeric: numeric values such as 7.9.
## 2. character: text/string such as "roberto" or "281928" (notice the quotes!). 
## You can check the data type of a given variable by using the class() function. Now that you have the different columns of our dataframe stored as separate variables, you can check the class each variable belong to.  
class(______) # column 1
class(______) # column 2
class(______) # column 3

# Details about each variable/column of a given dataset is also available in bulk in the str() function. Let's read it together.
str(_____) 

## You can check if a given variable is of a given data type by using the 'is.'-type functions. The console will return a logical (TRUE/FALSE) depending on whether the variable is of that type (TRUE) or not (FALSE).
# 1. is.numeric()
# 2. is.character()

is.numeric(______) # is column 1 numeric?
is.character(______) # is column 1 character?

is.numeric(______) # is column 2 numeric?
is.character(______) # is column 2 character?

is.numeric(______) # is column 3 numeric?
is.character(______) # is column 3 character?


