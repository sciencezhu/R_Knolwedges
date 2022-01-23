## https://www.r-bloggers.com/2019/09/selecting-the-max-value-from-each-group-a-case-study-data-table/


mtcars[, .SD[which.max(mpg)], by = cyl]

## or

mtcars[, .SD[get("mpg")==max(get("mpg")), by=c("cyl)]
