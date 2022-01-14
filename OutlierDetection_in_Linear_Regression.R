## Cook's Distance
##https://www.rdocumentation.org/packages/car/versions/1.2-16/topics/Cook's%20Distances

plot(cookd(lm(prestige ~ income + education, data=Duncan)))



## Studentized Residual or the jackknifed residuals
## https://stats.stackexchange.com/questions/204708/is-studentized-residuals-v-s-standardized-residuals-in-lm-model
## https://www.statology.org/studentized-residuals-in-r/

## No, studentized residuals and standardized residuals are different (but related) concepts.
## R in fact does provide built-in functions rstandard() and rstudent() as as part of influence.measures. The same built-in package provides many similar functions for leverage, Cook's distance, etc. rstudent() is essentially the same as MASS::studres(), which you can check for yourself like so:
all.equal(MASS::studres(model), rstudent(model))

#build simple linear regression model
model <- lm(mpg ~ disp, data=mtcars)

library(MASS)

#calculate studentized residuals
stud_resids <- studres(model)

#view first three studentized residuals
head(stud_resids, 3)


