//
//  BWSearch.m
//  BWAlgorithm
//
//  Created by BobWong on 2017/3/6.
//  Copyright © 2017年 BobWong. All rights reserved.
//

#import "BWSearch.h"

@implementation BWSearch

+ (void)search {
    NSString *str0 = @"str0";
    NSString *str1 = @"str1";
    NSString *str2 = @"str2";
    NSString *str3 = @"str3";
    NSString *str4 = @"str4";
    NSArray *array = @[str0, str1, str2, str3, str4];
    
    NSUInteger str1Index = [array indexOfObject:str1];
    NSLog(@"str1Index is %lu", (unsigned long)str1Index);
    
    NSString *findIndex3 = array[3];
    NSLog(@"findIndex3 is %@", findIndex3);
}

@end
