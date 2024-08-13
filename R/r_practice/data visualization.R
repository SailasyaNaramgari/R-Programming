#DATA VISUALIZATION

#exploratory data analysis - understands the data
#explanatory data analysis - share our understanding with others

#plot() - more of a generic funciton for plotting r objects
#barplot() - plot data using rectangular boxes
#hist() - histograms
#boxplot() - represent data in the form of quartiles

#ggplot - this package enables us to create sophisticated visualizations wih 
#little coding using the grammar of graphics

#plotly - creates interactive web based graphs via the open source js graphing 
#library plotly.js


installed.packages("datasets")
plot(ChickWeight)

#base graphics
library(MASS)
plot(UScereal$sugars, UScereal$calories)

title("plot(UScereal$sugars, UScereal$calories)")

x <-UScereal$sugars
y <- UScereal$calories


#grid graphics
library(grid)

#pushViewport(plotViewport()):
#plotViewport(): This function creates a viewport that is appropriate for a typical plot. 
#It often includes margins (for labels, axis titles, etc.) around the plotting area.
#pushViewport(): This function makes the specified viewport active by pushing it onto the viewport stack.
#When a viewport is active, any drawing or plotting commands will be directed to that viewport.
#Essentially, this command sets up a viewport that is suitable for plotting, including appropriate margins.

#pushViewport(dataViewport(x,y)):
#dataViewport(x, y): This function creates a viewport that is scaled according to 
#the ranges of the data vectors x and y. This means that the viewport is set up so that 
#the data points can be plotted correctly within the plot area.
#pushViewport(): Again, this makes the dataViewport active.
#This command sets up a viewport that is appropriately scaled for the data you're
#plotting, so the plot fits correctly within the defined area.

pushViewport(plotViewport())
pushViewport(dataViewport(x,y))

grid.rect()
grid.xaxis()
grid.yaxis()
grid.points(x,y)
grid.text("UScereal$calories", x=unit(-3, "lines"), rot=90)
grid.text("UScereal$sugars", x=unit(-3, "lines"), rot=0)

#The popViewport(2) function in R's grid package is used to remove (or "pop") one 
#or more viewports from the current stack of viewports, effectively returning to the previous 
#viewport or the default device region. The number 2 specifies how many viewports to pop off the stack.

popViewport(2)

#------------------------------------------------------------------------------------------------------------


#bar chart - comparisons across discrete categories

#ggplot - data visualization package for creating graphs in R. Part of tidyverse 
#ggplot uses geoms or geometric objects to form basis of different types of graph
#geom_bar , geom_line , geom_points , geom_boxplot , 
#geom_quantile - for continuous x , 
#geom_violin - richer display of distribution
#geom_jitter - for small data

library(ggplot2)
head(mpg, n=10)
str(mpg)
install.packages("tidyverse")
library(tidyverse)

ggplot(mpg) + geom_bar(aes(x=class)) #aes - aesthetic
ggplot(mpg) + geom_bar(aes(x=class, fill= "red"))

#stacked bar chart
ggplot(mpg) + geom_bar(aes(x=class, fill= drv))

#dodged bar chart
ggplot(mpg) + geom_bar(aes(x=class, fill= factor(cyl)),
                       position=position_dodge(preserve='single'))


#-------------------------------------------------------------------------------

#pie chart for diff products and units sold

x <- c(33,45,67,99)
labels <- c("soap","detergent","oil",'shampoo') 

pie(x,labels)
pie(x,labels , main = "city in pie chart", col=rainbow(length(x)))

piepercent <- round(100*x/sum(x), 1)

pie(x,labels =piepercent , main = "city in pie chart", col=rainbow(length(x)))

legend("topright" , c("soap","shampoo","oil","grocery"), cex=0.8, fill=rainbow(length(x)))

#3D pie chart

#get the library
install.packages(("plotrix"))
library(plotrix)


x <- c(33,45,67,99)
lbl <- c("soap","detergent","oil",'shampoo')

#plot the chart 
pie3D(x,labels =lbl , explode=0.1, main = "country in pie chart")

#------------------------------------------------------------------------------------------------

v <- c(9,13,21,8,36,22,12,41,31,33,29)

#histograms
hist(v, xlab= "weight", col = "green", border = "blue")

hist(v, xlab= "weight", col = "green", border = "blue", xlim=c(0,40), ylim=c(0,5)
     ,breaks=5)

data("airquality")
View(airquality)

hist(airquality$Solar.R)

hist(airquality$Solar.R, main = 'solar radiation values', xlab="solar rad")

Temperature <- airquality$Temp
hist(Temp)

#histogram with labels
h<- hist(Temperature, ylim=c(0,40))
text(h$mids, h$counts , labels=h$counts, adj=c(0.5,-0.5))

#histogram with non uniform width
hist(Temperature, main="max daily temp at LA",xlab="temp in degrees fahrenheit",
     xlim=c(50,100),
     col="chocolate",
     breaks = c(55,60,70,75,80,100))

#------------------------------------------------------------------------------------------------

#scatterplots



#graph between ozone and wind values
plot(airquality$Ozone, airquality$Wind)
plot(airquality$Ozone, airquality$Wind , col= "orange")

plot(airquality$Ozone, airquality$Wind , type='h', col="blue") #histogram

plot(airquality)

#assign labels to the plot
plot(airquality$Ozone, xlab="ozone concentration", ylab="nnp of instances" ,
     main="ozone levels in nyc", col="purple")

#------------------------------------------------------------------------------------------------

#boxplot

boxplot(airquality$Solar.R)

#multiple boxplots
boxplot(airquality[,0:4], main="multiple box plot")

#using ggplot2 to analyse mtcars datasets---------------------------------------

library(ggplot2)
attach(mtcars)
p1 <- ggplot(mtcars, aes(factor(cyl),mpg))
p1 + geom_boxplot()

p1 + geom_boxplot() + coord_flip()

p1 + geom_boxplot(aes(fill = factor(cyl)))

#create factors with value labels - for categorical variables

mtcars$gear <- factor(mtcars$gear, levels=c(3,4,5), 
                      labels= c("3gears","4gears","5gears"))

mtcars$am <- factor(mtcars$am, levels=c(0,1), 
                      labels= c("automatic","manual"))

mtcars$cyl <- factor(mtcars$cyl, levels=c(4,6,8), 
                      labels= c("4cyl","6cyl","8cyl"))

#scatterplot

ggplot(data = mtcars, mapping = aes(x=wt, y=mpg))+geom_point()


#scatterplot by factors

ggplot(data = mtcars, mapping = aes(x=wt, y=mpg, color="red"))+geom_point()


#scatterplot by sizee

ggplot(data = mtcars, mapping = aes(x=wt, y=mpg, size = qsec))+geom_point()

ggplot(data = mtcars, mapping = aes(x=wt, y=mpg, size = qsec, color="violet"))+geom_point()


#VISUALIZTION USING mpg datasets

ggplot2 :: mpg
View(ggplot2 :: mpg)

#Bar plot
ggplot(data=ggplot2 :: mpg, aes(class))+geom_bar()

#stacked bar chart
ggplot(data=ggplot2 :: mpg, aes(class))+geom_bar(aes(fill = drv))

#using DODGE
ggplot(data=ggplot2 :: mpg, aes(class))+geom_bar(aes(fill = drv), position="dodge")

ggplot(data=ggplot2 :: mpg)+geom_point(mapping = aes(x=displ, y=hwy))
ggplot(data=ggplot2 :: mpg)+geom_point(mapping = aes(x=displ, y=hwy, color=class))



#using plotly library-----------------------------------------------------------

install.packages("plotly")
library(plotly)

p<-plot_ly(data=mtcars, x=~hp, y=~wt, marker=list(size=10,  color='rgba(255,182,193)', 
                                                  line = list(color='rgba(255,182,193)', width=2)))
p

p1<- plot_ly(data=mtcars, x=~hp, y=~wt, color=~hp , size=~hp)
p1
