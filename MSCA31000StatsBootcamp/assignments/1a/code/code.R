## Assignment 1a

## Ch 2: Q7

## data prep
setwd("~/gitrepos/UChicagoAnalytics/MSCA31000StatsBootcamp/book/chapters/ch2")
graphdata <- read.csv("Q7exercise.csv", header = T)
names(graphdata) <- c("eyecolor","numstudents")
graphdata$eyecolor <- factor(graphdata$eyecolor)

## a. pie graph
## Code adapted from: http://bit.ly/1ukp8Rs
require(ggplot2)
piechart <- ggplot(graphdata, 
                   aes(x = 1, 
                       y = numstudents, 
                       fill = eyecolor)) + 
            ggtitle("Eye Colors") + 
            coord_polar(theta = "y") + 
            geom_bar(stat = "identity", color = "black") +
            guides(fill=guide_legend(override.aes=list(colour=NA))) + 
            theme(axis.ticks=element_blank(), 
                  axis.title=element_blank(), 
                  axis.text.y=element_blank()) 

y.breaks <- cumsum(graphdata$numstudents) - graphdata$numstudents/2

piechart <- piechart + 
                theme(axis.text.x=element_text(color='black')) + 
                scale_y_continuous(
                    breaks=y.breaks,   # where to place the labels
                    labels=graphdata$eyecolor # the labels
                )

print(piechart)

## b. horizontal bar chart

horizontalbargraph <- ggplot(graphdata, 
                             aes(x = reorder(eyecolor, numstudents), 
                                 y = numstudents, fill = eyecolor)) +
                        ggtitle("Eye Color") + 
                        geom_bar(stat = "identity", color = "black") + 
                        coord_flip() + 
                        guides(fill = FALSE) + 
                        theme(axis.title=element_blank())

print(horizontalbargraph)

## c. vertical bar chart

verticalbargraph <- ggplot(graphdata, 
                             aes(x = reorder(eyecolor,numstudents), 
                                 y = numstudents, 
                                 fill = eyecolor)) +
    ggtitle("Eye Color") + 
    geom_bar(stat = "identity", color = "black") + 
    guides(fill = FALSE) + 
    theme(axis.title=element_blank())

print(verticalbargraph)

# d. frequency table
require(dplyr)

graphdata <- graphdata %>%
                mutate(relativefrequency = round(numstudents/sum(numstudents),2))

graphdata

