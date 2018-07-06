//
//  main.swift
//  BWMacOSStudySwift
//
//  Created by BobWong on 2018/6/22.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

import Foundation

print("Hello, World!")

let block1 = {
    (str: String) -> Void in
        print("hello")
        print("hi")
}
block1("str")
