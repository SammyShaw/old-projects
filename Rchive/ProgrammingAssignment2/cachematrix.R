#Assignment 2. 
## These functions cache and return the inverse of a matrix, using the '<<-' operator. 
## The first function returns a list that does four things: 
# 1. set the value of a matrix
# 2. get the value of a matrix
# 3. set the value of its inverse
# 4. get the value of its inverse

makeCacheMatrix <- function(x = matrix()) {
        neg.m <- NULL
        set <- function(y) {
                x <<- y
                neg.m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) neg.m <<- inverse
        getinverse <- function() neg.m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## The second function returns the inverse of the defined in makeCacheMatrix(), by first checking to see if it is cached, and then computing, or "solving," if it is not. 

cacheSolve <- function(x, ...) {
        cacheSolve <- function(x, ...) {
                neg.m <- x$getinverse()
                if(!is.null(neg.m)) {
                        message("getting cached data")
                        return(neg.m)
                }
                m.data <- x$get()
                neg.m <- solve(m.data, ...)
                x$setinverse(neg.m)
                neg.m 
        }
}

## The test function demonstrates that the above functions return the inverse of "my_matrix"
test.fun<-function(sq_mat){
        test<-makeCacheMatrix(sq_mat)
        cacheSolve(test)
}

my_matrix<-matrix(rnorm(25, 3, 1), 5, 5)
row.names(my_matrix)<-c("1","2","3","4","5")
colnames(my_matrix)<-c("A","B","C","D","E")
my_matrix
test.fun(my_matrix)
