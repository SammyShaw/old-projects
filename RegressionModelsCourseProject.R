## Regression Models Course Project

library(datasets)
str(mtcars)

summary(mtcars$mpg)

# Recode transmission type to a factor variable
mtcars$am<-factor(mtcars$am)
levels(mtcars$am)<-c("Automatic", "Manual")

# Bivariate boxplot
boxplot(mpg~am, data=mtcars, ylab="Miles Per Gallon", main="MPG by Transmission Type", col="pink")

# Recode other variables to factor
mtcars$cyl<-factor(mtcars$cyl)
levels(mtcars$cyl)<-c("4cyl", "6cyl", "8cyl")
mtcars$vs<-factor(mtcars$vs)
levels(mtcars$vs)<-c("V-shape", "Straight")
mtcars$gear<-factor(mtcars$gear)
levels(mtcars$vs)<-c("3", "4", "5")
mtcars$carb<-factor(mtcars$carb)
levels(mtcars$carb)<-c("1", "2", "3", "4", "5", "6", "7", "8")

# Possible other correlations
with(mtcars, cor.test(mpg, wt))[4:3]
with(mtcars, cor.test(mpg, hp))[4:3]
with(mtcars, cor.test(mpg, disp))[4:3]
with(mtcars, cor.test(mpg, drat))[4:3]
with(mtcars, cor.test(mpg, qsec))[4:3]

# Possible other correlated factors
t.test(mpg~am, data=mtcars)[3]
t.test(mpg~vs, data=mtcars)[3]
summary(lm(mpg~gear, data=mtcars))$coef
summary(lm(mpg~carb, data=mtcars))$coef

# Since just about everything appears related with mpg, it would make sense to add everything in a full model. But I already know that gears are correlated with transmission type, and I 'qsec' is a performance measure, so it would be spuriously related to mpg, not a determiant of mpg. 

# Lets begin with a full model and reduce stepwise
fullmodel<-lm(mpg~am+cyl+disp+hp+drat+wt+vs+carb, data=mtcars); # i.e, full without qsec and gears
summary(fullmodel)
step(fullmodel, direction="both")

best<-lm(mpg~am+cyl+hp+wt, data=mtcars)
summary(best)

# creating tables; # Ideally I want a multi-model table
