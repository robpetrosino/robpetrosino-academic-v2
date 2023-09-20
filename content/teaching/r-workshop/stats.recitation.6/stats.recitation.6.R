################## STATISTICS FOR PSYCHOLOGY PSYCH-UH 1004Q #############################################################
############### RECITATION 6: correlations and linear modeling ##########################################################

library(tidyverse) # open our beloved package

#########################################################################################################################
############################### DATASET 1 ###############################################################################
############################## description ##############################################################################
# A psychologist was interested in the effects of exam stress on exam performance. So, they devised and validated a questionnaire to assess state anxiety relating to exams (called the Exam Anxiety Questionnaire, or EAQ). This scale produced a measure of anxiety scored out of 100. Anxiety was measured before an exam, and the percentage mark of each student on the exam was used to assess the exam performance.
#########################################################################################################################

examData <- ____ #load the dataframe "examData.csv"
___(___) # how do look at the *structure* of the dataframe (it's not head()...)

# ok, let's plot the two variables. We will want to plot it as a scatterplot, what is the appropriate geometry?
plotExam <- ggplot(__________)+
  geom_____()
plotExam

# Let's calculate the correlation between the two variables....this function just gives you Pearson's r
r <- cor(examData$x, examData$y) # what are our x and y? Replace them with the appropriate variable from the dataset

# But remember you can always calculate Pearson's r manually. Let's try that. First, we need the covariance of the two variables. For that we need:
n <-  # the sample size -- in this case, the number of observations/rows...
meanExamScore <- ______ # the mean of the exam score variable
meanAnxietyScore <- _____ # the mean of the anxiety score variable

cov.byHand <- sum(______)  # Now, we are ready to calculate the covariance. It's the summation of the product between the differences between each value of each variable and its mean, divided by n-1
cov.byFormula <- cov(____, ____) # this is the function for covariance, just to make sure our manual calculations are correct

# Second, we need the maximum variance that the two variables could possibly have: s_x * s_y
max_variance <- ____

# Now we are ready to calculate r!
r.byHand <- _____ # is the output the same as the one spit out by the function in l. 24?

# this function gives you r, and the corresponding t-test and p-value
cor.test(x, y, alternative) #what are our x and y? what's our alternative hypothesis?

# again, you can calculate t manually
tCorr.byHand <- r.byHand/_______ # how do we do that again? the denominator is hard to remember -- it's the square root of the division of 1-r^2 and n-2.
# and from there retrieve the p-value
pt() # we want the two-tailed p-value of our t; so, what do we do here?

#########################################################################################################################
############################### DATASET 2 ###############################################################################
############################## description ##############################################################################
# A junior data scientist of a music record company is asked to predict physical and downloaded album sales from the mount of money spent advertising that album. They don't know how to do that, let's help them!
##########################################################################################################################

salesData <- ____ #load the dataframe "salesData.csv"
___(___) # how do look at the *structure* of the dataframe (it's not head()...)

# which variables do you think the data scientist needs? what is the predictor and the predicted variables?

# ok, let's scatter plot the two variables.
plotSales <- ggplot(__________)+
  geom_____() #+
  #geom_smooth(method='lm') # with this line we plot of best-fit line
plotSales

# Now we are ready to construct our linear model
salesModel <- lm(dv ~ iv, data = ______) # what is our DV and IV/predictor/factor?

salesModel # take a look at the model to retrieve the coefficients for the intercept and the slope

# you can also test the slope against the null hypothesis 
summary(______) # let's read it together

# given the intercept and the slope values, what is the right equation? 
# You will have to call the model first

intercept = ____ # this is the value of y when x=0
slope = ____ # this is the degree of change of y with respect to x 
x = 1 # you can change the value of x so to see the predicted sales!
y_hat = _____ + ( ____ * x ) # this is our equation for albums Sales!

# cool, can you predict how many album sales will be sold if we spend 400k AED as ads on that album?
## method 1: apply the equation by hand
x_400k = _______ # this is our new value of x (the amount of money we would be willing to spend as ads to promote the album)
y_hat = # just retype the equation above and replace the old x with our new x

# method 2: use the predict() command
## first create a new data with the adverts variable (with 3-5 values: 400000, ...). That variable will represent the amount spent for the album promotion.

albumPromo <- data.frame(adverts=c(________))
  
## then apply the model to the dataframe albumPromo
predict(your_model, new_data) # substitute the arguments within the function with the right variables! Taaah-daaan! :)
  




