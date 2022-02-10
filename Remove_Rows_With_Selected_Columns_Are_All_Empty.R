## https://stackoverflow.com/questions/6471689/remove-rows-in-r-matrix-where-all-data-is-na

m <- structure(c( 1,  NA,  3,  4,  5, 
                  6,  NA,  8, NA, 10, 
                 11,  NA, 13, NA, NA), 
               .Dim = c(5L, 3L))

m[rowSums(is.na(m)) != ncol(m), ]

#     [,1] [,2] [,3]
#[1,]    1    6   11
#[2,]    3    8   13
#[3,]    4   NA   NA
#[4,]    5   10   NA


df <- tibble(id = c(seq(1,10)), year=c(seq(2001,2010)), 
                           var1 = c(sample(1:100, 10, replace=TRUE)), 
                           var2 = c(sample(1:100, 10, replace=TRUE)), 
                           var3 = c(sample(1:100, 10, replace=TRUE)))

df[3,4] = NA
df[6,3:5] = NA
df[8,3:4] = NA
df[10,4:5] = NA
df[10,3:5] = NA

df <- as.data.table(df)

colsname <- c("var1", "var2", "var3")

print(df)

df <- df[rowSums(is.na(df[, colsname, with = FALSE])) != length(colsname), ]   
##if the number of NAs do not equal to the designated column lengths, then keep. If equal,
# which means they are all NA, then do not keep.

print(df)


