import ballerina/io;
public function main() {
    worker w1 {
        io:println("Hello, World! #w1");
    }

    worker w2 {
        io:println("Hello, World! #w2");
    }
    worker w3 {
        io:println("Hello, World! #w3");
    }
}
