//
//  BWToDoItem+BWAdd.m
//  BWMacOSStudy
//
//  Created by BobWong on 2018/5/25.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import "BWToDoItem+BWAdd.h"
#import <objc/runtime.h>

@implementation BWToDoItem (BWAdd)

- (void)setDetail:(NSString *)detail {
    // 类属性的动态绑定
    // key类型声明: const void *key，只要确保key是类内部唯一的类型指针即可。key值的最佳实践，一是使用`@selector(method)`；二是使用`static const char myKey;`
    objc_setAssociatedObject(self, @selector(detail), detail, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)detail {
    return objc_getAssociatedObject(self, @selector(detail));
}

@end
