//
//  BMMallVCTool.m
//  B2BMall
//
//  Created by BobWong on 2020/9/22.
//  Copyright © 2020 月亮小屋（中国）有限公司. All rights reserved.
//

#import "Demo7Tool.h"
//#import "BMHomeProtocolView.h"
//#import "BMRouterManager.h"

#define BMMallVCToolProtocolAgreementKey @"BMMallVCToolProtocolAgreementKey"

@implementation Demo7Tool

//+ (void)checkToShowProtocolView {
//    BOOL agreement = [[NSUserDefaults standardUserDefaults] boolForKey:BMMallVCToolProtocolAgreementKey];
//    if (!agreement) [self showHomeProtocolView];
//}
//
//+ (void)showHomeProtocolView {
//    BMHomeProtocolView *view = [BMHomeProtocolView instanceView];
//    view.cancelEvent = ^{
//        // 不同意。Toast提示，保留弹窗，直至用户同意为止
//        [BMShowHUD showInfoToView:UIApplication.sharedApplication.keyWindow withText:@"需要获得您的同意才能继续使用月亮小屋APP"];
//    };
//    __weak typeof(view) weakView = view;
//    view.confirmEvent = ^{
//        // 同意。标识更改为YES
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BMMallVCToolProtocolAgreementKey];
//        __strong typeof(weakView) strongView = weakView;
//        [strongView dismiss];
//    };
//    view.tapProtocolEvent = ^{
//        // 用户协议
//        [self toWebWithSubPath:INTERFACE_USER_PROTOCOL title:@"用户许可协议"];
//    };
//    view.tapPrivacyEvent = ^{
//        // 隐私
//        [self toWebWithSubPath:INTERFACE_PRIVACY_POLICY title:@"隐私权政策"];
//    };
//    [view show];
//}
//
//+ (void)toWebWithSubPath:(NSString *)subPath title:(NSString *)title {
//    NSString *urlString = [NSString stringWithFormat:@"%@/%@", kBMIsTestEnvironment ? BASE_URL_TEST : BASE_URL, subPath];
//    BMBeforeWebViewController *webVC = [BMBeforeWebViewController new];
//    webVC.urlString = urlString;
//    webVC.title = title;
//    [[BMRouterManager currentNavigationController] pushViewController:webVC animated:YES];
//}

@end
