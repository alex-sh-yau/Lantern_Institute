S = c('H','T') # Sample space of coin flip
sample(S, 10, replace=TRUE) # 10 Simple events

S = seq(6)
sample(S, 10, replace=TRUE) # Sample space of dice roll

# random uniform distribution, 10 draws
x = runif(10)  
x = runif(10, 0, 5)

# distribution function - cumulative probability from -inf to the value in the sample space - 0.4 at 2, 0.6 at 3
# integral of entire space is equal to 1
h = punif(2, 0, 5)
h = punif(3, 0, 5)

# density function - probability between definite values in sample space
# for discrete uniform distribution, probability AT the value - 0.2 at 2, 0.2 at 3
# integral of entire space is equal to 1
g = dunif(3, 0, 5)
g = dunif(2, 0, 5)

x = runif(1000, 0, 5)
hist(x)
y = seq(0, 5, 0.001)

u = hist(x, freq=F)
points(y, dunif(y, 0, 5), type="l",lwd=2, col="red")

sum(u$counts)
sum(u$density*0.5)


windows(10,5)

x = rbinom(1000, size=31, prob=0.447)
hist(x, freq=F)
hist(x, probability=T)
lines(density(x),col="red")
plot(ecdf(x))


