x <- "Hello "
y = "World"
"!" -> z
print(x) # prints "Hello "
x        # prints "Hello "

# Variable naming convention:
# # No CAPITALS
# # Separate words by '.'
my.new.variable <- "variable"

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

logical_vector <- c(1:10)
logical_vector > 5
logical_vector[(logical_vector > 5)]
logical_vector[(logical_vector > 4) & (logical_vector < 7)]

# Environments:
my.environment <- new.env()
assign("x", 10, my.environment)
my.environment[["y"]] <- 20
my.environment$z <- 30

get("x", my.environment)
my.environment[["y"]]
my.environment$z

globalenv() # Global environment
parent.env(my.environment) # Get parent environment (global environment in this case)

1 + 2   # = 3
4 - 2   # = 2
5 * 5   # = 25
6 / 2   # = 3
3 ^ 2   # = 9
3 ** 2  # = 9
format(10 ^ 5, scientific = FALSE) # Format result to not use scientific notation (returned as a string)
9 %% 2  # = 1   (Modulus)
10 %/% 3 # = 3  (Integer Division)

abs(-5)               # Absolute
log(2)                # Natural logarithm
log(2, base = 10)     # Logarithm with specified base
exp(5)                # Exponential
factorial(5)          # Factorial

pi                    # Pi
options()             # Get global options
options(digits = 10)  # Set number of decimal places (after '.') to 10
pi                    # To show the above working

# Special Numbers
Inf   # Infinity
-Inf  # Negative Infinity
NaN   # Not A Number
NA    # Not Available

1 / 0              # Infinity
-1 / 0             # Negative Infinity
Inf + 5            # Infinity
is.finite(1 / 0)   # FALSE
is.infinite(1 / 0) # TRUE

Inf / Inf         # NaN
is.nan(Inf / Inf) # TRUE

# Missing values (NA)
NA + 5    # NA
is.na(NA) # TRUE

is.na(NaN) # TRUE
is.nan(NA) # FALSE

# Logical Operators
2 > 1          # TRUE
2 >= 2         # TRUE
2 < 1          # FALSE
2 <= 2         # TRUE
2 == 1         # FALSE
2 == 2         # TRUE
2 != 1         # TRUE
2 != 2         # FALSE

"b" > "a"      # TRUE

!(TRUE)        # FALSE
TRUE | FALSE   # TRUE
TRUE & FALSE   # FALSE

# Vectorized Operations
student.marks <- c(10, 20, 30, 40) # Create Vector
# Input is a vector, output is a scalar (vector with length 1)
mean(student.marks) # 25

# Input is a vector, output is a vector
squares <- c(4, 9, 16, 25)
sqrt(squars) # {2, 3, 4, 5}
student.marks <- student.marks + 5
student.marks
student.marks >= 30 # {FALSE, FALSE, TRUE, TRUE}

# Input is multiple vectors, output is 1 vector
student.marks + squares # { (15 + 4), (25 + 9), (35 + 16), (45 + 25) } = {19, 34, 51, 70}

# Data structures
# Homogeneous - All of similar type
# Heterogeneous - Can be different types
# Atomic Classes: 
# # Character: "A", "c"
# # Numeric:   4.36, 7.42
# # Integer:   3, 5
# # Logical:   TRUE, FALSE
# # Complex:   1 + 7i, 8 - 2i

# INDEX STARTS AT 1

# Atomic Vectors (Vectors) - Homogeneous - 1D
student.names <- c("Josh", "Anna", "Leon", "Katie") # Character
student.marks <- c(70L, 80L, 60L, 55L) # Integer
student.heights <- c(180.5, 179.5, 182.0, 175.2) # Numeric
student.male <- c(TRUE, FALSE, T, F) # Logical

str(students.names) # Get structure of vector

# Factors - Homogeneous - 1D - Store nominal data
student.genders <- c("Male", "Female", "Female", "Male")         # Vector
student.genders <- factor(c("Male", "Female", "Female", "Male")) # Factor
student.genders
as.numeric(student.genders) # Show the integers behind levels
student.blood.groups <- factor(c("A", "AB", "O", "AB"), levels = c("A", "B", "AB", "O"))
student.blood.groups
str(student.blood.groups)

# List - Heterogeneous - 1D
# # Unnamed list
student1 <- list(student.names[1], student.marks[1], student.heights[1], student.genders[1])
str(student1)
student1

# # Named list
student2 <- list(name = student.names[2],
                 mark = student.marks[2],
                 height = student.heights[2],
                 gender = student.genders[2])
str(student2)
student2

# # Unnamed list
student1[1] # Will return a list
typeof(student1[1])
student1[[1]] # Return extracted object's type
typeof(student1[[1]]) # In this case, returns a "character"
student[1:3] # Returns list of index 1 to 3 inclusive

# # Names list
student2[["name"]] # Returns character "Josh"
student2$gender # Returns factor for gender
student2[c("mark", "height")] # Returns correct mark and height

# # Unnamed/Named list
length(student1) # 4

# Data Frame - Heterogeneous - 2D
students <- data.frame(student.names, student.marks, student.heights, student.genders) # Each vector passed must have equal number of elements
typeof(students) # List
str(students) # By default, data.frame will cause a vector of characters to become a factor
students
students <- data.frame(student.names, student.marks, student.heights, student.genders, stringAsFactors = FALSE)
str(students)
students

students[1] # Returns list of first column (student.names)
typeof(students[1])
students[[1]] # Returns character vector
typeof(students[[1]])
students[["student.names"]]
typeof(students[["student.names"]])
students$student.marks
typeof(students$student.marks)
students[1:3] # Column 1-3
students[c("student.marks", "student.genders")]
students
# # Cells
students[1,2] # [row number, column number]
students[1:3, 1:2] # extract multiple cells
students[c(1, 2), c(1,3)]
students[,1] # Everything from column 1
students[1,] # Everything from row 1
students[c(T, F, T, F),] # Get only 1st and 3rd rows, and all columns
students[student.genders == "Male",] # All columns where gender is Male
students[student.marks >= 75,] # All columns where mark is above or equal to 75

# Matrix - Homogeneous - 2D
student.english.marks <- c(70L, 75L, 80L, 85L)
student.maths.marks <- c(90L, 80L, 70L, 60L)
student.marks <- rbind(student.english.marks, student.maths.marks) # defines row names, defaults column names
student.marks
student.marks <- cbind(student.english.marks, student.maths.marks) # defaults row names, defines column names
student.marks
rownames(student.marks) <- c("Josh", "Anna", "Leon", "Katie")
student.marks
str(student.marks)
student.marks <- matrix(c(70L, 75L, 70L, 85L, 90L, 80L, 70L, 60L), ncol = 2, nrow = 4) # 2 columns, 4 rows
student.marks
student.marks <- matrix(c(70L, 75L, 70L, 85L, 90L, 80L, 70L, 60L), ncol = 4, nrow = 2, byrow = TRUE)
student.marks
