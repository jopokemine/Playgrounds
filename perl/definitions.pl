use v5.12;
use strict;
use warnings;
############################
# Variables and data types #
############################
$my_string = "String";
# Can use any non alphanumeric character as delimiter for q and qq strings
# Can do string interpolation on "" or qq strings ONLY
$my_q_string = q/"Hello" World!/;
$my_qq_string = qq:"Hello, this is my" $my_string:;
$my_int = 1;
$my_float = 3.14;
$my_binary = 0b1100; # = 12 in decimal
$my_octal = 014; # = 12 in decimal
$my_hexadecimal = 0xC; # = 12 in decimal
$my_scientific_float = 1.0025e2; # = 100.25
# Lists are immutable:
$my_simple_list = ("This", 'is a', "list"); # Simple list
$my_complex_list = ("This", 15, "is complex"); # Complex list
# Arrays are mutable:
@my_array = ("This", "is", "an", "array");
%my_hash = qw(key1 val1
              key2 val2
              key3 val3);
%my_hash_2 = (key1 => 'val1', key2 => 'val2', key3 => 'val3');
# FALSE values:
0;
'0';
undef;
'';
();
('');
# EVERYTHING else is TRUE
my $local_variable = 'local'; # Locally scoped variable
our $global_variable = 'global'; # Globally scoped variable

############################
# Conditionals             #
############################
print("Hello World") if (1==1);
if (2==2) {
    print("This is true");
} elsif (3==3) {
    print("The first one wasn't true, but this is");
} else {
    print("This is false");
}

print("Maths works") unless (1==2);
unless (2==1) {
    print("This is false");
}

given ($input) {
    when ('red') { print("red") };
    when ('blue') { print("blue") };
    when ('green') { print("green") };
    default { print("Default") }
}

print do{
    given ($colour) {
        "#FF0000" when 'red';
        "#00FF00" when 'blue';
        "#0000FF" when 'green';
        default { ''; }
    }
}

print do{
    given ($input) {
        "number" when /\d/;
        "letters" when /[a-z][A-Z]/;
        default { 'No lettes or numbers'; }
    }
}
