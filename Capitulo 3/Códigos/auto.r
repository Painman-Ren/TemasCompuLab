library(ISLR)
Auto <- na.omit(Auto) 

AutoNum <- Auto[ -c(14),!(names(Auto) %in% c("name"))]

reg_01 <- lm(mpg~horsepower,data=Auto)
summary(reg_01)
par(mfrow = c(2, 2))
plot(reg_01)
summary(Auto$mpg)

summary(Auto$horsepower)
sd(Auto$mpg)

pred <- predict(reg_01, data.frame(horsepower = c(98)))
print(pred)
pred1 <- predict(reg_01, data.frame(horsepower = c(98)),interval='confidence')
print(pred1)
pred2 <- predict(reg_01, data.frame(horsepower = c(98)),interval='prediction')
print(pred2)

plot(Auto$mpg~Auto$horsepower)
abline(reg_01,col="green",lwd=1.5)
round(cor(AutoNum),2)
par(mfrow = c(2, 2))

reg1 <- lm(mpg ~ cylinders + displacement + horsepower + weight + acceleration + origin+year, data = AutoNum)
summary(reg1)
plot(reg1)
reg2 <- lm(mpg ~ horsepower + weight  + origin +year, data = AutoNum)
summary(reg2)
plot(reg2)
reg4 <- lm(mpg ~ horsepower + weight  +year, data = AutoNum)
summary(reg4)
plot(reg4)
reg5 <- lm(mpg ~ weight  +year, data = AutoNum)
summary(reg5)
plot(reg5)
reg3 <- lm(mpg ~ weight  + origin +year, data = AutoNum)
summary(reg3)
plot(reg3)
reg6 <- lm(mpg ~ weight  + origin +year+displacement, data = AutoNum)
summary(reg6)
plot(reg6)
reg7 <- lm(mpg ~ weight   +year, data = AutoNum)
summary(reg7)
plot(reg7)
reg8 <- lm(mpg ~ weight   *year, data = AutoNum)
summary(reg8)
plot(reg8)
reg9 <- lm(mpg ~ weight   +year+I(weight^2), data = AutoNum)
summary(reg9)
plot(reg9)
reg10 <- lm(mpg ~ weight   *year*I(weight^2), data = AutoNum)
summary(reg10)
plot(reg10)
reg11 <- lm(mpg ~ (weight   *year)+I(weight^2), data = AutoNum)
summary(reg11)
plot(reg11)

library(plotly)
library(reshape2)


h <- .1 # grid size
x1 <- seq(min(AutoNum$weight), max(AutoNum$weight), by=h)
x2 <- seq(min(AutoNum$year), max(AutoNum$year), by=h)
newdata <- expand.grid(weight = x1, year= x2, KEEP.OUT.ATTRS = F)
newdata$mpg <- predict.lm(reg11, newdata = newdata)
y <- acast(newdata, year~ weight, value.var = "mpg")
regplot <- plot_ly(x=AutoNum$weight, y=AutoNum$year, z=AutoNum$mpg, type = "scatter3d",
                   mode = "markers")
regplot <- add_trace(p = regplot, x = x1, y = x2, z = y, type = "surface")
regplot