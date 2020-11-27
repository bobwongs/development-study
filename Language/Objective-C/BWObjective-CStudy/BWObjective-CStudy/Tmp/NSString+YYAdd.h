//
//  NSString+YYAdd.h
//  YYCategories <https://github.com/ibireme/YYCategories>
//
//  Created by ibireme on 13/4/3.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

//#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provide hash, encrypt, encode and some common method for 'NSString'.
 */
@interface NSString (YYAdd)

- (NSString *)stringByURLEncode;

@end

NS_ASSUME_NONNULL_END
