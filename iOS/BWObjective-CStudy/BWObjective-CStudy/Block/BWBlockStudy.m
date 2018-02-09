//
//  BWBlockStudy.m
//  BWObjective-CStudy
//
//  Created by BobWong on 2018/2/9.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import "BWBlockStudy.h"

@implementation BWBlockStudy

+ (void)study0 {
    
    int num = 10;
    NSString *str = @"string";
    __block int count = 30;  // __block修饰符，Block内引用此变量，而不是其内部的临时变量
    void (^myBlock)(void) = ^{
        // 截获自动变量值
        NSLog(@"num: %d", num);
        NSLog(@"string: %@", str);
        
        count = 40;
    };
    num = 20;
    str = @"new string";
    myBlock();
    
    // 立即执行
    (^{
        NSLog(@"Execute immediately!");
    })();
    
}

@end
