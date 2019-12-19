printLn!("Hello world!"); // '!' indicates a macro, NOT a function
// Variables:
let foo = 5; // immutable
let mut bar = 5; // mutable
let mut answer = String::new(); // '::' indicates 'new' is assocated function of the String type. 
// ^ Also called a static method ^

/////////////////////////////////////////////////////////
fn largest<T: PartialOrd + Copy>(list: &[T]) -> T {
    let mut largest = list[0];

    for &item in list.iter() {
        if item > largest {
            largest = item;
        }
    }

    largest
}

fn main() {
    let number_list = vec![34, 50, 25, 100, 65];

    let result = largest(&number_list);
    println!("The largest number is {}", result);

    let char_list = vec!['y', 'm', 'a', 'q'];

    let result = largest(&char_list);
    println!("The largest char is {}", result);
}
///////////////////////////////////////////////////////////