//
//  BWSort.m
//  BWAlgorithm
//
//  Created by BobWong on 2017/3/6.
//  Copyright © 2017年 BobWong. All rights reserved.
//

#import "BWSort.h"

@implementation BWSort

+ (void)sort {
    NSArray *array = @[@(39), @(3), @(9), @(643), @(14), @(100), @(30)];
    
    // NSArray排序方法
    NSArray *ascendingArray = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber * _Nonnull obj1, NSNumber *  _Nonnull obj2) {
        return (obj1.doubleValue < obj2.doubleValue) ? NSOrderedAscending : NSOrderedDescending;
    }];
    NSArray *descendingArray = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber * _Nonnull obj1, NSNumber *  _Nonnull obj2) {
        return (obj1.doubleValue < obj2.doubleValue) ? NSOrderedDescending : NSOrderedAscending;
    }];
    NSLog(@"ascendingArray is %@, descendingArray is %@", ascendingArray, descendingArray);
}

@end
