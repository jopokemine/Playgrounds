# Variables and constants
my_var = "myVar"
MY_CONST = "This shouldn't change" # Shouldn't change, but isn't a true constant, so can change

# Data types
my_string = "Hello World!"
my_int = 123
my_float = 3.14
my_bool = True # or False
my_list = [ 1, "two", 3.0, True, [ 1, 2, 3 ] ]

# Functions
def my_function(arg1, arg2, *args, **kwargs):
    print(arg1, arg2, args, **kwargs)
# All **kwargs (or any args after *args) must be named when they are called
my_function("arg1", 2, 3, 4, 5, arg6=6)
