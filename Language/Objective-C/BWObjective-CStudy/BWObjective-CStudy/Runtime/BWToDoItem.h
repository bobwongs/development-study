//
//  BWToDoItem.h
//  BWMacOSStudy
//
//  Created by BobWong on 2018/5/25.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BWToDoItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *content;
@property (assign, nonatomic) int64_t timeStamp;

- (void)addPhoto;
+ (void)about;

@end
