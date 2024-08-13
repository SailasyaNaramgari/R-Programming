#MATRIX - collection of data elements in 2D rectangular layout

#nrow , ncol = number of
#byrow , bycol = arrangement

matrix(1:8 , nrow=2)
matrix(1:8 , ncol=2)

matrix(1:8 , nrow=2 , byrow=TRUE)

matrix(1:3 , nrow=2 , ncol=3)

cbind(1:3 , 1:3) #**************
rbind(1:4 , 1:4)

n <- matrix(1:6 , byrow=TRUE , nrow=2)
n

#add values - **********
rbind(n,7:9)
cbind(n , c(10,11))

#give names
rownames(n) <- c("row1" , "row2") 
colnames(n) <- c("col1" , "col2" , "col3") 
n

#to assign names using dimnames
dimnames = list(c("row1","row2"),c("col1","col2","col3"))
dimnames


x<- matrix(1:8 , ncol=2)
x

l <- matrix(LETTERS[1:6],nrow = 4, ncol = 3)
l

cbind(x,l) #converts everything into char

#matrix() func to create matrix

m1<-matrix(0,3,3)
m1
m2<-matrix(1:9,3,3)
m2
m3 <- matrix(1:9,3:3)
m3

#creating matrix using vectors
s1 <- c(23,3,4,56,32)
s2 <- c(12,45,67,90,25)
s3 <- c(s1,s2) #merge both vectors
s3
s3.matrix<- matrix(s3,byrow=TRUE,nrow=2)
s3.matrix

#functions associated with matrix
nrow(m2)
ncol(m2)
dim(m2)
rownames(n)
colnames(n)
dimnames(n)

#Arithmetic operations

mat1<-matrix(1:50,byrow=TRUE,nrow=5)
mat1

#matrix add
5+mat1

#matrix mul
5*mat1

#matrix div
5/mat1

mat1/5 #returns the quotient

#exponent
mat1^2

#with multiple matrices
mat1+mat1
mat1-mat1
mat1*mat1

#matix operations - **************
colSums(s3.matrix)
rowSums(s3.matrix)
rowMeans(s3.matrix)


#add rows and col to matrix using rbind() and cbind() function

s4 <- c(23,5,6,7,8)
total_stock<-rbind(s3.matrix,s4)
total_stock

avg<-rowMeans((total_stock))
avg

ts<-cbind(total_stock,avg)
ts


#matrix selection and indexing
student<-matrix(c(20,30,NA,70,22,28,36,80,24,26,32,75,26,24,NA,50),nrow=4,ncol=4,byrow=T)
dimnames(student)<-list(c("john","aman","sam","ken"),c("phy","mat","eng","bio"))
student


#extraction of columns
student[,1]
student[,1:2]
student[,c(1,3)]

#extraction of rows
student[1,]
student[1:2,]
student[c(1,3),]
student[2,2:4]

student[2:4,c(1,4)]
student[3:4,2:4]

#find john's score in bio mat
student["john",c(2,4)]

#find john's and sam's score in  mat
student[c("john","sam"),2]

#find john's and sam's score in  mat and eng
student[c("john","sam"),2:3]

#avg score of john
mean(student[c("john"),],na.rm=T)

#avg and total score of all studnets
apply(student,1,mean,mna.rm=T)
apply(student,1,mean,na.rm=T)
help(apply)
apply(student,1,sum,na.rm=T)

pass_score<-c(25,25,25,70)
pass_score

#how many subjects sam passed
pass<-(student[c("sam"),]>pass_score)
pass

sum(pass,na.rm=T)
