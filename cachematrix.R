## The Assignment of R Progranmming Week 3 in Coursera


## This function,makeVector creates a special "matrix", which is really a list 
## containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
    
    # Initialization cache 
    cache <- NULL
    
    # set a matrix
    set_matrix <- function(n_matrix) {
        #set Top-level variable f_matrix
        f_matrix <<- n_matrix
        # flush the cache when the matrix assigned a new value
        cache <<- NULL
    }
    
    # the function returns the stored matrix
    get_matrix <- function() {
        f_matrix
    }
    
    # inverse and cache the inversed matrix
    cached_matrix_inverse <- function(solve) {
        cache <<- solve
    }
    
    # get the cached matrix
    getcache <- function() {
        cache
    }
    
    # return a list. Each named element of the list is a function
    list(set_matrix = set_matrix, get_matrix = get_matrix, cached_matrix_inverse 
         = cached_matrix_inverse, getcache = getcache)
}


## the function inverse the matrix,the argument is the function 'makeCacheMatrix'
## that has been called.

cacheinverse <- function(makeMatrix, ...) {
    # get the cached value
    inverse <- makeMatrix$getcache()
    # Judge whether inverse exists or not 
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    # if cache is null, inverse matrix
    original_data <- makeMatrix$get_matrix()
    inverse <- solve(original_data)
    makeMatrix$cached_matrix_inverse(inverse)
    inverse
}

