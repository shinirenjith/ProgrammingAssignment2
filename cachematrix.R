## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    mat <- NULL
    set <- function(y){
        x <<- y
        mat <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) mat <<- inverse
    getinverse <- function() mat
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function

##function to calculate matrix inverse or to retrieve it if it exists.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    mat <- x$getinverse()
    if(!is.null(mat)) {
        message("Getting cached Matrix")
        return(mat)
    }
    data_matrix <-x$get()
    mat <- solve(data_matrix)
    x$setinverse(mat)
    mat
}