## https://www.r-bloggers.com/2019/09/selecting-the-max-value-from-each-group-a-case-study-data-table/


mtcars[, .SD[which.max(mpg)], by = cyl]

mtcars[, .I[which.max(mpg)], by = cyl]    ## This approach is slightly faster per the above link's benchmark results.



## or

mtcars[, .SD[get("mpg")==max(get("mpg")), by=c("cyl)]
