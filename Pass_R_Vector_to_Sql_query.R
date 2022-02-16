#############  https://stackoverflow.com/questions/47834160/pass-r-vector-to-sql-query

## 1) sprintf Convert id into a string suitable for inclusion in the SQL statement and then insert it into the sql string using sprintf See ?sprintf .

id <- c('00003', '00100')
idString <- toString(sprintf("'%s'", id))  # "'00003', '00100'"
sql_fmt <- "select * from prod_cust_vw.store_dim where store_num in (%s)"
sql <- sprintf(sql_fmt, idString)
sql
## [1] "select * from prod_cust_vw.store_dim where store_num in ('00003', '00100')"


## 2) fn$ or use fn$ from the gsubfn package. Prefacing sqlQuery (or any R function) with fn$ causes the actual arguments to be scanned and the $variables replaced with 
## their contents (where the variable names should only contain letters and numbers in order for it to distinguish between them and other strings). See ?fn .

library(gsubfn)

fn$sqlQuery(channel = channel, query = "select *
       from prod_cust_vw.store_dim
       where store_num in ($idString)")
