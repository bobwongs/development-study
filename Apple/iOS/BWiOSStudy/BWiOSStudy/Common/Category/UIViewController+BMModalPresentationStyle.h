//
//  UIViewController+BMModalPresentationStyle.h
//  BMWash
//
//  Created by liangdahong on 2020/5/14.
//  Copyright © 2020 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BMModalPresentationStyle)

- (void)bm_fullScreenPresentViewController:(UIViewController *)viewControllerToPresent;
- (void)bm_fullScreenPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag;
- (void)bm_fullScreenPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion;

- (void)bm_fullScreenPresentViewController:(UIViewController *)viewControllerToPresent
                    modalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle
                                  animated:(BOOL)flag
                                completion:(void (^)(void))completion;

@end
