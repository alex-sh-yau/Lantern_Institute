methods("plot")

getS3method("plot","histogram")

# install.packages("fitdistrplus")

library(fitdistrplus)

data("groundbeef", package = "fitdistrplus")
str(groundbeef)
serv = groundbeef$serving

mu = mean(serv)
SE = sd(serv)/sqrt(length(serv))


#histogram and CDF plot
plotdist(serv, histo=TRUE, demp=TRUE)

# Cullen and Frey Graph (Kurtosis vs Square of Skewness)
descdist(serv, boot = 1000)

fw = fitdist(serv, "weibull")
summary(fw)

fg = fitdist(serv, "gamma")
fln = fitdist(serv, "lnorm")

par(mfrow = c(2, 2))
plot.legend <- c("Weibull", "lognormal", "gamma")
denscomp(list(fw, fln, fg), legendtext = plot.legend)
qqcomp(list(fw, fln, fg), legendtext = plot.legend)
cdfcomp(list(fw, fln, fg), legendtext = plot.legend)
ppcomp(list(fw, fln, fg), legendtext = plot.legend)




# BOOTSTRAPPING FOR MEASURING UNCERTAINTY
# TAKE MEAN FROM SAMPLE OF X POINTS (search optimal sample size) OF DISTRIBUTION YOU ARE LOOKING AT, N TIMES
# (bigger N gives smoother distribution)

N = 1000
M = array(0, N)
for (i in 1:N) {X = sample(serv, 250, replace=TRUE); M[i]=mean(X)}
summary(M)
sd(M)
SE
mean(M)
mu

x = seq(65, 85, 0.1)
hist(M, freq=F)
points(x, dnorm(x, mean(serv), SE), type="l", col="red", lwd=2)

quantile(M, 0.5)
# 90% confidence interval
quantile(M, 0.05)
quantile(M, 0.95)

qnorm(0.05, mean(serv), SE)
qnorm(0.95, mean(serv), SE)
#########################################################################################################



data("endosulfan", package = "fitdistrplus")
ATV <- endosulfan$ATV

plotdist(log(ATV), histo=TRUE, demp=TRUE)

fendo.ln <- fitdist(ATV, "lnorm")

install.packages("actuar")
library(actuar)
fendo.ll <- fitdist(ATV, "llogis", start = list(shape = 1, scale = 500))
fendo.P <- fitdist(ATV, "pareto", start = list(shape = 1, scale = 500))
fendo.B <- fitdist(ATV, "burr", start = list(shape1 = 0.3, shape2 = 1, rate = 1))

cdfcomp(list(fendo.ln, fendo.ll, fendo.P, fendo.B), lwd=2, xlogscale = TRUE,
        ylogscale = TRUE, legendtext = c("lognormal", "loglogistic", "Pareto", "Burr"))

quantile(fendo.B, probs = 0.05)

quantile(ATV, probs = 0.05)

gofstat(list(fendo.ln, fendo.ll, fendo.P, fendo.B),
        fitnames = c("lnorm", "llogis", "Pareto", "Burr"))




sample = read.csv("C:\\Users\\alexy\\Desktop\\Repositories\\Lantern\\Statistics_R\\Data\\sample.csv")
attach(sample)
plotdist(x)


fendo.l <- fitdist(x, "norm")
fendo.ln <- fitdist(x, "lnorm")
fendo.logis <- fitdist(x, "logis")
fendo.wei <- fitdist(x, "weibull")
cdfcomp(list(fendo.l, fendo.ln, fendo.logis, fendo.wei), lwd=2, xlogscale = TRUE,
        ylogscale = TRUE, legendtext = c("norm", "lognorm", "logistic", "weibull"))

gofstat(list(fendo.l, fendo.ln, fendo.logis, fendo.wei),
        fitnames = c("norm", "lognorm", "logistic", "weibull"))

windows (15, 10)
par(mfrow = c(2, 2))
plot.legend <- c("norm", "lognorm", "logistic", "weibull")
denscomp(list(fendo.l, fendo.ln, fendo.logis, fendo.wei), legendtext = plot.legend)
qqcomp(list(fendo.l, fendo.ln, fendo.logis, fendo.wei), legendtext = plot.legend)
cdfcomp(list(fendo.l, fendo.ln, fendo.logis, fendo.wei), legendtext = plot.legend)
ppcomp(list(fendo.l, fendo.ln, fendo.logis, fendo.wei), legendtext = plot.legend)
