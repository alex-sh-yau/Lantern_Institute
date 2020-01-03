library(purrr)

# P(N(1,1) for -3<x<2)

a <- pnorm(-3, mean = 1, sd = 1, lower.tail = TRUE)
b <- pnorm(2, mean = 1, sd = 1, lower.tail = TRUE)
b - a




# Let X be standard normal random variable - Find E[(sin(X)^2)]

f <- function (x) (sin(x))^2
inp = rnorm(1000, mean=0, var=1)
y = f(inp)
mean(y)


# Let X be random variable of result of dice throw - calculate exp(X)

f <- function (x) exp(x)
inp = rdunif(10000, 6, 1)
y = f(inp)
mean(y)
