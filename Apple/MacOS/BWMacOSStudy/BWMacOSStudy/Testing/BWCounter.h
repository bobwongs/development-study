//
//  BWCounter.h
//  BWObjective-CStudy
//
//  Created by BobWong on 2018/5/28.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BWCounter : NSObject

@property (assign, nonatomic) NSInteger count;

- (void)add:(NSInteger)num;
- (void)minus:(NSInteger)num;
- (void)multiply:(NSInteger)num;
- (void)divide:(NSInteger)num;

@end
