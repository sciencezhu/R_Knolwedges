###   return multiple columns from data.table aggregation

####  https://stackoverflow.com/questions/17174653/return-multiple-columns-from-data-table-aggregation

#Try coercing to a list:
x[, as.list(quantile(value)), by=g]
   g         0%          25%         50%       75%     100%
1: a -1.7507334 -0.632331909  0.07435249 0.7459778 1.428552
2: b -2.2043481 -0.005652353  0.10534325 0.5769475 1.241754
3: c -1.9313985 -1.120737610 -0.26116926 0.6953009 1.360017
4: d -0.7434664 -0.055232431  0.22062823 1.1864389 3.021124
5: e -2.0101657 -0.468674094  0.20209610 0.6286448 2.433152



#####  https://stackoverflow.com/questions/11680579/assign-multiple-columns-using-in-data-table-by-group
x <- data.table(a = 1:3, b = 1:6) 
f <- function(x) {list("hi", "hello")} 
x[ , c("col1", "col2") := f(), by = a][]
#    a b col1  col2
# 1: 1 1   hi hello
# 2: 2 2   hi hello
# 3: 3 3   hi hello
# 4: 1 4   hi hello
# 5: 2 5   hi hello
# 6: 3 6   hi hello

x[ , c("mean", "sum") := list(mean(b), sum(b)), by = a][]
#    a b col1  col2 mean sum
# 1: 1 1   hi hello  2.5   5
# 2: 2 2   hi hello  3.5   7
# 3: 3 3   hi hello  4.5   9
# 4: 1 4   hi hello  2.5   5
# 5: 2 5   hi hello  3.5   7
# 6: 3 6   hi hello  4.5   9 



############  https://intellipaat.com/community/12994/assign-multiple-columns-using-in-data-table-by-group
library(data.table)

f <- function(x) {list("hi", "hello")}
x <- data.table(id = 1:10)
x[ , c("col1", "col2") := f(), by = id][]


## For example
Multiple_Function <- function(x) {
    list(month(x), day(x))  
}
DT[, c("Month", "Day"):=Multiple_Function(as.Date(get("Date"), format="%B-%d"))]  ##Where Date is a column name of this DT data.table.



