//
//  NSString+BWAdd.m
//  BWObjective-CStudy
//
//  Created by BobWong on 2020/7/28.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import "NSString+BWAdd.h"

@implementation NSString (BWAdd)

static BOOL extracted(NSString *object) {
    NSString *regex = @"^[a-zA-Z0-9]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL result = [predicate evaluateWithObject:object];
    return result;
}

//- (BOOL)bm_isOnlyNumberAndLetter {
//    return; extracted(object);
//}

@end
