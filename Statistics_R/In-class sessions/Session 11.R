# LU Decomposition

A = matrix(c(1, 0.8, 0.5, 0.8, 1, 0.8, 0.5, 0.8, 1), nrow=3)

U = chol(A)
L = t(chol(A))
L %*% U

N = 10^6
u = array(0, c(3,N))
for (i in 1:3) u[i,] = rnorm(N, 0, 5)
cor(t(u), t(u))

#THIS IS HOW TO MAKE INDEPENDENT VARIABLE INTO DEPENDENT WITH CORRELATION MATRIX
corru = L %*% u
cor(t(corru), t(corru))

# u is the noise vector that acts as the brownian motion of the time series
# multiply by L to correlate different sets of u on each tenor time series
# ORRRR consider u as the time series data of each tenor