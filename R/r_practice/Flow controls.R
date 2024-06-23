#---if statements---

x <- 30L
typeof(x)

if (is.integer(x)){
  print("x is an integer")
  }

if (is.character(x)){
  print("x is an integer")
  }
else{
  print("x is not character")
}


#---while loop---

v <- c("hello world")
v
class(v)
typeof(v)

count<-2
while (count<5){
  print(v)
  count <- count+1
}

#---------------------------

x<-0

while(x<10){
  cat('x is currently:',x)
  print('x is still less than 10, adding 1 to x')
  
  #add 1 to x
  x<-x+1
  if (x==10){
    print('x is equal to 10. terminating loop')
  }
}

#---for loop---

names <- c("lasya","sai","bhanu","suji")
names
for (i in names){
  print(i)
}

#-------------vector--------------

vec <- c(1,2,3,4,5)
for (temp_var in vec){
  print(temp_var)
} 

#another process
for (i in 1:length(vec)){
  print(vec[i])
}

#--------------list---------------

lis <- list(1,2,3,4,5)
for (temp_var in lis){
  print(temp_var)
}

for (i in 1:length(lis)){
  print(lis[i])
}

#--------------metrix----------------

mat<- matrix(1:25,nrow=5)
mat

for (num in mat){
  print(num)
}

#to pront square and square roots of numbers b/w 1 to 25

for (i in 1:25){
  sq = i*i
  sqroot=sqrt(i)
  message("i=",i, ";", "sq=",sq, ";", "sq root=",sqroot)
}



#---logical operators---
#AND - & ; OR - | ; NOT - !

x <- 25
x<10
x>10

x<20 & x>10
(x>20) & (x>5) & (x==25)

x>10 | x<5
x<20 | x==30 

(12==3)
!(12==3)

df <- mtcars
df

df[df['mpg']>=30,] #use of indexing with coma
subset(df,mpg>=20)

df[(df['mpg']>=20) & (df['hp']>100),]


#---flowcontrol---
#---if else , else if-----

hot <- FALSE
temp <- 50

if (temp>60){
  hot <- TRUE
}
hot

#change temp value
temp<-100
if (temp>60){
  hot <- TRUE
}
hot

#---else if ----

score <- 63 

if (score>80){
  print("good score")
}else if (score>60 & score<80){
  print("decent score")
}else if (score<60 & score>33){
  print("average score")
}else{
  print("poor")
}


#---break in while loop---

x<-0

while(x<5){
  cat('x is currently:',x)
  print('x is still less than 5, adding 1 to x')
  
  #add 1 to x
  x<-x+1
  if (x==5){
    print('x is equal to 5')
    break
    print("wohoo")
  }
}
  

