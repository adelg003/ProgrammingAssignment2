source('cachematrix.R')

# Test 1
mat = NULL
foo = NULL
bar = NULL

mat = matrix(c(4,2,7,6),c(2,2))
foo = makeCacheMatrix()

foo$set(mat)
foo$get()

foo$setinv(solve(foo$get()))
bar = foo$getinv()
bar

bar == solve(mat)

# Test 2
mat = NULL
foo = NULL

mat = matrix(c(4,2,7,6),c(2,2))
foo = makeCacheMatrix()

foo$set(mat)
foo$get()

cacheSolve(foo)
# Should get "getting cached data" on the second run
cacheSolve(foo)
