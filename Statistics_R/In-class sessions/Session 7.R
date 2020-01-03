install.packages("ISwR")
library(ISwR)

summary(IgM)
IgM

# Boxplots

par(mfrow=c(1,2))
boxplot(IgM, ylab="IgM", cex.lab=1)
boxplot(log(IgM), ylab="log(IgM)", cex.lab=1)

hist(IgM, freq=F, xlab="IgM", cex.lab=1.5)
legend(legend=c("Lognormal Distribution"), "topright", lty=c(1), lwd=c(2), col=c("red"))
usr1 = par('usr')

hist(log(IgM), freq=F, xlab="log(IgM)", cex.lab=1.5, ylim=c(0,0.9), main="Histogram of log(IgM")
legend(legend=c("Normal Distribution"), "topright", lty=c(1), lwd=c(2), col=("red"))

mu = mean(log(IgM))
sigma = sd(log(IgM))
yrange = seq(min(log(IgM)), max(log(IgM)), 0.01)
points(yrange, dnorm(yrange, mu, sigma), type="l", col="red", lwd=2)

par(mfg=c(1,1), usr=usr1)
xrange = seq(min(IgM), max(IgM), 0.01)
points(xrange, dlnorm(xrange, mu, sigma), type="l", col="red", lwd=2)


# q-q plots

par(mfrow=c(1,2))

qqnorm(IgM)
# qqnorm((IgM - mean(IgM)) / sd(IgM))  # probably not correct
qqnorm((log(IgM) - mean(log(IgM))) / sd(log(IgM)))


qrange = seq(-3, 3, 0.1)
# points(qrange, sigma*qrange+mu, type="l", col="red", lwd=2)
points(qrange, qrange, type="l", col="red", lwd=2)




