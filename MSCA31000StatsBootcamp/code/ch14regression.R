Y <- c(1,2,1.3,3.75,2.25)

X <- c(1,2,3,4,5)

regobj <- data.frame(X=c(2,4,4,5,6),Y=c(5,6,7,11,12))

## Ch 14 - Q 18

My <- mean(angerdata$Anger.Out)
Mx <- mean(angerdata$Control.Out)
sy <- sd(angerdata$Anger.Out)
sx <- sd(angerdata$Control.Out)
r <- cor(angerdata$Control.Out,angerdata$Anger.Out)