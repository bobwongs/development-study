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
#import "BWDemo0Class.h"

void test0(void);
void test1(void);

typedef NS_ENUM(NSInteger, StudentType) {
    Male,
    Female
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSLog(@"%@", @(Male));
        
        BWDemo0Class *demo0 = [BWDemo0Class new];
//        demo0.name = @"hi";
        NSLog(@"%@", @(demo0.count));

    }
    return 0;
}

// Predicate
void test2() {
    NSString *str0 = @"hello world";
    NSString *format = @"SELF contains 'world'";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:format];
    BOOL result = [predicate evaluateWithObject:str0];
    NSLog(@"result: %@", @(result));

//    NSDictionary *dict0 = @{@"time": @(12), @"name": @"first"};
//    NSDictionary *dict1 = @{@"time": @(32), @"name": @"second"};
//    NSArray *array = @[dict0, dict1];
//    NSInteger limited = 20;
//    NSString *filter0 = [NSString stringWithFormat:@"time > %@", @(limited)];
//    NSString *filter1 = [NSString stringWithFormat:@"!name contains 's'"];
//    NSString *format = [NSString stringWithFormat:@"%@ && %@", filter0, filter1];
//    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:format];
//
//    NSArray *searchResults = [array filteredArrayUsingPredicate:resultPredicate];
//    NSLog(@"searchResults: %@", searchResults);


//    NSString *str0 = @"string0";
//    NSArray *array = @[@"a-0"];
//    NSArray *result = [@[str0] arrayByAddingObjectsFromArray:array];
//    NSLog(@"result: %@", result);
//
//    NSMutableArray *array =
//    [NSMutableArray arrayWithObjects:@"Bill", @"Ben", @"Chris", @"Melissa", nil];
//
//    NSPredicate *bPredicate =
//    [NSPredicate predicateWithFormat:@"SELF beginswith[c] 'b'"];
//    NSArray *beginWithB =
//    [array filteredArrayUsingPredicate:bPredicate];
//    // beginWithB contains { @"Bill", @"Ben" }.
//
//    NSPredicate *sPredicate = [NSPredicate predicateWithFormat:@"!SELF MATCHES[c] %@", @"Ben"];  // [c]: case case-insensitive
//    NSArray *results = [array filteredArrayUsingPredicate:sPredicate];
//
//    NSLog(@"results: %@", results);
//
//
//    NSArray *array = @[@"mike", @"jenny", @"bob"];
//    //        NSString *filter = [NSString stringWithFormat:@"%K MATCHES %@"];
//    //        NSString *filter = @"%@ = %@";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.%K MATCHES %@", @"jenny"];
//    NSArray *result = [array filteredArrayUsingPredicate:predicate];
//
//    NSString* filter = @"%@ CONTAINS %@";
//    NSPredicate* predicate = [NSPredicate predicateWithFormat:filter, @"SELF", @"a"];
//    NSArray* result = [array filteredArrayUsingPredicate:predicate];
//
//    NSLog(@"array: %@", array);
//    NSLog(@"result: %@", result);
}

void test1() {
    NSDictionary *dict = @{@"url": @"https://angelapi.bluemoon.com.cn/bluemoon-control/mallerpCommon/queryOperatorPersons"};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"json string: %@", jsonString);
    
    //    NSJSONReadingMutableContainers
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
