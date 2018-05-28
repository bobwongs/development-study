//
//  BWToDoItem.m
//  BWMacOSStudy
//
//  Created by BobWong on 2018/5/25.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import "BWToDoItem.h"
#import <objc/runtime.h>

@implementation BWToDoItem

+ (void)load {
    [super load];
    NSLog(@"BWToDoItem load");
}

- (void)addPhoto {
    NSLog(@"addPhoto");
    
    
}

- (void)newAddPhoto {
    NSLog(@"newAddPhoto");
}

+ (void)about {
    NSLog(@"about");
}

+ (void)newAbout {
    NSLog(@"newAbout");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@: Title: %@, Content: %@", NSStringFromClass([self class]), self.title, self.content];
}

@end
