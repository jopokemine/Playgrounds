x <- "Hello "
y = "World"
"!" -> z
print(x) # prints "Hello "
x        # prints "Hello "

b <- TRUE  # boolean
i <- 123L  # integer
n <- 1.23  # numeric
c <- "ABC" # character vector
b
i
n
c

f <- function(x) { x + 1 }
f(2)

v <- c(1, 2, 3); # Vector
s <- 1:5         # Vector of numbers from 1-5 inclusive
v
s

m <- matrix(data = 1:6, nrow = 2, ncol = 3) # 2x3 matrix containing numbers 1-6 inclusive
m

a <- array(data = 1:8, dim = c(2, 2, 2)) # multidimensional array (2x2x2 array with values 1-8 inclusive)
a

l <- list(TRUE, 1L, 3.14, "abc") # list (can have different types, unlike the above)
l

factors <- factor(c("Male", "Female", "Male", "Male", "Female")) # Factor (stored as an array of integers for each unique item)
levels(factors) # Shows distinct values in aphabetical order
unclass(factors) # Shows underlying integer arrays

