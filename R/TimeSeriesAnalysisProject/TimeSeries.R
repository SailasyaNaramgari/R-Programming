#creating a dataframe from our dataset

mydata <- read.csv("C:\\Users\\91628\\OneDrive\\Documents\\R\\TimeSeriesAnalysisProject\\opsd_germany_daily.txt", header=TRUE, row.names="Date")
mydata
 
head(mydata)
tail(mydata)

View(mydata)

dim(mydata)

str(mydata)

#date column(will not shoe data as its index)
head(mydata$date) #shows null as its not column, but an index


#row names(indexes)
row.names(mydata) #index column

#access specific row
mydata['2006-01-01',]

#multiple col
mydata[c("2006-01-01","2006-01-04"),]

summary(mydata)



#without parsing data column
mydata2 <- read.csv("C:\\Users\\91628\\OneDrive\\Documents\\R\\TimeSeriesAnalysisProject\\opsd_germany_daily.txt", header=TRUE)
mydata2

str(mydata2$Date)

#convert into date format
x <- as.Date(mydata2$Date)
head(x)
class(x)
str(x)

#create year, month, columns
year <- as.numeric(format(x,'%Y'))
head(year)

month <- as.numeric(format(x,'%m'))
head(month)

day <- as.numeric(format(x,'%d'))
head(day)

head(mydata2)

#add columns to the existing dataframe
mydata2 <- cbind(mydata2,year,month,day)
head(mydata2)

mydata2[1:3,]

head(sample(mydata2,8))


#-------------------------------------------------------------------------------

#lets create line plot of full time series of germany's daily electricity 
#consumption, using DataFrame's plot() method.

#usint PLOT()

#option 1:

plot(mydata2$year, mydata2$Consumption, type="l", xlab ="YEAR", ylab="CONSUMPTION")

#option 2:

plot(mydata2$year, mydata2$Consumption, type="l", xlab ="YEAR", ylab="CONSUMPTION",
      lty=1, ylim=c(800,1700), xlim=c(2006,2018))


#option 3 : (better options)
#for one plot/window

par(mfrow=c(1,1))

plot(mydata2[,2])

#option 4:

plot(mydata2[,2], xlab="YEAR", ylab="CONSUMPTION")
plot(mydata2[,2], xlab="YEAR", ylab="CONSUMPTION", type="l", lwd=2, col="pink")
plot(mydata2[,2], xlab="YEAR", ylab="CONSUMPTION", type="l", lwd=2, xlim=c(0,2018))
plot(mydata2[,2], xlab="YEAR", ylab="CONSUMPTION", type="l", lwd=2,xlim=c(2006,2018))
plot(mydata2[,2], xlab="YEAR", ylab="CONSUMPTION", type="l", lwd=2,
     xlim=c(2006,2018), ylim=c(900,2000), main="CONSUMPTION GRAPH")


#taking log values of consumption and take differences of logs
plot(10*diff(log(mydata2[,2])), xlab="YEAR", ylab="CONSUMPTION", type="l", lwd=2,
     ylim=c(-5,5), main="Consumption of graph", col="red")

#using ggplot()
install.packages("ggplot2")
library(ggplot2)

#option 1:
ggplot(mydata2, type="o") + geom_line(aes(x=year, y=Consumption))

#option 2:
ggplot(data = mydata2, aes(x=year, y=Consumption, group=1)) + geom_line() + 
  geom_point()

#option 3:
ggplot(data = mydata2, aes(x=year, y=Consumption, group=1)) + geom_line(linetype="dashed") + 
  geom_point()

ggplot(data = mydata2, aes(x=year, y=Consumption, col="blue")) + geom_point()


#we can see that plot() method choose good tick locations
#(every 2 years ) and labels(the years) for the x-axis which is helpful.
#however, with so many data points, the line plot is crowded and hard to read
#Thus we can go with plot()

#Plot the data considering the solar and wind time series too

#wind column
mydata2
min(mydata2[,3], na.rm=T)
max(mydata2[,3], na.rm=T)

#Consumption column
min(mydata2[,2], na.rm=T)
max(mydata2[,2], na.rm=T)

#solar
min(mydata2[,4], na.rm=T)
max(mydata2[,4], na.rm=T)

#wind + solar
min(mydata2[,5], na.rm=T)
max(mydata2[,5], na.rm=T)

#for multiple plots
par(mfrow=c(3,1))

#or
plot1 <-plot(mydata2[,2], xlab='year', ylab='daily totals', type='l',
             lwd=2, main='consumption', col='orange',ylim=c(840,1750))

plot1 <-plot(mydata2[,1],mydata2[,2], xlab='year', ylab='daily totals', type='l',
             lwd=2, main='consumption', col='yellow',ylim=c(840,1750))


#example
#test <- mydata3$moddate(mydata3$moddate >= '2006-01-01' && mydata3$moddate <= '2006-01-03)
#test

plot2 <-plot(mydata2[,4], xlab='year', ylab='daily totals', type='l'
             , main='solar', col='blue',ylim=c(0,500))

plot2 <-plot(mydata2[,1],mydata2[,4], xlab='year', ylab='daily totals', type='l',
             main='solar', col='yellow',ylim=c(0,500))



plot3 <-plot(mydata2[,3], xlab='year', ylab='daily totals', type='l',lwd=2
             , main='wind', col='red',ylim=c(0,900))

plot3 <-plot(mydata2[,1],mydata2[,3], xlab='year', ylab='daily totals', type='l',
             lwd=2, main='solar', col='yellow',ylim=c(0,900))

 
#1 plot/window

par(mfrow=c(1,1))

#time series in single year
str(mydata2)
x <- as.Date(mydata2$Date)
head(x)
class(x)
str(x)

#data column to data format
moddate <- as.Date(x, format="%m%d%Y")

str(moddate)
mydata3 <- cbind(moddate, mydata2)
head(mydata3)
str(mydata3)

mydata4 = subset(mydata3, subset=mydata3$moddate >= '2017-01-01' & mydata3$moddate <= '2017-12-31')
head(mydata4)

plot4 <- plot(mydata4[,1],mydata4[,3],xlab='year', ylab='daily totals', type='l',
                           lwd=2, main='consumption', col='purple')

#zooming in further

mydata4 = subset(mydata3, subset=mydata3$moddate >= '2017-01-01' & mydata3$moddate <= '2017-02-28')
head(mydata4)

xmin <- min(mydata4[,1], na.rm=T)
xmin
xmax <- max(mydata4[,1], na.rm=T)
xmax

ymin <- min(mydata4[,3], na.rm=T)
ymin
ymax <- max(mydata4[,3], na.rm=T)
ymax

plot4 <- plot(mydata4[,1],mydata4[,3],xlab='year', ylab='daily totals', type='l',
              lwd=2, main='consumption', col='yellow', xlim=c(xmin,xmax), ylim=c(ymin,ymax))

grid()
#add solid horizontal lines
abline(h=c(1300,1500,1600))
#add dashed blues vertical lines at x=
abline(v=seq(xmin,xmax,7),lty=2,col='blue')

###-----------------------------------------------------------------------------

#seasonality***********

boxplot(mydata3$Consumption)
boxplot(mydata3$Solar)
boxplot(mydata3$Wind)

#boxplot is visual display of 5 num summary
quantile(mydata3$Consumption, prob=c(0,0.25,0.5,0.75,1))

boxplot(mydata3$Consumption, main='consumption',ylab="consumption",ylim=c(600,1800))

#yearly

boxplot(mydata3$Consumption ~ mydata3$year, main='consumption',
        ylab="consumption",xlab='year',ylim=c(600,1800))

boxplot(mydata3$Consumption ~ mydata3$year, main='consumption',
        ylab="consumption",xlab='year',ylim=c(600,1800), las=1)

#monthly

boxplot(mydata3$Consumption ~ mydata3$month, main='consumption',
        ylab="consumption",xlab='month',ylim=c(600,1800), las=1)

#multiple plots
par(mfrow=c(3,1))

boxplot(mydata3$Consumption ~ mydata3$month, main='consumption',
        ylab="consumption",xlab='month',ylim=c(600,1800), las=1,col='red')
boxplot(mydata3$Solar ~ mydata3$month, main='solar',
        ylab="Solar",xlab='month',ylim=c(0,200), las=1,col='blue')
boxplot(mydata3$Wind ~ mydata3$month, main='wind',
        ylab="Wind",xlab='month',ylim=c(0,900), las=1,col='orange')

#days

par(mfrow=c(1,1))

boxplot(mydata3$Consumption ~ mydata3$day, main='consumption',
        ylab="consumption",xlab='days',ylim=c(600,1800), las=1,col='green')


#Frequencies***********

mydata3
library(dplyr)
summary(mydata3)
colSums(!is.na(mydata3))
sum(is.na(mydata3$Consumption))
sum(is.na(mydata3$Wind))
sum(is.na(mydata3$Solar))

xmin <- min(mydata3[,1], na.rm=T)
xmin
Freq1 <- seq(from = xmin, by="day", length.out=5)
Freq1
typeof(Freq1)
class(Freq1)

Freq2 <- seq(from = xmin, by="month", length.out=5)
Freq2

Freq3 <- seq(from = xmin, by="year", length.out=5)
Freq3

#select data which has Na values for wind

selWind1 <- mydata3[which(is.na(mydata3$Wind)),
                    names(mydata3) %in% c("moddate","Consumption","Wind","Solar")]

selWind1[1:10,]
View(selWind1)

#select data which does not have Na values for wind
selWind2 <- mydata3[which(!is.na(mydata3$Wind)),
                    names(mydata3) %in% c("moddate","Consumption","Wind","Solar")]

selWind2[1:10,]
View(selWind2)

#from above 2 result, we know that year 2011 has wind column with some missing values
selWind3 <- mydata3[which(mydata3$year =="2011"),
                    names(mydata3) %in% c("moddate","Consumption","Wind","Solar")]

selWind3[1:10,]
View(selWind3)
class(selWind3)

#rows in resultant dataframe
nrow(selWind3)


#total number Na values per column(line 273 - 276)
#no of na values for a particular year
sum(is.na(mydata3$Wind[which(mydata3$year == "2011")]))

#no of non na values for a particular year
sum(!is.na(mydata3$Wind[which(mydata3$year == "2011")]))

str(selWind3)


selWind4 <- selWind3[which(is.na(selWind3$Wind)),
                     names(selWind3) %in% c("moddate","Consumption","Wind","Solar")]
selWind4



#we know  that data follows day wise frequency
#lets select data which has na and non na values
test1 <- selWind3[which(selWind3$modddate > "2011-12-12" & selWind3$modddate < "2011-12-16"),
                  names(selWind3) %in% c("moddate","Consumption","Wind","Solar")]
test1
class(test1)
str(test1)

library(tidyr)
test1 %>% fill(Wind)

#thus we can take care of missing values using direction

#rollingmean***********

install.packages("zoo")
library(zoo)
library(dplyr)


#trend analysis looking at rolling mean
mydata3

threeDayTest <- mydata3 %>% 
  dplyr::arrange(desc(year)) %>% 
  dplyr::group_by(year) %>% 
  dplyr::mutate(test_03da = zoo::rollmean(Consumption, k=3, fill=NA),) %>%
  dplyr::ungroup()

threeDayTest  

#first value in our test_03da variable(1367) is avg comsumotion iin 2017 from 
#first date with a datapoint on either side of it. we can check our math as
mean(c(1130,1441,1530)) #---for 3 day avg

#now lets calculate 7day and 365 day rolling mean for consumption
mydataTest <- mydata3 %>% 
  dplyr::arrange(desc(year)) %>% 
  dplyr::group_by(year) %>% 
  dplyr::mutate(test_07da = zoo::rollmean(Consumption, k=7, fill=NA),
                test_365da = zoo::rollmean(Consumption, k=365, fill=NA)) %>%
  dplyr::ungroup()

#check your result
mydataTest %>% 
  dplyr::arrange(moddate) %>% 
  dplyr::filter(year == 2017) %>% 
  dplyr::select(Consumption,moddate,year,test_07da:test_365da) %>%
  utils::head(7)

mydataTest$test_07da
mydataTest$test_365da


par(mfrow=c(1,1))

plot(mydataTest$Consumption, xlab = 'YEAR', ylab="consumption", type='l',lwd=2,
     col="orange",main='consumption graph')  
#type is type of graph , lwd is linewidth

points(mydataTest$test_07da,type='l',lwd=2,xlim=c(2000,2018), ylim=c(900,2000),
       col="yellow")

lines(mydataTest$test_365da,type='l',lwd=5,xlim=c(2000,2018), ylim=c(900,2000),
       col="blue")

legend(2000,1600,legend=c("mydataTest$Consumption","mydataTest$test_07da",
                          "mydataTest$test_180da"), col=c("orange","yellow","blue"),
       pch=c("o","*","+"), lty=c(1,2,3), ncol=1)

