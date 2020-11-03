## Put comments here that give an overall description of what your
## functions do


## The function "makeCacheMatrix" creates a new, unique environment. 
## The inverse matrix is cached inside the object inv, within the main 
## environment, which is unique for EACH instance the function is called.

makeChaceMatrix<- function(x = matrix()){
        inv<- NULL
        set<- function(y){
                x<<- y
                inv<<- NULL
        }
        get<- function(){x}
        setInverse<- function(inverse) {inv<<- inverse}
        getInverse<- function(){inv}
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}



## The function "cacheSolve" returns the inverse of the matrix that is 
## returned by makeCacheMatrix function

cacheSolve<- function(x, ...){
        inv<- x$getInverse()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        mat<- x$get()
        inv<- solve(mat, ...)
        x$setInverse(inv)
        inv
}

source("cachematrix.R")

## END
