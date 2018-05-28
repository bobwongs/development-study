//
//  BWTesting.m
//  BWTesting
//
//  Created by BobWong on 2018/5/28.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BWCounter.h"

@interface BWTesting : XCTestCase

@end

@implementation BWTesting

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    BWCounter *counter = [BWCounter new];
    [counter add:10];
    [counter minus:10];
    XCTAssertEqual(counter.count, 0);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
