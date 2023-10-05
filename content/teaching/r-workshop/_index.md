---
title: 📈 Statistics and data analysis with R

summary: Basic introduction to R language programming for data analysis, data visualization (plotting), and statistical analysis. 

links:
    -  icon_pack: fa
       icon: file-zipper
       name: Scripts
       url: /teaching/r-workshop/r-workshop_scripts.zip

type: book
weight: 1
---

## A hopefully wowing introduction to R 

Before getting started with some simple programming class, I wanted to present you with a quick demo to show you what you will learn to do in R in this class. We will go over each of the following steps in each class, so do not freak out if you don't understand everything right off the bat.

```r
library(tidyverse) ## this is a set of packages that contain useful packages for plotting and dataset management
```

In R, we import data by using the function `read_csv()`. Once you run the line below, the data will appear in right pane. 

```r
spiderData <- read_csv("spider.csv") # import the data and assign it to a variable
```

The dataset reports the anxiety levels recorded in two groups of arachnophobic subjects. One group was presented with just a picture of a spider. The other group was presented with a real spider. Since we're here: what the dependent variable/outcome? What is the independent variable/factor/predictor? What are its levels?

Once you have imported your data, you can do lots of stuff!

1. You can calculate the mean and standard deviations for each group

```r
summary <- spiderData %>% group_by(Group) %>% # the group_by function groups the data by the values (levels) of the Group variable
  summarise(meanAnxiety = mean(Anxiety), sdAnxiety = sd(Anxiety), seAnxiety=sdAnxiety/sqrt(n())) # the summarise function creates a new dataframe with three columns: the anxiety mean, sd, and standard error
```

To see the new table, you can either click on the corresponding line in the Data pane on the right pane.  

```r
summary # or just call it here and run it so to make it appear in the R console below.
```

2. You can plot the data in many different ways. For example, you can look at the overall distribution

```r
ggplot(spiderData, aes(x=Anxiety))+ #the ggplot() function first takes the dataframe to plot; in the embedded function aes() you define the variables to be plotted on the axes
  geom_histogram(binwidth=1)# choose the kind of plot you want (in this case, a histogram distribution plot)

ggplot(spiderData, aes(x=Anxiety))+ #the ggplot() function first takes the dataframe to plot; in the embedded function aes() you define the variables to be plotted on the axes
  geom_freqpoly(stat='count') # choose the kind of plot you want (in this case, a frequency polygon distribution plot)

# you can even overlay different kinds of plots together
ggplot(spiderData, aes(x=Anxiety))+
  geom_histogram()+ #histogram distribution plot
  geom_freqpoly(stat='count') #frequency polygon distribution plot

ggplot(spiderData, aes(x=Anxiety))+ #the ggplot() function first takes the dataframe to plot; in the embedded function aes() you define the variables to be plotted on the axes
  geom_density() # choose the kind of plot you want (in this case, a density distribution plot)

# you can even overlay different kinds of plots together
ggplot(spiderData, aes(x=Anxiety))+
  geom_histogram(stat='density')+ #histogram distribution plot
  geom_density() #density distribution plot

# you can create overlaying plots with different colors for different groups/conditions
ggplot(spiderData, aes(x=Anxiety, color=Group, fill=Group))+ #the ggplot() function first takes the dataframe to plot. In the embedded function aes() you define the variables to be plotted on the axes; within the same function, you can also change the 'aesthetics' of the plot, such as color (the color of the border of the plot) and fill (the inner color)
  geom_density(alpha=0.5) # choose the kind of plot you want (in this case, a density distribution plot). The alpha argument is just to make the curves more or less transparent

## You can plot the means for each group. 
ggplot(summary, aes(x=Group, y=meanAnxiety))+ #the ggplot() function first takes the dataframe to plot. In the embedded function aes() you define the variables to be plotted on the axes; notice that here we are defining both x and y axes.
  geom_bar(stat='identity')+ # choose the kind of plot you want (in this case, a bar plot)
  geom_errorbar(aes(ymin=meanAnxiety-seAnxiety, ymax=meanAnxiety+seAnxiety), width=.2) # add error bars (you will learn what these are eventually in the course!)
```
3. Finally, you can run statistical tests. For example, if you want to see if the anxiety level (i.e., the outcome) changes depending on the kind of stimulus being presented (Group, i.e. the manipulated factor/predictor/independent variable)

```r
t.test(Anxiety ~ Group, data=spiderData, alternative='two.sided', var.equal=TRUE) # this will give you the probability of obtaining the observed data under the hypothesis that the anxiety levels does *not* change depending on whether subjects were presented a picture of a spider or a real spider
```

Hopefully this will give you a general idea of what you can and will learn to do in R! In our meetings, we will dive into each of the skills above.
