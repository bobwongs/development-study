//
//  UIViewController+BMModalPresentationStyle.m
//  BMWash
//
//  Created by liangdahong on 2020/5/14.
//  Copyright © 2020 月亮小屋（中国）有限公司. All rights reserved.
//

#import "UIViewController+BMModalPresentationStyle.h"

@implementation UIViewController (BMModalPresentationStyle)

#pragma mark - Public Method

- (void)bm_fullScreenPresentViewController:(UIViewController *)viewControllerToPresent {
    [self bm_fullScreenPresentViewController:viewControllerToPresent animated:YES completion:nil];
}

- (void)bm_fullScreenPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag {
    [self bm_fullScreenPresentViewController:viewControllerToPresent animated:flag completion:nil];
}

- (void)bm_fullScreenPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if (@available(iOS 13.0, *)) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone
            && ![viewControllerToPresent isKindOfClass:UIAlertController.class]) {
            // iOS13 ，iPhone ，不是 UIAlertController 就强制设置为 UIModalPresentationFullScreen
            viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
        }
    }
    [self presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)bm_fullScreenPresentViewController:(UIViewController *)viewControllerToPresent
                    modalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle
                                  animated:(BOOL)flag
                                completion:(void (^)(void))completion {
    viewControllerToPresent.modalPresentationStyle = modalPresentationStyle;
    [self presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
