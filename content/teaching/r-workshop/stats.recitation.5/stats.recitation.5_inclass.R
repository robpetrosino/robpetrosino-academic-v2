################## STATISTICS FOR PSYCHOLOGY PSYCH-UH 1004Q #############################################################
####################### RECITATION 5: t-test and CIs ####################################################################
#########################################################################################################################
#########################################################################################################################

library(tidyverse) # open our beloved package

#The example relates to whether arachnophobia (fear of spiders) is specific to real spiders or whether pictures of spiders can evoke similar levels of anxiety. Twenty-four arachnophobes were used in all. Twelve were asked to play with a big hairy tarantula spider with big “fangs and an evil look in its eight eyes. Their subsequent anxiety was measured. The remaining 12 were shown only pictures of the same big hairy tarantula and again their anxiety was measured.

# load the csv file
spiderData <- read_csv("spider.csv")

# what is the research question? what's the IV? what's the DV? how can we formalize it mathematically?
# ____________

# calculate means and standard error for each group using the %>% operator, the group_by() and summarize() functions... Do we remember how we do this?
spiderData.Summary_inclass <- spiderData %>% 
  group_by(Group) %>%
  summarise(mean=mean(Anxiety), n=n(), sd=sd(Anxiety), variance=var(Anxiety), se=sd/sqrt(n))
  #first take the original dataset and then add the %>% operator
  # group by the independent variable name, and then add the %>% operation
  # create a new dataset with the summarize() function, with mean, sample size, sd, var, and se as variables
  
# let's plot our means!
graph <- ggplot(spiderData.Summary, aes(x=Group, y=mean))+ # define the dataset you want to plot the data from, and the aesthetics
  geom_col() + # define the kind of plot you want
  geom_errorbar(aes(ymin=mean-se, ymax=mean+se), width = 0.3) # define the error bar skewers
graph

# Now, what if I want to plot 95% CIs instead of SEs?
# how to we calculate CIs again? t*se/t*sp

tcrit = qt(p=0.975, df=nrow(spiderData)/2-1) # why p=0.975?
s1=spiderData.Summary$variance[spiderData.Summary$Group=="Picture"]
s2=spiderData.Summary$variance[spiderData.Summary$Group=="Real Spider"]
n1=spiderData.Summary$n[spiderData.Summary$Group=="Picture"]
n2=spiderData.Summary$n[spiderData.Summary$Group=="Real Spider"]
sp_inclass = sqrt(((s1*(n1-1)) + (s2*(n2-1)))/(n2 + n1 - 2))
ci_inclass = tcrit*sp

# let's replot the means of our data with the CIs as error bars (instead of the SEs)... don't copy and paste, pleeeeeeaseeee! :)
graphb<- ggplot(spiderData.Summary, aes(x=Group, y=mean))+
  geom_col()+
  geom_errorbar(aes(ymin=mean-ci, ymax=mean+ci), width = 0.3)
graphb

# Let's now run a statistical test! which should we run? O one-sample or a two-sample (independent) t-test? why?

## let's calculate t manually first
x1=spiderData.Summary$mean[spiderData.Summary$Group=="Picture"]
x2=spiderData.Summary$mean[spiderData.Summary$Group=="Real Spider"]
t_inclass_before = (x1-x2)/sp*sqrt(((1/n1)+(1/n2)))
t_inclass = (x1 - x2)/(sp*sqrt(((1/n1)+(1/n2))))

# once we have t, we can also retrieve the corresponding p-value, right?
pt(q=t, df=nrow(spiderData)/2-1, lower.tail = F) # this is going to be the one-tailed p-value, how to I get the two-tailed p-value?

## then we can use the t.test function to prove ourselves we grasped the calculations under the hood
t.test(Anxiety~Group, data = spiderData, alternative="two.sided", var.equal=TRUE) # let's look at the help and see how the function works!

# how do we calculate the standardized effect size (Cohen's d)?
#d = _________
#d.fromt = abs(t)*sqrt(2/nrow(spiderData))

