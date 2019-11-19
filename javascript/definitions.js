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
// es6 async function
async function myAsyncFunction(arg1, arg2) {
    const awaitConst = await setTimeout(() => {
        console.log("hello1");
    }, 1000);
    console.log("hello2");
}
// promise
const promise = new Promise((resolve, reject) => {
    console.log("test");
    if (1 == 1) {
        resolve("This will be sent to next .then() statement, in valid function");
    } else {
        reject("This will be sent to next .catch() statement, or next .then() statement, in invalid function");
    }
});
promise.then(result => {
    console.log("This is run if previous promise resolves");
    return result;
}, result => {
    console.log("This is run if previous promise rejects");
    return result;
});
// calling functions
myFunction("arg1", 2, true);

// Classes and objects
class myClass {
    constructor(property1, property2) {
        this.prop1 = property1;
        this.prop2 = property2;
    }

    myClassFunction = (num1, num2) => num1 + num2;
}

const myObject = new myClass("prop1", 2);


////////////////////////
// TODO: REMOVE BELOW //
////////////////////////


// conditionals, loops and error handling
const aBool = true;
if (aBool || false && true) {
    console.log("Runs if conditional is true");
} else if (aBool) {
    console.log("Runs if first conditional is false, but this conditional is true");
} else {
    console.log("Runs if all conditionals are false");
}

const aString = "A"
switch (aString) {
    case 'A':
        console.log("Run if aString == A");
        break;
    case 'B':
    case 'C':
        console.log("Run if aString == B or if aString == C");
    default:
}
