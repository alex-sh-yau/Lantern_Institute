# Do for homework:
# element-wise matrix multiplication
# matrix multiplication
# matrix squareroot
# other stuff

install.packages("expm")
library(matlib)
library(expm)

A_mat = matrix(c(9,1,
                 1,4), nrow=2,byrow=TRUE)
sum(inv(sqrtm(A_mat)))

sqrtm(A_mat)
A_mat%*%A_mat

# A <- c(9,4,7,2,5,8,3,6,9)
A_mat = matrix(c(9,4,7,
                 2,5,8,
                 3,6,9), nrow=3,byrow=TRUE)

A_mat%*%A_mat
det(A_mat)
inv(A_mat) #inverse
t(A_mat) #transverse
inv(t(A_mat))

diag(inv(A_mat))
sum(diag(inv(A_mat)))

tr(inv(A_mat))
 
solve(A_mat)




###### Means ########

#Harmonic
h = 1/((1 + (1/2) + (1/4) + 1)/4)

#Geometric
g = (3 * 9 * 27)^(1/3)

#Bird and Trains
t<- function(n) 50*n + 20*n


##### Monte Carlo Probability #####
balls <- c(rep("G", 5), rep("R", 4))
n <- 10000

### Pick 1 ball red
m <- structure(list(first= character(),
                    is_R = integer()),
               class = "data.frame")
for (j in 1:n){
  b <- sample(balls, 1, replace = FALSE)
  m[j, 1] <- b[c(1)]
  m[j, 2] <- ifelse((m[j,1] == "R"), 1, 0)
}

sum(m[ , 2]) / n
#################

#### 3 Balls
m <- structure(list(first= character(),
                    second = character(),
                    third = character(),
                    is_R = integer()),
                    class = "data.frame")
for (j in 1:n){
  b <- sample(balls, 31, replace = TRUE)
  m[j, 1:3] <- b[c(1,2,3)]
  # All 3 balls red
  m[j, 4] <- ifelse(m[j,1] == "R" & m[j,2] == "R" & m[j,3] == "R", 1, 0)
  
  # Only 1 of 3 balls red
  # m[j, 4] <- ifelse((m[j,1] == "R" & m[j,2] == "G" & m[j,3] == "G")
  #                   | (m[j,1] == "G" & m[j,2] == "R" & m[j,3] == "G")
  #                   | (m[j,1] == "G" & m[j,2] == "G" & m[j,3] == "R")
  #                   , 1, 0)
}

sum(m[ , 4]) / n
###########

head(m)


##### Monte Carlo Probability #####
coins <- c(rep("H", 1), rep("T", 1))
n <- 10
h <- array(0, dim=c(1, 1000))
### Pick tail
m <- structure(list(first= character(),
                    is_R = integer()),
               class = "data.frame")
for (i in 1:1000){
  for (j in 1:n){
    b <- sample(coins, 1, replace = FALSE)
    m[j, 1] <- b[c(1)]
    m[j, 2] <- ifelse((m[j,1] == "T"), 1, 0)
  }
  h[i] <- sum(m[ , 2]) / n
}
length(h[which(h>0.5)])/1000
#################

# Question 6 on midterm

f <- function(x) ((2/x) + 3)
inp = rlnorm(1000000, 2, 1)
y = f(inp)
sd(y)

# Let X be lognorm random variable with mean=2 and sd=1 - Find E[(sin(X)^2)]

f <- function (x) (sin(x))^2
inp = rnorm(1000, mean=0, var=1)
y = f(inp)
mean(y)


# GET QUANTILE FUNCTION TO GENERATE WHATEVER DISTRIBUTION U WANT
X = rnorm(10^6)
hist(X)
# same as:
p = runif(10^6)
Y = qnorm(p)
hist(Y)

# Question 7 on midterm

f <- function(x) ((2/x) + 3)
inp = runif(10000000)^(1/4)
y = f(inp)
sd(y)
