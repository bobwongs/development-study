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

void test0(void);
void test1(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        id<BWCommonProtocol> object = [BWMessageSending new];
//        [object test];
        

//        test0();
        test1();
        NSDictionary *dict = @{@"url": @"https://www.baidu.com"};
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"json string: %@", jsonString);
        
        NSDictionary *newDict = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
        NSLog(@"new dict: %@", newDict);
        
    }
    return 0;
}

void test0() {
    NSDictionary *dict = @{@"url": @"https://angelapi.bluemoon.com.cn/bluemoon-control/mallerpCommon/queryOperatorPersons"};
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dict];
    
    NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"dataStr: %@", dataStr);
    
    NSData *data2 = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *dataStr2 = [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding];
    
    NSLog(@"dataStr2: %@", dataStr2);
    
    
    //        NSDictionary *newDict = [NSKeyedUnarchiver unarchiveObjectWithData:data2];
    
    
    //        NSLog(@"new dict: %@", newDict);
}

void test1() {
    NSDictionary *dict = @{@"url": @"https://angelapi.bluemoon.com.cn/bluemoon-control/mallerpCommon/queryOperatorPersons"};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"json string: %@", jsonString);
    
//    NSJSONReadingMutableContainers
}
