#FUNCTIONS 

#example
squares <- function(a)
  {
  for (i in 1:a){
    b <- i^2
    print(b)
  }
}

squares(5)


#----------------------------------

#Simple function , no inputs
hello_world <- function(){
  print("hello world in R")
}

hello_world()
hello_world

#funtion with single arguments
hello_name<-function(name){
  print(paste('hello ',name))
}

hello_name('lasya')

#function to add 2 numbers
add_num<-function(num1,num2){
  print(num1+num2)
}

add_num(22,10)

#add a vetor to a number
add_num(c(1,2,3,4),2)

#function with default argumnet values
hello_name<-function(name='lasya'){
  print(paste("hello",name))
}
hello_name()
hello_name('sai')
hello_name(name='jahnavi')

#return value from a function
full_name<-function(name='lasya',sname='naramgari'){
  return(paste(name,sname))
}

full_name()
full_name1<-full_name('sai','lasya')
full_name1
full_name(name='vignesh',sname='naramgari')
full_name('sai',sname='naramgari')
full_name('naramgari',sname='sai')


#-------------------------------------------------------------------------------

#BUILT-IN functions

#10 generate 1000 random values from a normal distribution of mean 0 and 1
normalDist<-rnorm(1000,0,1)
mean(normalDist)
hist(normalDist)

#to get more info about the builtin function
?hist

#to get histogram with large number of interval breaks
hist(normalDist,breaks=50)
hist(normalDist,50) #better to provide arguments

#function with optional arguments
expovalue <- function(x,power=2){
  hist(x^power)
}

expovalue(normalDist)
expovalue(normalDist,2)

#using named arguments(and passing any other arguments - (...))
expoValue<-function(x,power=2,...){
  hist(x^power,...)
}

expoValue(normalDist,power=2,breaks=20)

#passing logical arguments
expoValue <- function(x,exp=2,hist=FALSE,...){
  if (hist==TRUE){
    hist(x^exp)
    x^exp
  }else{
    x^exp
  }
}

expoValue(normalDist)
expoValue(normalDist , hist=TRUE)

#---------------------------

testnums=seq(0,50,by=2)
testnums

class(testnums)
typeof(testnums)

v<-c(1,4,2,6,7)
sort(v)
sort(v,decreasing=TRUE)

rev(testnums)

a<-append(v,testnums)
a

abs(-5) #absolute of number

sqrt(36)

sum(v)

floor(9.87)

exp(5) #exponent of a number

mean(v)









#-------------------------------------------------------------------------------

#SCOPE OF VARIABLE in functions

v<-"i am global variable"
stuff<-"i am global stuff"

func <- function(stuff){
  print(v)
  stuff<-"reassign stuff inside the fucntion"
  print(stuff)
}
print(v)
print(stuff)
func(stuff) #reassignmnet only happens in scope function
print(stuff)

#create a function to find final amount to be paid by a customer after adding 
#20% tax to the purchased amount

amount<-function(x=100){
  t = x+x*(20/100)
  return(t)
}
amount()
amount(200)

#-------------------------

amount1<-function(amt){
  if (amt>0) finalamt=amt+amt*(20/100)
  if (amt<=0) finalamt=amt
  return (finalamt)
}
amount1(10)
amount1(0)

#check the argument and the body of a function
#example to understand scope

f1<-function(x){
  y=10
  g1=function(x){
    y+(x*x)
  }
  g1(x)
}

f1(10)

#-------------------------

g2 <- function(x, y) {
  y + (x * x)
}

f2 <- function(x) {
  y = 10
  g2(x, y)
}

f2(10)


#Example 1
status<-function(marks){
  result<-"Not defined"
  if (marks>50) result="pass"
  message("you result is ",result)
}
status(30)
status(90)

#Example 2
status<-function(age)
{
  ageGrp = "Not defined"
  vote = "Not defined"
  if (age>18){
    ageGrp<- "ADULT"
    vote = 'yes'
  }
  message("your age group is ",ageGrp)
  message("VOTING STATUS is ",vote)
}

status(18)
status(20)

#example to convert a name into uppercase

status <- function(name)
{
  len<-nchar(name)
  if (len>5) name=toupper(name)
  message("user name is ",name)
}
status("lasya")
status("sailasya")

#example to calculate bonus

get_bonus<-function(salary,exp){
  if (exp>5){
    bonus_per=10
  }else{
    bonus_per=5
  }
  
  bonus=salary*(bonus_per/100)
  return (bonus)
}

get_bonus(25000,6)
get_bonus(25000,4)


#multiple condition and multiple actions

get_group<-function(age){
  if (age>0){
      if (age<18){
      ageGrp="KIDS"
      }else if (age<60){
      ageGrp="ADULTS"
      }else{
      ageGrp="SENIOR"
      }
  }
  else{
    ageGrp="not defined"
    message("wrong age")
    
  }
  message("your age group is ",ageGrp)
}

get_group(62)
get_group(17)
get_group(40)
get_group(-2)


#-----------------------------switch functions----------------------------------

#return value matched with the first argumennt
#first argument should be a character
HRA<-function(city){
  hra_amt<-switch(toupper(city),
                  BLR=7500,
                  MUM=5670,
                  CHN=3590,
                  2222)
  return(hra_amt)
}

HRA("BLR")
HRA("MUM")
HRA("tpt") #as its not defined it give value whiich is assigned
HRA("mum") #converts to uppercase


#example to return the salary band

salary_range<-function(band){
  range<-switch(band,
                l1="10k-12k",
                l2="12k-25k")
  return(range)
}

salary_range("l1")
salary_range(("b1"))


#-----------------------------repeat in R----------------------------------

time<-15
repeat{
  message("hello, welcome")
  if(time>=20) break
  time=time+1
}

#r function to find square of any user given number
#if square <100 then increment user value by 1 and square again. repeat till 
#square exceeds 100

sqr<-function(n){
  repeat{
    square=n*n
    message("the square is ",square)
    if(square>=100) break
    n=n+1
  }
  return(n)
}

sqr(5)

#--------------------------------------


#find balance in a bank a/c after n years if we deposited x amount in begininng.
#bank gives interest at rate of 8% p.a.

get_finalbal<-function(amt,year,rate){
  for (i in 1:year){
    interest=round(amt*rate/100,2)
    finalamt=amt+interest
    message("year= ",i,"amt= ",amt,"interest= ",interest,"final amt= ",finalamt)
    amt=finalamt
  }
}

get_finalbal(5000,5,8)
get_finalbal(4000,15,6)

#to find total number of year required to raise $8000 if user deposits $750 
#per month

req_years<-function(amount=550){
  f_amt=0;month=0
  while(f_amt<=8000){
    month=month+1
    f_amt=f_amt+amount
    message("Month= ",month,"final_amount= ",f_amt)
  }
  year=month/12
  return (year)
}

req_years()
req_years(750)



#-----------------------------Regular expressions-------------------------------

#grepl() - returns logical value indicating if pattern was found

text<- "R is fun"
grepl('fun',text)
grepl('python',text)

#grep() - return a vector of index locations of matching pattern instances

v<-c('a','b','c')
grep('b',v)
grep('d',v)

#-----------------------------------Factors-------------------------------------

bloodgrp<-c('o','b','a','ab','o','a')
bloodgrp

bloodgrp_factor <- factor(bloodgrp)
bloodgrp_factor
str(bloodgrp_factor)

blood_factor2 <- factor(bloodgrp,levels=c("o","a","b","ab")) 
#we can specify levels in different order
blood_factor2
str(blood_factor2)


levels(bloodgrp_factor)<-c("BT_A","BT_AB","BT_B","BT_O")
bloodgrp_factor

factor(bloodgrp, labels= c("BT_A","BT_AB","BT_B","BT_O"))
factor(bloodgrp, 
       levels=c("O","A","B","AB"), 
       labels=c("BT_O","BT_A","BT_B","BT_AB"))

bloodgrp


#two types of categorical variables - nominal and ordinal
#nominal - not necessary order 
#ordinal - ordered

#as we not allowed order we can't compare
bloodgrp_factor < blood_factor2 #error

#--------------------------

dresssize <- c("M","L","S","S","L","M","L","M")
dresssize_factor <- factor(dresssize, ordered = TRUE, levels=c("S","M","L"))
dresssize_factor

#as we allowed order we can compare
dresssize_factor[1] < dresssize_factor[2]

#---------------------------

Type <- c("s","m","l","s","l","m")

Type[3]<Type[4]
Type[1]<Type[2]
Type[3]>Type[2]


Type.factor <- factor(TRUE)

#default nominal factor
Type.factor

Type.factor2 <- factor(Type,ordered = T)
#factor created in ordinal
Type.factor2

Type.factor3 <- factor(Type,ordered = T, level=c("s","m","l"))
#ordered factor with user given order
Type.factor3

Type.factor4 <- factor(Type,ordered = T, level=c("s","m","l"), 
                       labels=c("small","large","medium"))
Type.factor4

#---------------------------

type <- c("small","tall","tallest","medium","small","tall","medium")
type

#compare height tpe of fisrt value to fourth value
type.factor5 <- factor(type, ordered = T,levels = c("small","medium","tall","tallest"))
type.factor5

type.factor5[1] > type.factor5[4]

as.integer(type.factor5)


#CREATE A SEQUENCE

v<- seq(0,20,by=2)
v

#sort a vector
v1 <- c(9,1,3,5,2,7)
sort(v1)

#reverse a vector
rev(v1)

#check the class
is.list(v)
is.vector(v)

#convert vector to list
as.list(v)

#convert vector to matrix
as.matrix(v)

#sample 2 random values between 10 and 20
sample(x=10:20,1)

sum(v)
mean(v)
round(45.3429)
round(89.3278,2) #rounds number to 2 decimal places
ceiling(23.9047) #next highest int
floor(56.8976) #next lowest int
trunc(56.782) #truncates decimal places
log(2)
exp(2)


#-------------------------------working with TIMESTAMPS-------------------------

Sys.Date()

#set as variable

today <- Sys.Date()
today

#YYYY-MM-DD
as.Date('1990-11-03')

#using format
# %b - month abbreviated
# %d - day of the month
# %y - year in 2 digits

as.Date("Nov-03-90", format="%b-%d-%y")

#using format
# %B - full month name
# %Y - year in 4 digits

as.Date("May-22-2004", format="%B-%d-%Y")
