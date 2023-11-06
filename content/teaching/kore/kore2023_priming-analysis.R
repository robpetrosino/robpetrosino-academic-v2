library(tidyverse)

# read the data.koreRawframe needed
data.kore <- read.csv("priming-kore_raw-data.csv")

### Prime duration

refreshRate = 60 # Hz this can be changed you we please
msRate = 1/refreshRate # this are the milliseconds lagging between frame flips
critPrimeLower = (msRate/2)*1000 # this our criterion
critPrimeUpper = 60
targetPrimeTime = 33 # s. it's the target prime time

data.kore %>% summarise(sumPrimeOut=sum(primeTime<targetPrimeTime-critPrimeLower, primeTime>targetPrimeTime+critPrimeLower), percentPrimeOut=sumPrimeOut*100/n())

PrimeOutStats <- data.kore %>% group_by(Rec_Session_Id) %>% 
  summarise(sumPrimeOut=sum(primeTime<targetPrimeTime-critPrimeLower, primeTime>targetPrimeTime+critPrimeUpper), percentPrimeOut=sumPrimeOut*100/n())

data.kore <- data.kore %>% filter(primeTime>=targetPrimeTime-critPrimeLower & primeTime<=targetPrimeTime+critPrimeLower) #apply criterion

data.kore <- data.kore %>% filter(condition_rec != 'warmup')

data.kore %>% group_by(Rec_Session_Id) %>% count()

#### SUBJECT AND WORD ERROR REMOVAL ####

word.error.scores <- data.koreFinal %>% group_by(condition_rec, target_rec) %>% filter(condition_rec != 'nw_fillers') %>%
  summarise(word.percent=sum(responseError==1)*100/n()) #check how many words were discaded
wordToRemove <- word.error.scores %>% filter(word.percent > 30)
wordToRemove <- unique(wordToRemove$target_rec)

sj.error.scores2 <- data.koreFinal %>% group_by(Rec_Session_Id) %>% 
  summarise(corrSum=sum(responseError==0), corrP=(corrSum*100)/n(),
            sj.err=sum(responseError==1), sj.err.percent=(sj.err*100)/n())
sjToRemove <- sj.error.scores2 %>% filter( sj.err.percent > 30 )
sjToRemove <- sjToRemove$Rec_Session_Id

good.subjects <- data.koreFinal %>%
  filter((!target_rec %in% wordToRemove) & (!Rec_Session_Id %in% sjToRemove)) #cut

#subsetting correct RTs and dropping useless columns
good.subjects <- good.subjects %>% filter(responseError==0)

#### RT OUTLIER REMOVAL PIPELINE ####
rtLower <- 200
rtUpper <- 1800

goodSubjects <- good.subjects %>% 
  filter(RT > rtLower & RT < rtUpper)

goodSubjects %>% summarise(n.subjects=n_distinct(Rec_Session_Id))

#### PRIMING CALCULATIONS #####

means.subj <- goodSubjects %>% group_by(Rec_Session_Id, condition_rec, primetype_rec) %>%
  summarise(meanRT = mean(RT, na.rm=T)) 

primingSubj <- means.subj %>% 
  pivot_wider(names_from=primetype_rec, values_from=meanRT) %>%
  mutate(priming = unrelated-related)

primingEffects <- primingSubj %>% group_by(condition_rec) %>%
  summarise(grandPriming = mean(priming, na.rm=T), se = sd(priming, na.rm=T)/sqrt(n()))

primingEffects$condition_rec <- factor(primingEffects$condition_rec, 
                                        levels=c("identity", "transparent", 
                                                 "opaque", "orthographic", "semantic"))


priming.plot <- ggplot(primingEffects, aes(x=condition_rec, y=grandPriming))+
  geom_bar(stat="identity")+
  geom_errorbar(aes(ymin=grandPriming-se, ymax=grandPriming+se), width=.3)+
  theme_bw()+
  theme(#axis.line = element_line(colour = "black"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(), 
    panel.border = element_blank(),
    legend.position="none"
    #panel.background = element_blank() 
  ) +
  xlab("condition")+
  ylab("priming effects (ms)") + labs(title="Experiment 1")
dominancePlot

#### STATS ####

# t-tests

library(rstatix)

means.subj %>% group_by(condition_rec) %>%
  t_test(RT ~ primetype_rec, paired=T)

# pairwise comparisons

primingSubj %>%
  pairwise_t_test(
    priming ~ condition,
    p.adjust.method = "bonferroni")