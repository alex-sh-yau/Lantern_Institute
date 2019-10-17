# Do for homework:
# element-wise matrix multiplication
# matrix multiplication
# matrix squareroot
# other stuff

install.packages("matlib")
library(matlib)

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
