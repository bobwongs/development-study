//
//  main.swift
//  BWSwiftStudy
//
//  Created by BobWong on 2019/5/6.
//  Copyright © 2019 BobWongStudio. All rights reserved.
//

import Foundation

//let str0 = "hello world"
//let format = "SELF contains 'world'"
//let predicate = NSPredicate(format: format)
//let result = predicate.evaluate(with: str0)
//print("result: \(result)")


let dict0: [String : Any] = ["time": Int(12), "name": "first"]
let dict1: [String : Any] = ["time": Int(32), "name": "second"]
let array = [dict0, dict1]
let limited = 20
let filter0 = "time > \(limited)"
let filter1 = "!name contains 'fir'"
let format = "\(filter0) && \(filter1)"
let predicate = NSPredicate(format: format)
let resultArray = NSMutableArray(array: array).filtered(using: predicate)
print("resultArray: \(resultArray)")
