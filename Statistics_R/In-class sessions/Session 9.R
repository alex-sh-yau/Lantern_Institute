intake = c(5260, 5470, 5640, 6180, 6390, 6515, 6758, 6805, 7515, 8230, 8770)
# intake = c(7700, 7700, 7700, 7700, 7700, 7700, 7700, 7700, 7700, 7700, 7700, 7711)

quantile(intake, probs = c(.9,.95,.99), na.rm = FALSE,
         names = TRUE, type = 7)

mean(intake)

sd(intake)

t.test(intake, mu=6684.818)
t.test(intake, mu=7700, conf.level = 0.99)

alpha = 0.05
n = seq(30)
plot(n, qt(1-alpha/2, df=n), type='l', ylim=c(0,10), lwd=2, cex.lab=1.5, cex.axis=1.5, 
     xlab="degrees of freedom (n)", ylab="Student's t-values")
qt(.975, df=30)

abline(h=qnorm(1-alpha/2), lwd=2, lty=2, col="red")

legend("topright", c("t(0.975, n)", "z(0.975)"), lwd=c(2,2), lty=c(1,2), col=c("black", "red"))

#nonparametric test

mu0 = 7700

wilcox.test(intake, mu=mu0)
V = sum(rank(abs(intake-mu0)) [sign(intake-mu0) > 0])
cat("V = ", V, "\n", sep="")
