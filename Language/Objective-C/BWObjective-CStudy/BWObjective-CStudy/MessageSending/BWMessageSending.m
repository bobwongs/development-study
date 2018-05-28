//
//  BWMessageSending.m
//  BWObjective-CStudy
//
//  Created by BobWong on 2018/5/28.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import "BWMessageSending.h"

@implementation BWMessageSending

- (void)test {
    BWTomato *tomato = [BWTomato new];
    [tomato performSelector:NSSelectorFromString(@"sayHi")];
}

@end


@interface BWRed : NSObject

- (void)sayHi;

@end

@implementation BWRed

- (void)sayHi {
    NSLog(@"BWRed sayHi");
}

@end

@implementation BWTomato

- (id)forwardingTargetForSelector:(SEL)aSelector {
    BWRed *red = [[BWRed alloc] init];
    return red;
}

@end

