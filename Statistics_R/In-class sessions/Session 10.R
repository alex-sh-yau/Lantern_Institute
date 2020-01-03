rm(list=ls())

install.packages("mvtnorm")
install.packages("mixtools")

library(mvtnorm)
library(mixtools)

# Function to draw ellipse for bivariate normal data
ellipse_bvn = function(bvn, alpha){
  xbar = apply(bvn,2,mean)
  S = cov(bvn)
  ellipse(xbar, S, alpha = alpha, col="green", lwd=2)
}

N = 1000
set.seed(123)

# Target parameters for univariate normal distributions
mu1 = 0; s1 = 1
mu2 = 0; s2 = sqrt(2)
rho = 0.1 # play with this value - from -1 to +1 
#rho here is the pearson correlation estimate - cov(x,y)/[s(x)*s(y)]

mu = c(mu1, mu2)
sigma = matrix(c(s1^2, s1*s2*rho, s1*s2*rho, s2^2), 2)

bvn = mvtnorm::rmvnorm(N, mu, sigma, method="svd") #singular value decomposition - bivariate normal
colnames(bvn) = c("bvn_X", "bvn_Y")

plot(bvn, xlim=c(-4,4), ylim=c(-4,4),
     xlab="X",ylab="Y",main="Bi-Variate Normal Density")
bvn
ellipse_bvn(bvn, .5)
ellipse_bvn(bvn, .05)
ellipse_bvn(bvn, .01)


library(ISwR)
attach(thuesen)

# Pearson correlation estimate
plot(blood.glucose, short.velocity, pch=16, cex.axis=1.2, cex.lab=1.5)
cor(blood.glucose, short.velocity)
print(thuesen)
cor(blood.glucose, short.velocity, use="complete.obs")
cor(thuesen, use="complete.obs")
cor.test(blood.glucose, short.velocity)


# Spearman correlation estimate
x = runif(10,1,5)
rank(x)
# rho = cov(rank(x),rank(y))/[s(x)*s(y)]

cor.test(blood.glucose, short.velocity, method="spearman")
cor(rank(blood.glucose[-16]), rank(short.velocity[-16]))

# Kendall's correlation estimate
cor.test(blood.glucose, short.velocity, method="kendall")



detach(thuesen)
# Scale-Dependent Correlations
data = read.csv("C:\\Users\\alexy\\Desktop\\Repositories\\Lantern\\Statistics_R\\Data\\productivity.csv")
attach(data)
names(data)

plot(productivity, mammals, pch=16, col="blue", cex.axis=1.2, cex.lab=1.5)
cor.test(productivity, mammals, method="spearman")
plot(productivity, mammals, pch=16, col=as.numeric(region), cex.axis=1.2, cex.lab=1.5)

