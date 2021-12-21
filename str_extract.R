###  https://www.regular-expressions.info/lookaround.html


## https://stackoverflow.com/questions/48916145/filtering-using-multiple-regex-pattern-specifications-in-r

## You can use | to check multiple patterns. However, this will return the first match. E.g. 
str_extract('abcdef','abc|def')


## extract multiple patterns from string
## https://stackoverflow.com/questions/60094971/extract-multiple-patterns-from-string
library(stringr)

paste(str_extract_all(a, 'amount_min|amount_max', simplify = TRUE), 
      as.numeric(str_extract_all(a, '[0-9]\\.[0-9]e[0-9]', simplify = TRUE)), 
      sep = ':', collapse = ', ')
