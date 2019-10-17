yields = read.csv("C:\\Users\\alexy\\Desktop\\Repositories\\Lantern\\Statistics_R\\Data\\fertyield.csv")

attach(yields)
yields$treatment
treatment

head(yields)
table(treatment)
unique(treatment)
which(treatment == "nitogen")
treatment[11] = "nitrogen"
detach(yields)

rm(list=ls())

data = read.csv("C:\\Users\\alexy\\Desktop\\Repositories\\Lantern\\Statistics_R\\Data\\scatter.csv")

attach(data)
head(data)
plot(x, y, pch=23, bg="red", col="black", cex=0.5)
plot(x, y, pch=17, col="red")
plot(x, y, pch=">", col="blue")
detach(data)

rm(list=ls())

data = read.csv("C:\\Users\\alexy\\Desktop\\Repositories\\Lantern\\Statistics_R\\Data\\weather.data.csv")
attach(data)
head(data)
plot(upper) # time series
plot(month,upper) # month vs upper temp
plot(factor(month),upper) # box and whisker plot
which(month == 6 & upper == 0)
data[which(month == 6 & upper == 0),] ### Watch out for 0 as missing data irl, very common malpractice
data[4194,]$upper = NA
data[4194,]$lower = NA
data[4194,]
data[which(is.null(upper))] ## how to find NA? aint workin
detach(data)

rm(list=ls())

data = read.csv("C:\\Users\\alexy\\Desktop\\Repositories\\Lantern\\Statistics_R\\Data\\coplot.csv")
attach(data)
head(data)

# change the shape of plotting window from square 7x7 to rectangle 7x4
windows(7,4)
par(mfrow=c(1,2)) # plot parameters - 2x1 

plot(x,y)
plot(z,y)

coplot(y~z|x, pch=16, panel=panel.smooth, number=4, overlap=0) # conditional plot - y as function of z on condition of x
#1 2 3 - flat-ish correlation for lower values of x
#4 5 6 - negative-sh correlatin for higher values of x
co.intervals(x, number=4, overlap=0)

detach(data)

rm(list=ls())
data = read.csv("./Data/np.csv")
attach(data)
head(data)

window(7,4)
par(mfrow=c(1,2))
plot(nitrogen, yield, main="Nitrogen Effect on Yield")
plot(phosphorus, yield, main="Phosphorus Effect on Yield")

# interaction plot
R = tapply(yield, list(nitrogen, phosphorus), mean)
class(R)

barplot(R, beside=TRUE, xlab="phosphorus")
legend("topleft",legend=c("no","yes"),title="nitrogen",fill=c("black","lightgrey"))

# library(ggplot2)
# 
# df <- data.frame(nitrogen=factor(rbinom(100, 1, 0.45), label=c("no_N","yes_N")), 
#                phosphorus=factor(rbinom(100, 1, 0.45), label=c("no_P","yes_P")),
#                boxthis=rnorm(100))
# 
# df$nitrogenphosphorus <- interaction(df$nitrogen, df$nitrogen)
# 
# ggplot(aes(y = boxthis, x = nitrogenphosphorus), data = df) + geom_boxplot()

