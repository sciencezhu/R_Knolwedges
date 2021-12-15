### How to get summary data from the r lm() function
##  https://stackoverflow.com/questions/53933238/tabulate-coefficients-from-lm


#Using library(data.table) you can do

d <- fread("example.csv")
d[, .(
  r2         = (fit <- summary(lm(Qend~Rainfall, data=.SD)))$r.squared,
  adj.r2     = fit$adj.r.squared,
  intercept  = fit$coefficients[1,1], 
  gradient   = fit$coefficients[2,1],
  p.value    = {p <- fit$fstatistic; pf(p[1], p[2], p[3], lower.tail=FALSE)}),
  by  = CatChro]

#    CatChro         r2       adj.r2   intercept     gradient      p.value
# 1:    A3G1 0.03627553  0.011564648 0.024432020 0.0001147645 0.2329519751
# 2:    A3D1 0.28069553  0.254054622 0.011876543 0.0004085644 0.0031181110
# 3:    A3G2 0.06449971  0.041112205 0.026079409 0.0004583538 0.1045970987
# 4:    A3D2 0.03384173  0.005425311 0.023601325 0.0005431693 0.2828170556
# 5:    A3G3 0.07587433  0.054383038 0.043537869 0.0006964512 0.0670399684
# 6:    A3D3 0.04285322  0.002972105 0.022106960 0.0001451185 0.3102578215
# 7:    A3G4 0.17337420  0.155404076 0.023706652 0.0006442175 0.0032431299
# 8:    A3D4 0.37219027  0.349768492 0.009301843 0.0006614213 0.0003442445
# 9:    A3G5 0.17227383  0.150491566 0.025994831 0.0006658466 0.0077413595
#10:    A3D5 0.04411669 -0.008987936 0.014341399 0.0001084626 0.3741011769
