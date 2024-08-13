#DATA MANIPULATION


#dplyr package is used to transform and summarize tabular data with rows and columns

#select() - selects a column variables based on their names
#filter() - filters row based on their values
#arrange() - changes the ordering of the rows
#summary() - reduce multiple values down to a single summary
#mutate() - craetes a column that are function of existing variables

install.packages("dplyr")
library(dplyr)

install.packages("nycflights13") #in built dataset
library("nycflights13")

View(flights)
head(flights)

#subset dataset using filter()

f1<- filter(flights,month==07)
View(f1)

f2<- filter(flights,month==07,day==03)
f2
View(f2)

View(filter(flights,month==07,day==02,origin=="LGA"))

#Another method------------------

head(flights[flights$month==09 & flights$day==2 & flights$origin=='LGA',])

#slice() allows us to select rows by position

slice(flights,1:5)
slice(flights,15:25)

#mutate() - to add new column ************

over_delay <- mutate(flights,overall_delay=arr_delay - dep_delay)
View(over_delay) # extra column added
head(over_delay)

#transmute() - show only new column

over_delay1 <- transmute(flights,overall_delay=arr_delay - dep_delay)
over_delay1

#summarize()

summarize(flights, avg_air_time=mean(air_time,na.rm=T))
summarize(flights, sum_air_time=sum(air_time,na.rm=T))
summarize(flights, stdev_air_time=sd(air_time,na.rm=T))
summarize(flights, avg_air_time=mean(air_time,na.rm=T), 
          sum_air_time=sum(air_time,na.rm=T))


#group_by()

#example
View(mtcars)
head(mtcars)
by_gear <- mtcars %>% group_by(gear)
#%>% from dplyr package (piping)- ctrl+shift+m
by_gear
View(by_gear)


a <- summarize(by_gear, gear1=sum(gear), gear2=mean(gear))
a

summarize(group_by(mtcars,cyl), mean(gear, na.rm=T))

b <- by_gear %>% summarize (gear1=sum(gear), gear2=mean(gear))
b

#example2

by_cyl <- mtcars %>% group_by(cyl)
by_cyl %>% summarize(gear=mean(gear), hp=mean(hp))

head(by_cyl)

#sample_n() and sample_frac for creating samples -------------------------------

sample_n(flights,15) #15 random samples
sample_frac(flights,0.4) #40% of the total data

#arrange() to sort dataset
View(arrange(flights,year,dep_time))
head(arrange(flights,year,dep_time))

#use of pipe operator

df <- mtcars
df
View(mtcars)

#nesting 

results<- arrange(sample_n(filter(df,mpg>20),size=5), desc(mpg)) #by default asc
View(results)
results

#multiple assignment

a<- filter(df,mpg>20)
b <- sample(a,size=5)
result<-arrange(b,desc(mpg))

#same using pipe operator

#syntax - data %> op1 %>% op2 %>% op3

result <- df  %>% filter(mpg>20) %>% sample_n(size=10) %>% arrange(desc(mpg))
result

df
df_mpg_hp_cyl = df %>% select(mpg,hp,cyl)
head(df_mpg_hp_cyl)

#filter can be used but it always look for conditions



#------------------------DATA MANIPULATION using TIDYR--------------------------

#tidyr helps to create tidy data. Easy to visualize and model
#gather() - makes wide data longer
#spread() - makes long data wider
#seperate() - single to multiple column
#unite() - combines multiple columns to single

install.packages('tidyr')
library('tidyr')

n = 10

wide <- data.frame(
  ID = c(1:n),
  face.1 = c(411,723,986,234,103,1311,2713,2186,1817,1383),
  face.2 = c(311,713,186,817,183,3011,1893,1986,8127,1183),
  face.3 = c(211,983,726,807,923,3201,1013,1806,8017,1823)
  
)

View(wide)


#gather() - reshaping data from wide format to long format

long <- wide %>% gather(Face, ResponseTime, face.1:face.3)
View(long)

#seperate() 

long_separate <- long %>% separate(Face, c("Target","number"))
View(long_separate)

#unite

long_unite <- long_separate %>%  unite(Face,Target,number,sep="-")
View(long_unite)

#spread() - takes 2 columns (key&value) and spreads in to multiple columns
#it makes long data wider

back_to_wide <- long_unite %>% spread(Face, ResponseTime)
View(back_to_wide)
