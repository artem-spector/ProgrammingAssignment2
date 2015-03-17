## Put comments here that give an overall description of what your
## functions do

## The function 'makeCacheMatrix' takes an optional matrix parameter representing the matrix to be inverted.
## The default valuse is an empty matrix.
## The function contains two data fields - the original matrix and the inverted matrix, and getter and setter funcions for these fields.
## The function serves as a container only, it does not calculate the inversion. 
## If the original matrix value is changed via set method, the inverted value is nullified automatically.
## The function returns a list of accessor functions - get/set for the original martix, and getInverse/setInverse for the inverted matrix 
makeCacheMatrix <- function(x = matrix()) {
    
    inverseX <- NULL
    
    set <- function(y) {
        x <<- y
        inverseX <<- NULL
    }
    get <- function() {x}
    
    setInverse <- function(inverse) {
        inverseX <<- inverse
    }
    getInverse <- function() {inverseX}
    
    list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## The function 'cacheSolve' accepts a "cache" matrix created by the 'makeCacheMatrix' function.
## It first checks whether the inverted matrix is already cached, and if yes - returns it.
## Otherwise this function calculates the inverted matrix, saves it in the cache, and then returns it
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    res <- x$getInverse()
    if (!is.null(res)) {
        message('returning cached data')
        return(res)
    }
    
    m <- x$get()
    res <- solve(m)
    x$setInverse(res)
    res
}

