require(ggplot2)
## Create random numbers using distributions and create plots

set.seed(1000)

## normal distribution
rv1 <- data.frame(x=seq(1:1000),randval=rnorm(1000))
rv2 <- data.frame(x=seq(1:10000),randval=rnorm(10000))
rv3 <- data.frame(x=seq(1:1000),randval=rnorm(1000))
rv4 <- data.frame(x=seq(1:1000),randval=log10(rv3$randval))
rv5 <- data.frame(x=seq(1:1000),randval=sqrt(rv3$randval))

## plots

ggplot(rv1,aes(x=x,y=randval)) + geom_point(shape=1)
ggplot(rv3,aes(x=x,y=randval)) + geom_point(shape=1)

ggplot(rv1,aes(x=randval)) + geom_density()
ggplot(rv2,aes(x=randval)) + geom_density()
ggplot(rv3,aes(x=randval)) + geom_density()
ggplot(rv4,aes(x=randval)) + geom_density()
ggplot(rv5,aes(x=randval)) + geom_density()

# exp distribution
rv6 <- data.frame(x=seq(1:1000),randval=rexp(1000,rate=.1))
rv7 <- data.frame(x=seq(1:1000),randval=log10(rv6$randval))
rv8 <- data.frame(x=seq(1:1000),randval=sqrt(rv6$randval))

# plots
ggplot(rv6,aes(x=randval)) + geom_density()
ggplot(rv7,aes(x=randval)) + geom_density()
ggplot(rv8,aes(x=randval)) + geom_density()

ggplot(rv6,aes(x=x,y=randval)) + geom_point(shape=1)
ggplot(rv7,aes(x=x,y=randval)) + geom_point(shape=1)
ggplot(rv8,aes(x=x,y=randval)) + geom_point(shape=1)
