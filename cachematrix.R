## Create two functions ("makeCacheMatrix" and "cacheSolve") that 
## create and execute a cached object that inverts a matrix.

## makeCacheMatrix creates a cached object for inverting a matrix object.
## makeCacheMatrix has four functions:
##  * set() : takes a matrix and stores it
##  * get() : returns a stored matrix
##  * setinv() : takes an inverted matrix and stores it
##  * getinv() : returns an inverted matrix

makeCacheMatrix <- function(x = matrix()) {
  # Set default values
  x <- NULL
  i <- NULL
  # set() : takes a matrix and stores it
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  # get() : returns a stored matrix
  get <- function() x
  # setinv() : takes an inverted matrix and stores it
  setinv <- function(inv) i <<- inv
  # getinv() : returns an inverted matrix
  getinv <- function() i
  
  output = list(set = set, get = get,
                setinv = setinv,
                getinv = getinv)
  return(output)
}

## cacheSolve takes in a "makeCacheMatrix" object and performs matrix inversion.
## If the matrix has never been inverted before, it will compute the inversion, 
## return the inversion, and stores it for future use.
## If the matrix has been inverted before, it will return the stored inversion.

cacheSolve <- function(x, ...) {
  ## Extraced a stored inversion.
  i <- x$getinv()
  if(!is.null(i)) {
    # If not null, use the prior inversion
    message("getting cached data")
  } else {
    # If null, comput the inversion
    data <- x$get()
    i <- solve(data, ...)
    x$setinv(i)
  }
  return(i)
}
