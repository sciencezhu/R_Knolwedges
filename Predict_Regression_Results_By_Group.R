#####

  f <- as.formula(paste(YY , " ~ ", XX ))
  
  fit_cols <- paste0(YY, "_" ,c("fit", "lwr", "upr"))
  Prediction_Level <- 0.997
  ByList <- c("Group")
  
  setkeyv(final_select, ByList)
  
  final_select[, (fit_cols):= data.table(predict(lm(f, data = .SD), .SD, interval = "prediction", level = Prediction_Level)), by=ByList]
