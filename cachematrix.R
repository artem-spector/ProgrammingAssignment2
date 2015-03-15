## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inverseX <- NULL
  
  set <- function(y) {
    x <<- y
    inverseX <<- NULL
  }
  get <- function() {x}
  
  setInverse(inverse) {
    inverseX <<- inverse
  }
  getInverse() {inverseX}
}


## Write a short comment describing this function

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
