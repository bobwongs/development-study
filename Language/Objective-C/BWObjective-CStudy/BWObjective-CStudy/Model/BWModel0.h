//
//  BWModel0.h
//  BWObjective-CStudy
//
//  Created by BobWong on 2020/11/18.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWModel0 : NSObject

@property (nonatomic, strong) NSString *companyName;
//@property (nonatomic, strong) NSArray *orderDetail;
@property (nonatomic, strong) NSMutableArray<NSUserDefaults *> *arrayNewAddedImage;

@property (nonatomic, getter=isTag) BOOL tag;

@end

NS_ASSUME_NONNULL_END
