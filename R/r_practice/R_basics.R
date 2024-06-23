#VARIABLES

model1 <- 'hello'
typeof(model1)
model1
hello_string <- 'hi'
hello_string
2pairs <- 100 #not start with numbers
.2pairs <- 100 #point should not follow by number
.pairs <- 100 #point can follow with letters
.pairs
first num <- 22 #error
first_num <- 22
first_num

#DATATYPES

x <-100
typeof(x)

y <- 100L
typeof(y)
class(y)

a = TRUE
typeof(a)

b = "hello"
typeof(b)
class(b)
length(b)

e <- 5.5
typeof(e)

c <- 1+2i
typeof(c)
class(c)

#OPERATORS

#Arithmetic operators :

100 + 22
100 - 22
100 * 22
100/22
100%%22 #remainder
34+42/2
(34+42)/2  #order of operations
5^2


x <- 100
y <- 200
x == y
x != y
!= y
y > x
y >= x
x < y
x <= y

#READING FILES

files <- read.csv("C:\\Users\\91628\\OneDrive\\Documents\\R\\r_practice\\data.csv")
files
head(files)
View(files)
var <- files[files$Responder_id == 1 & files$Age == 14, ] #add comma at the end
var
var1 <- files[files$Responder_id == 2 | files$Age == 18, ]
var1


#PRINT FORMATTING

#R uses print() to display variables
x <- 22
print(x)

#R uses paste() and paste0() functions to format strings and variables together for printing in few different ways

print(paste('hello','R'))
print(paste('hello','R' , sep=","))
paste0('hello','me')

#Returns a character vector containing a formatted combination
#%s - string ; %f - float
sprintf("%s is %f tall" , "LASYA" , 5.5)


#operator to create integer sequence

x <- 10:30
x
class(x)



#R OBJECTS

#VECTORS - seq of data elements of same basic type . We use c() to declare a vector

v1 <- c(1,2,3,4,5)
print(v1)
class(v1)
typeof(v1)

v2 <- c('lasya','sai','naramgari')
print(v2)
class(v2)
typeof(v2)

1/Inf #Inf - infinity
#NAN - missing value

v3 <- c(T,F)
v3

v1;v2;v3 #to print all vextors at once - use semicolon(used to sep 2 or more variables)

v4<-c(10,"a",TRUE)
v4
class(v4) #cohersion converts all into same class according to precedence

# use vector() to initialize a vector
x < - vector("numeric" , length=10)
x

#concatenating 
mixed_vec = c(v1 , v2)
print(mixed_vec) #coerced the numbers to characters , viceversa not possible
class(mixed_vec)


#one dimensional obj

num = c(1:10 , 2.2)
num
class((num))  #still remains numeric even if it has float

#character vector
ltrs = letters[1:10]
ltrs
class(ltrs)

#factor vector
fac = as.factor(ltrs)
fac
class(fac)


#two dimensional obj - we will refer matrix.R

#diff classes mixed together

x<- c("a" , TRUE)
x
class(x)

y <- c(1.2 , "s")
y
class(y)

z <- c(TRUE , 2)
z
class(z)

#This is implicit coercion where R tries to find a way ti represent all obj in the vector in a reasonable func

#In explicit coercion , obj can be explicitly coerced from one class to other using as.* func

x<-22:44
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

#if R cannot figure out how to coerce , it results in NAs
x <- c("a","b","c")
class(x)
as.numeric(x)
as.logical(x)
as.complex(x)



#ATTRRIBUTES - metadata for obj

x <- 22
attributes(x)

v <- seq(1,20)
v

#vector with odd values

vec<-seq(1,20,2)
vec

#vector with even values

vec1<-seq(0,20,2)
vec1

#vector with 10 odd values from 20

vec10<-seq(from=21,by=2,length.out=10)
vec10

#naming your vector
temp <- c(34,36,37)
temp

names(temp) <- c("mon","tue","wed")
temp

#another way for naming
days <- c("mon","tue","wed")
names(temp) <- days
temp

#one more way using seq
price <- seq(100,220,20)
names(price) <-paste0("p",1:7)
price


#inbuilt mat func

v1 <- c(1,2,3,4,5)

sum(v1)
sd(v1)
var(v1)
prod(v1)
max(v1)
min(v1)

#comaparing vectors

v2 <- c(6,7,8,9,10)

v1>v2
v1<v2
v1!=v2
v1==v2

v<-c(5,6,2,3,4)
v<4

#vector slicing and indexing

price1<-seq(550,670,20)
names(price1)<-paste0("p",1:7)
price1

#1 - using index position
price1[1] #start with 1 not 0
price1[2:4]
price1[c(1,4)]
price1[c(2,6)]


#2 - indexing with names
price1[c("p3")]
price1[c("p1","p2","p4")]
price1["p4"]

#3 - using logical positions
price1[c(T,F,T,T,F,T)]
price1[c(T,F)]

#4 - using exclude positions method
price1[-2]
price1[c(-2,-5)]

#5 - using comparision operator
price1[price1<600]


filter <- price1>600
price1[filter]




#HANDLING NA VALUES IN VECTORS

order_detail <- c(10,20,30,NA,50,60)
order_detail
names(order_detail) <-c("mon","tue","wed","thu","fri","sat")
order_detail
order_detail + 5 #any operation on a vector, will be applied to all the vectors

#to add 2 vectors
new_order <- c(5,10)
update_order <- order_detail + new_order
update_order

#creating subset of vector
firsttwo <- order_detail[1:2]
firsttwo
l <- length(order_detail)
l  

#***
z1<-order_detail[(l-1):1]
z1
z2<-order_detail[(l-1):2]
z2
z3<-order_detail[l-1]
z3
z4<-order_detail[l-2]
z4

#Extract all the values below 30
order_detail<30
order_detail[order_detail<30]

#to omit NA values from the vector
na.omit(order_detail[order_detail<30])

#to find order details that are multiples of 3 

(order_detail%%30) == 0
order_detail[(order_detail%%30) == 0]
na.omit(order_detail[(order_detail%%30) == 0])

sum(order_detail) #returns na because there is an NA value in the order detail vector

#use na.rm to remove NA values
sum(order_detail,na.rm=TRUE)
mean(order_detail,na.rm=TRUE)
max(order_detail,na.rm=TRUE)
min(order_detail,na.rm=TRUE)
sd(order_detail,na.rm=TRUE)
sqrt(order_detail)


#----------------------
#basic data type functions
n1<-10
class(n1)
typeof(n1)
n2<-8.9
typeof(n2)
class(n2)

is.numeric(n1)
is.numeric(n2)

i1<-as.integer(10) #converts into int , same for all data types
i1
class(i1)

#all int are num but all numerics are not int

is.numeric(i1)
is.integer(i1)
