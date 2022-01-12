https://stackoverflow.com/questions/30944116/r-data-table-subgroup-weighted-percent-of-group

# A
widgets[,{
    totwt = .N
    .SD[,.(frac=.N/totwt),by=style]
},by=color]
    # color  style frac
 # 1:   red  round 0.36
 # 2:   red pointy 0.32
 # 3:   red   flat 0.32
 # 4: green pointy 0.36
 # 5: green   flat 0.32
 # 6: green  round 0.32
 # 7:  blue   flat 0.36
 # 8:  blue  round 0.32
 # 9:  blue pointy 0.32
# 10: black  round 0.36
# 11: black pointy 0.32
# 12: black   flat 0.32

# B
widgets[,{
    totwt = sum(weight)
    .SD[,.(frac=sum(weight)/totwt),by=style]
},by=color]
 #    color  style      frac
 # 1:   red  round 0.3466667
 # 2:   red pointy 0.3466667
 # 3:   red   flat 0.3066667
 # 4: green pointy 0.3333333
 # 5: green   flat 0.3200000
 # 6: green  round 0.3466667
 # 7:  blue   flat 0.3866667
 # 8:  blue  round 0.2933333
 # 9:  blue pointy 0.3200000
# 10: black  round 0.3733333
# 11: black pointy 0.3333333
# 12: black   flat 0.2933333



  cba <- final[,{
    totwt = .N
    .SD[, .(percentage=100*.N/totwt),by=c("final_status")]
  },by=c( "A", "B", "C")]
  
  
  
