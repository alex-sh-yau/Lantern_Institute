# Factors
pain <- c(0,3,3,2,1)
fpain = factor(pain, levels=0:3)
levels(fpain) = c("none","mild","medium","severe")
fpain
as.character(fpain)
as.numeric(fpain)

# Cardinal factors
fpain = ordered(fpain, c("medium","severe","none","mild"))  # Goes with the order listed within c()
fpain[fpain >= "medium"]


fruits = sample(c("apples","oranges","grapes"), 20, replace=T, prob=c(0.5,0.25,0.25))
class(fruits)  #"character"
fruits = ordered(fruits, c("apples","oranges","grapes"))
class(fruits)  #"ordered" "factor"
as.character(fruits[fruits > "apples"])


# Matrices
n = array(seq(6),c(2,3,3))

x <- 0:13
sum(x)
sum(x<5)
sum(x[x<5])
x[x<5]
x*(x<5)