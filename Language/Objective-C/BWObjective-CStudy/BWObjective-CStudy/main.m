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
        
        id<BWCommonProtocol> object = [BWMessageSending new];
        [object test];
        
    }
    return 0;
}
