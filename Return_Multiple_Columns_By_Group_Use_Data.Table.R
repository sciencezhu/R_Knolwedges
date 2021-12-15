###   return multiple columns from data.table aggregation

####  https://stackoverflow.com/questions/17174653/return-multiple-columns-from-data-table-aggregation

5

#Try coercing to a list:

x[, as.list(quantile(value)), by=g]
   g         0%          25%         50%       75%     100%
1: a -1.7507334 -0.632331909  0.07435249 0.7459778 1.428552
2: b -2.2043481 -0.005652353  0.10534325 0.5769475 1.241754
3: c -1.9313985 -1.120737610 -0.26116926 0.6953009 1.360017
4: d -0.7434664 -0.055232431  0.22062823 1.1864389 3.021124
5: e -2.0101657 -0.468674094  0.20209610 0.6286448 2.433152
