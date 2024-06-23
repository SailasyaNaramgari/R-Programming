#df - store data in tabular form
#df can contain diff data types unlike matrices, but one col should have same type


name <- c("lasya","sai","janu","aishu","prasu")
name
class(name)

age <- c(28,27,30,32,32)

children <- c(FALSE, TRUE, FALSE, FALSE, TRUE)

df <- data.frame(name,age,children)
df
class(df)
str(df) #str - structure

df0 <- data.frame(name,age,children, stringsAsFactors = FALSE)
df0
str(df0)

df1 <- data.frame(Name=name,Age=age,Children=children)
df1



df[3,2]

df[3,"age"]

df[3,]
df[,2]

df["age"] #its a vector- same type
df[2] #singgle bracket result in df

df[c(3,5),c("age","children")]

df$age
df[["age"]]
df[[2]]

df

height <- c(162,175,178,156,169)

df$height <- height #add column
df

#another way to add
employed <- c("yes","no","no","yes","yes")
df[["employed"]] <- employed

df

weight <- c(72,73,65,58,60)
cbind(df,weight) #data wont be permanently added if we use cbind or rbind

new <- data.frame(name="Jimmy",age=20, children=FALSE, height=120, employed="no")
rbind(df,new)

df

#Sorting

ranks <- order(df$age)
ranks
df$age
df[ranks,]

df[order(df$age,decreasing = TRUE),] #comma is imp


#----------------------------
  
data()
data("AirPassengers")
data("iris")
head(iris)
View(iris)
View(state.x77)
View(USPersonalExpenditure)
tail(USPersonalExpenditure)


#statistical summary
summary(iris)

#struture od dataset
str(iris)

#creating a data frame using data.frame() function
days <- c('mon','tue','wed','thu')
temp <- c(23 , 22 , 24 , 45)
rain <- c(TRUE,FALSE,TRUE,TRUE)

df <- data.frame(days,temp,rain)
df
summary(df)
str(df)

#df indexing
df[1,] #extracting 1st row
df[,2] #extracting 2nd col


#selecting using col names
df[,"temp"]
df[2:4,c('days','temp')] #2nd 3rd 4th rows for days temp

#use dollar sign to get all values of a col
df$days
df$temp

#use bracket to return a df format of same info
df['rain']
df['temp']

#filtering df using subset function
df
subset(df,subset=rain==TRUE)
subset(df,subset=temp>25)

#sorting df using order function
sorted.temp <- df[order(df$temp), ]
sorted.temp

desc.temp <- order(-df$temp)
df[desc.temp,]

#merging df
authors <- data.frame(
  surname = I(c("turkey","adams","rippley")),
  nationality = c("us","uk","aus"),
  deceased = c("yes",rep("no",2))) #rep = repeated
authors

books  <- data.frame(
  name = I(c("turkey","adams","rippley")),
  title = c("DAA","WT","MAD"),
  other.author = c(NA,"Ripley",NA))
books

m1 <- merge(authors,books,by.x='surname',by.y='name')
m1

#example dataframe manipulation
salesreport  <- data.frame(
  ID = 101:110,
  Product = c("A","B"),
  unitprice = as.integer(runif(10,100,200)),
  Qty=as.integer(runif(10,10,20)))
salesreport

#1.transform df
transpose.salesreport<-t(salesreport) #change axis
View(transpose.salesreport)
head(transpose.salesreport)

#2.sorting df
salesreport[order(salesreport$unitprice),]
salesreport[order(salesreport$unitprice,decreasing=T),]

salesreport[order(salesreport$Product,-salesreport$unitprice),]

#3.subsetting df
subset.ProductA<-subset(salesreport,Product=='A')
subset.ProductA

#extract rows for which product is A and unitprice>150
subset.salesreport<-subset(salesreport,Product=='A'&unitprice>150)
subset.salesreport

#extract 1st and 4th col for which product is A and unitprice>150
subset.salesreport1<-subset(salesreport,Product=='A'&unitprice>150,c(1,4))
subset.salesreport1

#4.merging df
setA<-subset(salesreport,Product=="A")
setB<-subset(salesreport,Product=="B")
setA
setB
cbind(setA,setB)
rbind(setA,setB)

#5.Aggregate function

#total quantity sold for each product

aggregate(salesreport$Qty,list(salesreport$Prod),sum,na.rm=T)
