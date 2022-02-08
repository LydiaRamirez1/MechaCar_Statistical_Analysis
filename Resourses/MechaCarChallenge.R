>library(dplyr)
> 
> #reading in the dataframe
> mecha_cars <- read.csv("MechaCar_mpg.csv")
> #performing the linear regression on the dataframe
> lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mecha_cars)
  
  Call:
    lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
         ground_clearance + AWD, data = mecha_cars)
  
  Coefficients:
    (Intercept)    vehicle_length    vehicle_weight     spoiler_angle  
  -1.040e+02         6.267e+00         1.245e-03         6.877e-02  
  ground_clearance               AWD  
  3.546e+00        -3.411e+00  
  
  > summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mecha_cars))
  
  Call:
    lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
         ground_clearance + AWD, data = mecha_cars)
  
  Residuals:
    Min       1Q   Median       3Q      Max 
  -19.4701  -4.4994  -0.0692   5.4433  18.5849 
  
  Coefficients:
    Estimate Std. Error t value Pr(>|t|)    
  (Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
    vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
    vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
  spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
  ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
    AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
  ---
    Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
  
  Residual standard error: 8.774 on 44 degrees of freedom
  Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
  F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11
  
> 
> coil <- read.csv("Suspension_Coil.csv")
> total_summary <- summarize(coil, Mean = mean(coil$PSI), Median = median(coil$PSI), Variance = var(coil$PSI), SD = sd(coil$PSI))
> lot_summary <- group_by(coil, Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
> t.test(coil$PSI, mu = mean(coil$PSI))
  
  One Sample t-test
  
  data:  coil$PSI
  t = 0, df = 149, p-value = 1
  alternative hypothesis: true mean is not equal to 1498.78
  95 percent confidence interval:
    1497.507 1500.053
  sample estimates:
    mean of x 
  1498.78 
  
> 
> lot1 <- subset(coil, Manufacturing_Lot == "Lot1")
> lot2 <- subset(coil, Manufacturing_Lot == "Lot2")
> lot3 <- subset(coil, Manufacturing_Lot == "Lot3")
> t.test(lot1$PSI, mu = mean(coil$PSI))
  
  One Sample t-test
  
  data:  lot1$PSI
  t = 8.7161, df = 49, p-value = 1.568e-11
  alternative hypothesis: true mean is not equal to 1498.78
  95 percent confidence interval:
    1499.719 1500.281
  sample estimates:
    mean of x 
  1500 
  
> t.test(lot2$PSI, mu = mean(coil$PSI))
  
  One Sample t-test
  
  data:  lot2$PSI
  t = 3.6739, df = 49, p-value = 0.0005911
  alternative hypothesis: true mean is not equal to 1498.78
  95 percent confidence interval:
    1499.423 1500.977
  sample estimates:
    mean of x 
  1500.2 
  
> t.test(lot3$PSI, mu = mean(coil$PSI))
  
  One Sample t-test
  
  data:  lot3$PSI
  t = -1.4305, df = 49, p-value = 0.1589
  alternative hypothesis: true mean is not equal to 1498.78
  95 percent confidence interval:
    1492.431 1499.849
  sample estimates:
    mean of x 
  1496.14 
  
> 