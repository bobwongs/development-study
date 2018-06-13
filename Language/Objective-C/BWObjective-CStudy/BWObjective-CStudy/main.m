//
//  main.m
//  BWObjective-CStudy
//
//  Created by BobWong on 2018/5/28.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWRuntime.h"
#import "BWMessageSending.h"
#import "BWCommonProtocol.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        id<BWCommonProtocol> object = [BWMessageSending new];
//        [object test];
        
        NSDictionary *dict = @{@"url": @"https://www.baidu.com"};
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"json string: %@", jsonString);
        
        NSDictionary *newDict = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
        NSLog(@"new dict: %@", newDict);
        
    }
    return 0;
}
