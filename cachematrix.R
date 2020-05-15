## Put comments here that give an overall description of what your
## functions do

## Use this pair of functoins to set and get a matrix, calculate the inverse matrix,
## cache the inverse matrix, and get the inverse matrix from either cache 
## (if the inverse matrix exists) or new calculation (if the cache is empty).

## Write a short comment describing this function

## Use makeCacheMatrix functoin to create a list of functions to set and get 
## a matrix and its inverse matrix.
makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) inverse <<- solve
        getinverse <- function() inverse
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## Write a short comment describing this function

## The cachesolve function will retrive the content in cache and select which way to go.
## If cache has the inverse matrix, return it and finish.
## If cache is empty, get the matrix, invert and store it cache and return a inverse of matrix.
cacheSolve <- function(x, ...) {
        inverse <- x$getinverse()
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        data <- x$get()
        inverse <- solve(data, ...)
        x$setinverse(inverse)
        inverse
        ## Return a matrix that is the inverse of 'x'
}