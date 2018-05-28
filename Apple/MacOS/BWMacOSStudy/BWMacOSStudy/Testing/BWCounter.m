//
//  BWCounter.m
//  BWObjective-CStudy
//
//  Created by BobWong on 2018/5/28.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import "BWCounter.h"

@implementation BWCounter

- (void)add:(NSInteger)num {
    _count += num;
}

- (void)minus:(NSInteger)num {
    _count -= num;
}

- (void)multiply:(NSInteger)num {
    _count *= num;
}

- (void)divide:(NSInteger)num {
    _count /= num;
}

@end
