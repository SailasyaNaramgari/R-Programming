#LISTS - contains obj of diff types
#list() - to create df

list_1 <- list(x=c(1,2,3,4) , y=c(T,F) , z=c("lasya","sai"))
print(list_1)

#using lists

test_1 <- list("music",100,5)
print(test_1)

#list contains diff types
class(test_1)
typeof(test_1)

#to check if it's a list
is.list(test_1)

#using indices
test_1[3]

#while passing the list we can create names
prod.category <- list(product="music" , count=100 , rating=5)
prod.category



#using vectors


test <- c("music",100,5)
print(test)

#vector has same type
class(test)
typeof(test)
is.list(test)

#to assign names
names(test) <- c("product","count","rating")
test

#using indices to access elements
test[2]

#in more compact way -****************
str(prod.category)

#new list
similar.prod <- list(product="movies" , count=50 , rating=4)
similar.prod

#we can add another list using similar
prod.category <- list(product="music" , count=100 , rating=5 , similar=similar.prod)
prod.category

#using indices to access elements
prod.category[2]
prod.category[[3]] #double bracket to remove label..check

prod.category[["product"]] #using names to access the elements

#last TRUE is for similar.prod , so it applies to all
prod.category[c(TRUE , FALSE , TRUE , TRUE )] 

#another way to access elements
prod.category$product
prod.category$count


#----------------------

list1<-list(x=c(10,20,30),
            y=c("a","b","c"),
            z=c(TRUE,FALSE))
list1

list2<-list(vec=seq(1:10),
           mat=matrix(1:9,3:3),
           lis=list(a=10,b=20))
list2

#recursive variable - store values of its own type
is.recursive(list2)

#indexing
list2[2] #by index
list2$mat #by dollar notation
list2['vec'] #by name
list2$lis[2] #3rd element 2nd value
list2[[3]][2] #3rd element 2nd value

length(list2)
class(list2)


#coversion of vector to list - **************

price<-c(1,2,3)
pricelist<-as.list(price)
price
pricelist

#coversion of list to vector
newprice<-unlist(pricelist)
newprice

#use dim func to convert vec to matrix - ******************8

price1<-c(11,22,33,44)
dim(price1)<-c(2,2)
price1
