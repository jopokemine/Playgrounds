// Variables & constants
var myVar = "myVar"; // Never use this!!
let myLet = "myLet"; // Much better way to define a variable
const myConst = "myConst"; // Much better way to define a const. Immutables
// Define everything as a const first, and change it to let if needed. Never use var

// Data types
const myString = "String"
const myInt = 1
const myFloat = 3.14
const myBool = true // or 'false'
const myArray = [1, "2", true]

// Functions
function myFunction(arg1, ...args) {
    console.log(arg1);
    console.log(args[0]);
}
// es6 function
const myFunction = (arg1, ...args) => {
    console.log(arg1);
    console.log(typeof args);
}

// Classes and objects
class myClass {
    constructor(property1, property2) {
        this.prop1 = property1;
        this.prop2 = property2;
    }

    myClassFunction = (num1, num2) => num1 + num2;
}

const myObject = new myClass("prop1", 2);