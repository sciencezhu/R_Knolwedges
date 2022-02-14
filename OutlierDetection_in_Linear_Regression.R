## Cook's Distance
##https://www.rdocumentation.org/packages/car/versions/1.2-16/topics/Cook's%20Distances

plot(cookd(lm(prestige ~ income + education, data=Duncan)))


#############################################################################################################################################################
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

##############################################################################################################################################################
## Mahalanobis Distance and Multivariate Outlier Detection in R
## Finding outliers that breaks linearity
## https://towardsdatascience.com/mahalonobis-distance-and-outlier-detection-in-r-cb9c37576d7d

mahalanobis(x, center, cov, inverted = FALSE, ...)

## Returns the squared Mahalanobis distance of all rows in x and the vector \(\mu\) = center with respect to \(\Sigma\) = cov. This is (for vector x) defined as $$D^2 = (x - ## \mu)' \Sigma^{-1} (x - \mu)$$




##  https://rpubs.com/jjsuarestra99/mahalanobis
##  Mahalanobis Distance and its Limitations
##  This one has methods of how to improve the mahalanobis methods.




