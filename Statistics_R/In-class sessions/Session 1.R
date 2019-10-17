# TO INSTALL PACKAGES:
# install.packages("PACKAGE")

x = seq(-1, 1, 0.1)
y = x^2
plot(x,y, type = "l", lwd=2, col="red", xlab="x-axis", ylab="y-axis", main="quadratic function")


rm(list=ls())


g=sum((z<-1),2)
x = seq(from=-10,to=10,by=2.5)

10/2
1.5%/%2
?'%/%'   # Integer division
round(11/2)
ceiling(11/2)
floor(11/2)

A = array(0,10)
a = array(0,c(10,2)) # c(row,column)

h = c(1,23,4,6,2)
ch = as.character(h) # each element a character
cy = toString(h) # whole thing a string
cn = as.numeric(ch)

# Lists 
carray = c(1,2,5,3,6,"1")
clist = list(1, 2, "3")

hh <- list("a" = 2.5, "b" = TRUE, "c" = 1:3)
hh[c(1:2)]
hh[-2]
hh[[3]][2]
clist[-2]
L = list(number=h,character=ch)

L$number
L$character[2]
L[[1]][1] = "ta" # 1 char changed entire list to char



