b <- c(125, 4)
A <- matrix(c(25, 5, 1, 0), nrow = 2)
A
solve(A, b) # solution for Ax=B
solve(A) # inverse of A

# just a small check
solve(A) %*% A

