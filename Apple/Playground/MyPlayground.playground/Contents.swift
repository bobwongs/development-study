//: Playground - noun: a place where people can play

import Cocoa

let block0 = {
    () -> Void in
    print("my block")
}
block0()

let block1 = {
    (str: String) -> Void in
        print("str: " + str)
        print("hello")
        for i in 1...10 {
            print("index: \(i)")
        }
}
//block1("ni")

let blk2: (Any, Any) -> Any
blk2 = {
    (a, b) -> Void in
    print("block2: \(a)")
}
blk2(23, 32)


func sayHi(_ a: String, b: String) {
    print("say hi: \(a)")
}
sayHi("o", "b")
