#### I could not download the hadoop VM, and sent you email regarding my issues.

## 1a
# assign a url to variable "url"
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00225/Indian%20Liver%20Patient%20Dataset%20(ILPD).csv"
# Download a rectangular dataset
# vector types are used to keep the gender cols from automatically being of type logical, which are cumbersome to convert
vecClass<-c('numeric', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
ILPD<-read.csv(url, header=TRUE, colClasses=vecClass);
## 1b -d
# Assign headers to columns
headers <- c("Age", "Gender", "T.B.", "D.B.", "AAP", "Sgpt", "Sgot", "TP", "ALB", "AG", "Sel")
names(ILPD) <-headers

## 2a
# Peak at a bit of the data
head(ILPD);

## DATA CLEANING - Not explicitly instructed, but I felt it was within the spirit of the assignment
# Male/Female is non numeric, convert to isFemale
GenderCol <- ILPD[,2]
GenderCol[GenderCol == "Female"] <- 1
GenderCol[GenderCol == "Male"] <- 0
ILPD[,2]<-as.integer(GenderCol) # R will try to convert back to character unless you force it
ILPD[,2]
# The 'AG' column contains N/A values, we remove the small number of rows with such features.
ILPD.complete <- ILPD[complete.cases(ILPD),]
ILPD.complete2 <- na.omit(ILPD)
nrow(ILPD.complete)
nrow(ILPD.complete2)

##2b - for both raw and cleaned data
summary(ILPD)
sapply(ILPD, mean)
sapply(ILPD.complete, mean)

sapply(ILPD, sd)
sapply(ILPD.complete, sd)

sapply(ILPD, median)
sapply(ILPD.complete, median)

##2c - this allows us to compute SD on the 'AG' column without explicitly cleaning data
sd(ILPD[,10]) # NA
sd(ILPD[,10],na.rm=TRUE) #Result

##2d
hist(ILPD[,1], xlab="Age", main="Patient Age")
hist(ILPD[,2], xlab="Encoded Gender (0=Male, 1=Female)", main="Patient Gender")
boxplot(ILPD[,3])
#I'd love to know a better way of showing similar info in R, please advise
logPlot <- function(x=c(1,2,3), xLab="x", mLab="main", yLab="y")
{
   lHist<-hist(x, plot=F);
   plot(lHist$mids,lHist$counts/nrow(x), xlab=xLab, ylab=yLab, main=mLab, ylog=T)
}

hist(ILPD[,3], xlab="Bilirubin", main="ILPD Total Bilirubin")
logPlot(ILPD[,3],'Bilirubin',"ILPD Total Bilirubin","Log(Count)")

hist(ILPD[,4], xlab="Direct Bilirubin", main="Direct Bilirubin")
logPlot(ILPD[,4],"Direct Bilirubin","Direct Bilirubin","Log(Count)")

hist(ILPD[,5], xlab="Alkphos Alkaline Phosphotase", main="Alkphos Alkaline Phosphotase")
logPlot(ILPD[,5],"Alkphos Alkaline Phosphotase","Alkphos Alkaline Phosphotase","Log(Count)")

hist(ILPD[,6], xlab="Sgpt Alamine Aminotransferase", main="Sgpt Alamine Aminotransferase")
logPlot(ILPD[,6],"Sgpt Alamine Aminotransferase","Sgpt Alamine Aminotransferase","Log(Count)")

hist(ILPD[,7], xlab="Sgot Aspartate Aminotransferase", main="Sgot Aspartate Aminotransferase")
logPlot(ILPD[,7],"Sgot Aspartate Aminotransferase","Sgot Aspartate Aminotransferase","Log(Count)")

hist(ILPD[,8], xlab='Total Protiens', main="Total Protiens")
hist(ILPD[,9], xlab='Albumin', main="Albumin")
hist(ILPD[,10], xlab='Albumin and Globulin Ratio', main="Albumin and Globulin Ratio")
hist(ILPD[,11], xlab='Selector field', main="Selector field") #Probably not relevant

##2e
plot(ILPD)
keeps<-c("T.B.", "D.B.", "AAP", "Sgpt", "Sgot", "TP", "ALB", "AG")
subILPD<-ILPD[keeps]
plot(subILPD)

cor(ILPD$T.B., ILPD$D.B.)
####
# a.) Things we can tell from the plot & histograms:
#       * The Bilirubin (2x), AAP, and SAA (2x) distributions are strongly leftward skewed, and
#         would benefit from smart scaling
#       * The sample is primarily male, and has a large spread in age with a peak in middle age
# b.) The ILPD plot makes this very apparent, where if you look at the column for a given 
#       parameter you'll see the data put in columns (i.e. Gender, & Selector variable)
# c.) Visually, yoiu can see correlation if there appears to be a line between two columns.
#       * Trivial correlation are things like T.B. & D.B. which are 2 measures fo the same quantity
#       * More interesting correlations are between Total protien and Albumin

#### 3
##3a
x<-c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)
xHigh <- median(x) + 2 * sd(x)
xLow  <- median(x) - 2 * sd(x)
x<-x[x<xHigh & x>xLow]
x

##3b
degree<-c('BS', 'MS', 'PhD', 'HS', 'Bachelors', 'Masters', 'High School', 'BS', 'MS', 'MS')
degree[degree=='Bachelors']<-'BS'
degree[degree=='Masters']<-'MS'
degree[degree=='High School']<-'HS'
degree

##3c
#a
norm<-c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)
minN<- min(norm)
ranN<- max(norm)-minN
norm<- (norm - minN)/ranN
norm
#b
norm<-c(-1, 1, 5, 1, 1, 17, -3, 1, 1, 3)
aveN<-mean(norm)
sdN<-sd(norm)
norm<-(norm-aveN)/sdN
norm
##3d
colors<-c('Red', 'Green', 'Blue', 'Blue', 'Blue', 'Blue', 'Blue', 'Red', 'Green', 'Blue')
isRed<-colors=='Red'
isGreen<-colors=='Green'
isBlue<-colors=='Blue'
binaryColor<-list(as.numeric(isRed),as.numeric(isGreen),as.numeric(isBlue))
vecHead<-c("Red","Blue","Green")
names(binaryColor) <-vecHead
binaryColor
##3e
#a
beforeDiscrete<-c(3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 9, 12, 23, 23, 25, 81)
binWidth <- (max(beforeDiscrete)-min(beforeDiscrete))/ 3
binEdges <- seq(from=min(beforeDiscrete), to=max(beforeDiscrete), by=(max(beforeDiscrete) - min(beforeDiscrete))/3)
discrete<-rep(NA, length(beforeDiscrete))
discrete[beforeDiscrete >= binEdges[1] & beforeDiscrete <= binEdges[2]] <- "Low"
discrete[beforeDiscrete > binEdges[2] & beforeDiscrete <= binEdges[3]] <- "Medium"
discrete[beforeDiscrete > binEdges[3] & beforeDiscrete <= binEdges[4]] <- "High"
discrete
#b
beforeDiscrete<-c(3, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 9, 12, 23, 23, 25, 81)
binEdges<-c(3,5,7,81)
discrete<-rep(NA, length(beforeDiscrete))
discrete[beforeDiscrete >= binEdges[1] & beforeDiscrete <= binEdges[2]] <- "Low"
discrete[beforeDiscrete > binEdges[2] & beforeDiscrete <= binEdges[3]] <- "Medium"
discrete[beforeDiscrete > binEdges[3] & beforeDiscrete <= binEdges[4]] <- "High"
discrete