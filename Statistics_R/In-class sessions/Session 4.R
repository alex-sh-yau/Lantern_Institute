rm(list=ls())

worms = read.csv("C:\\Users\\alexy\\Desktop\\Repositories\\Lantern\\Statistics_R\\Data\\worms.csv")
worms
class(worms)
names(worms)
colnames(worms)
rownames(worms)
class(worms$Field.Name)
class(worms$Area)
head(worms)
tail(worms)

worms[,1:3]
worms[5:10,]
worms[5:10,-4] # subtract nth column
worms[5:10,-ncol(worms)] # subtract (length of worms)th column
n=7
worms[5:10,(-n+1):-n] # subtract 6th to 7th column
worms[5:10, "Area"]
worms[5:10, c("Area","Vegetation")]

worms$Field.Name
attach(worms) # attach names of the dataframe to the namespace
Field.Name # becomes accessible (careful with multiple dataframes)

worms[Area>3 & Slope<3,]
worms[Area>3 & Slope<3 & Damp,]
# SQL: SELECT worms WHERE Area>3 & Slope<3 & Damp


# Sorting Dataframes

sw = worms[order(Area),]
sw[5,] #SORTED

worms[order(Area, decreasing=T),]
worms[rev(order(Area)),]

summary(worms)

#calculate mean number of worms in different vegetation
with(worms, tapply(X=Worm.density,FUN=mean,INDEX=Vegetation))

#apply logical vector to each component of worms
#faster than using for-loop through each column and doing is.numeric
nums = sapply(worms, is.numeric)

nums
worms[,nums]
worms[nums,]
aggregate(worms[,nums],list(Vegetation),mean)
aggregate(worms[,nums],list(Vegetation=Vegetation),mean)
aggregate(worms[,nums],list(Vegetation=Vegetation),sd)
worms[Vegetation == "Orchard", ] #Orchard only has 1 entry therefore it doesn't have standard deviation

#Please find average density of worms for grasslands and meadows, 
#whose Area is greater than 2.5 and Soil.pH  is greater than 3.5.
#Round the answer to one digit after the decimal point.

filtered <- worms[Area>2.5 & Soil.pH>3.5 & (Vegetation=="Grassland" | Vegetation=="Meadow"),]
with(filtered, tapply(X=Worm.density,FUN=mean, INDEX=Vegetation))
sapply(filtered[,nums], mean)
filtered

aggregate(filtered[,nums],list(Vegetation),mean)
