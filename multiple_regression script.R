library(tidyverse)
my.data <- read.csv("regLectureData.csv")
glimpse(my.data)
library(apaTables)
apa.cor.table(my.data)
psych::pairs.panels(as.data.frame(my.data))
my.regression <- lm(VidScore ~ iq + age, data = my.data)
my.regression
summary(my.regression)
apa.reg.table(my.regression)
x_axis_range<- data_frame(age=c(43),iq=c(130))
x_axis_range
CI_data<- predict(my.regression, newdata = x_axis_range, interval = "confidence", level = 0.95)
CI_data <- as.data.frame(cbind(x_axis_range, CI_data))
PI_data<- predict(my.regression, newdata = x_axis_range, interval = "prediction", level = 0.95)
PI_data <- as.data.frame(cbind(x_axis_range, PI_data))
CI_data
PI_data

