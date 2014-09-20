angerdata <- read.csv("angerdata.csv", header = T)

require(ggplot2)

## Q10 - histogram of distribution
ggplot(angerdata, 
       aes(x = Control.Out)) + 
    geom_histogram(binwidth = 1, colour="black", fill="white")

## extra density plot
ggplot(angerdata, aes(x = Control.Out)) + 
    geom_histogram(aes(y=..density..),      # Histogram with density instead of count on y-axis
                   binwidth=.5,
                   colour="black", fill="white") + 
    geom_density(alpha=.2, fill="#FF6666")

require(dplyr)

## Q11
## overall control out mean
angerdata %>% summarise(mean(Control.Out))

## athlete control out mean

angerdata %>% filter(Sports == 1) %>% summarise(mean(Control.Out))

## non-athlete control out mean

angerdata %>% filter(Sports == 2) %>% summarise(mean(Control.Out))

## Q17: box plots by sports participation

sp <- angerdata %>% 
        select(Anger_Expression, Sports) %>% 
        mutate(SportParticipation = ifelse(Sports == 1, "Athlete", "NonAthlete"))

ggplot(sp, 
       aes(x = SportParticipation, 
           y = Anger_Expression, 
           fill = SportParticipation)) + 
    stat_boxplot(geom ='errorbar') + 
    geom_boxplot() +
    guides(fill = FALSE) + 
    stat_summary(fun.y=mean, geom="point", shape=3, size=4) + 
    xlab("Sport Participation") + 
    ylab("Anger Expression")

## Q18: box plots by gender

gp <- angerdata %>% 
        select(Anger_Expression, Gender) %>% 
        mutate(Gender = ifelse(Gender == 1, "Males", "Females"))

ggplot(gp, 
       aes(x = Gender, 
           y = Anger_Expression, 
           fill = Gender)) + 
    stat_boxplot(geom ='errorbar') + 
    geom_boxplot() +
    guides(fill = FALSE) + 
    stat_summary(fun.y=mean, geom="point", shape=3, size=4) + 
    xlab("Gender") + 
    ylab("Anger Expression")

## Q20 correlation at .01 level

cor.test(angerdata$Control.Out,angerdata$Control.In, conf.level=.99)

## Q21 correlation between Anger Out and Control Out

cor.test(angerdata$Control.Out,angerdata$Anger.Out, conf.level=.01)
