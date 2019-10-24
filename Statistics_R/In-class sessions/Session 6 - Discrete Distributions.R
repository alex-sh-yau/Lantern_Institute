S = c('H','T') # Sample space of coin flip
sample(S, 10, replace=TRUE) # 10 Simple events

S = seq(6)
sample(S, 10, replace=TRUE) # Sample space of dice roll

x = runif(10)  
x = runif(10, 0, 5)

h = punif(2, 0, 5)
h = punif(3, 0, 5)

g = dunif(3, 0, 5)
g = dunif(2, 0, 5)

x = runif(1000, 0, 5)
hist(x)
y = seq(0, 5, 0.001)

u = hist(x, freq=F)
points(y, dunif(y, 0, 5), type="l",lwd=2, col="red")

sum(u$counts)
sum(u$density*0.5)

