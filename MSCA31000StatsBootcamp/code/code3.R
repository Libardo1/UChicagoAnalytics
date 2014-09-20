## Chapters 10, 11, 12, 13

## Ch. 10 - Q24
genderdata <- angerdata %>%
                select(Gender, Anger.Out) %>%
                mutate(gender=ifelse(Gender == 1, "male", "female"))

gd <- genderdata %>%
                    group_by(gender) %>%
                    summarise(num = n(),
                              meanval=mean(Anger.Out),
                              varval=var(Anger.Out))

diffmeans <- gd[gd$gender == 'male',3] - gd[gd$gender == 'female',3]

sse_female <- sum((genderdata[genderdata$gender == "female",2]-gd[gd$gender == 'female',3])^2)

sse_male <- sum((genderdata[genderdata$gender == "male",2]-gd[gd$gender == 'male',3])^2)

mse <- (sse_female + sse_male)/(sum(gd$num) - 2)

nh <- 2 / ((1/gd[gd$gender == "female",2]) + (1/gd[gd$gender == "male",2]))

stderror <- sqrt(2*mse/nh)

t <- qt(c(.005,.995),(sum(gd$num) - 2))

lower_limit <- diffmeans + (t[1] * stderror)

upper_limit <- diffmeans + (t[2] * stderror)


############

## Ch. 10 - Q 25

sportdata  <- angerdata %>%
    select(Sports, Anger.In) %>%
    mutate(sport=ifelse(Sports == 1, "athletes", "nonathletes"))

sportcat <- sportdata %>%
                group_by(sport) %>%
                summarise(num = n(),
                          meanval=mean(Anger.In),
                          varval=var(Anger.In))

diffmeans <- sportcat[sportcat$sport == 'nonathletes',3] - sportcat[sportcat$sport == 'athletes',3]

sse_nonathletes <- sum((sportdata[sportdata$sport == "nonathletes",2] - 
                            sportcat[sportcat$sport == 'nonathletes',3])^2)

sse_athletes <- sum((sportdata[sportdata$sport == "athletes",2] - 
                         sportcat[sportcat$sport == 'athletes',3])^2)

mse <- (sse_nonathletes + sse_athletes)/(sum(sportcat$num) - 2)

nh <- 2 / ((1/sportcat[sportcat$sport == "nonathletes",2]) + 
               (1/sportcat[sportcat$sport == "athletes",2]))

stderror <- sqrt(2*mse/nh)

t <- qt(c(.025,.975),(sum(sportcat$num) - 2))

lower_limit <- diffmeans + (t[1] * stderror)

upper_limit <- diffmeans + (t[2] * stderror)

## Ch 12 - Q 21

