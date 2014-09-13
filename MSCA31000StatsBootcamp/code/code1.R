## Assignment 1a
setwd("~/gitrepos/UChicagoAnalytics/MSCA31000StatsBootcamp/book/chapters/ch2")
require(ggplot2)
require(ggplot2)

## Ch2: Q3
## box plot of chess player position test

chessplayers <- read.csv("Q3exercise.csv", header = T)
cp1 <- melt(chessplayers)

chessplayersboxplot <- ggplot(cp1, 
                               aes(x = variable, 
                                   y = value, 
                                   fill = variable)) + 
                            stat_boxplot(geom ='errorbar') + 
                            geom_boxplot() +
                            guides(fill = FALSE) + 
                            stat_summary(fun.y=mean, geom="point", shape=3, size=4) + 
                            xlab("player type") + 
                            ylab("num pieces")

print(chessplayersboxplot)


## Ch 2: Q7

## data prep
graphdata <- read.csv("Q7exercise.csv", header = T)
names(graphdata) <- c("eyecolor","numstudents")
graphdata$eyecolor <- factor(graphdata$eyecolor)

## a. pie graph
## Code adapted from: http://bit.ly/1ukp8Rs

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
                        guides(fill = FALSE)  + 
    xlab("Eye Color") +
    ylab("Num Students")

print(horizontalbargraph)

## c. vertical bar chart

verticalbargraph <- ggplot(graphdata, 
                             aes(x = reorder(eyecolor,numstudents), 
                                 y = numstudents, 
                                 fill = eyecolor)) +
    geom_bar(stat = "identity", color = "black") + 
    guides(fill = FALSE) + 
    xlab("Eye Color") +
    ylab("Num Students")

print(verticalbargraph)

# d. frequency table
require(dplyr)

graphdata <- graphdata %>%
                mutate(relativefrequency = round(numstudents/sum(numstudents),2))

graphdata

## Ch 3

## Q1

data <- data.frame(num = c(1,1,2,2,2,2,3,3,4,5,6,7))

ggplot(data, aes(x = num)) + 
    geom_histogram(binwidth=1)

ggplot(data, aes(x = num)) + 
    geom_density()

## Q3 - 9

a <- c(1,2,3,4,5)
b <- c(-1,2,3,5,6)
c <- c(-100,5,5,5,100)
d <- c(-1,2,2,6,6)

e <- c(15.2,18.8,19.3,19.7,20.2,21.8,22.1,29.4)
f <- c(15.2,18.8,19.3,19.7,20.2,21.8,21.2,29.4)

g <- c(1,3,4,6,12)

## Q11

cp <- melt(chessplayers)
ggplot(cp, aes(x = value, group = variable)) + geom_density()