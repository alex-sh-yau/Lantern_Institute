# Functions
takemean = function(x, pr=2, verbose=T){
  n = length(x)
  r = as.double(sum(x)/n)
  StdE = sd(x)/sqrt(n)
  if (verbose) cat("Average value is", round(r,pr), "\n",
                   "Standard Error =", round(StdE,pr), "\n")
  if (!verbose) return(list(Mean=r,StdE=StdE))
}

takemean(x, verbose=F)

z = rnorm(100,50,10)
my_a = takemean(z, pr=5)


set.seed(0)
g = runif(10,-10,10)
f = rnorm(10,-10,10)

hist(g)
hist(f)


# Repeat loop and break
y = 12345
n = 20
x = array(0,n)
k = 1
x[k] = y/2
# Sqrt function
repeat{
  k = k+1
  x[k] = (x[k-1]+y/x[k-1])/2
  if ((abs(x[k]*x[k]-y)<1e-3) && (k>n-1)) break
}

plot(round(x,10))
round(x,10)

# While loop
y = 12345
x = y/2
k = 1
while(abs(x*x-y) > 1e-10) x <- (x + y/x)/2

# For loop
x = seq(0, 1, .05)
plot (x, x, ylab="y", type="l")
for (j in 2:8) points(x, x^j, col=j, type="l", lwd=2) # points adds line to current plot, plot makes new plot every time
# Another example
x = seq(-10, 10, 0.1)
y = x^2
plot(x, y, type="l", col="red", lwd=2, lty=4, xlab="x-axis", ylab="y-axis", main="Parabola", ylim=c(-100,100))
points(x, 10*x, type="l", col="blue", lwd=2)
legend("bottomright", c("Red Curve", "Blue Line"), col=c("red","blue"), lty=c(4,1), cex=(1.5))

# Plots
par(mfrow=c(2,2))
par(cex=0.6)
par(mar=c(3,3,2,2), oma=c(1,1,1,1))
for (i in 1:4){
  plot(1,1, type="n")
  mtext(letters[i], side=3, line=-1, adj=0.1, cex=0.6)
}


?fft
?plot.


# Date & Time
Sys.time()
class(Sys.time())

time.list <- as.POSIXlt(Sys.time())
class(time.list)
time.list # Assign Sys.time() to a variable, becomes timestamp

t = Sys.time()
format.Date(t,"%d/%B/%Y")

start = Sys.time()
end = Sys.time()
difftime(end, start, units="mins")


