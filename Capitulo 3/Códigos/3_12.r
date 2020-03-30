D = data.frame(y = 1:100,x = -(1:100))
D_2 = data.frame(y1 = 1:100,x1 = seq.int(1,200,2))
reg1_1 <- lm(y~x,data=D) 
reg1_2 <- lm(x~y,data=D)
reg2_1 <- lm(y1~x1,data=D_2)
reg2_2 <- lm(x1~y1,data=D_2)
c(coefficients(reg1_1)[2],coefficients(reg1_2)[2],coefficients(reg2_1)[2],coefficients(reg2_2)[2])
   x    y   x1   y1
-1.0 -1.0  0.5  2.0