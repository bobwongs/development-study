//
//  BMCustomAlertView.h
//  BMWash
//
//  Created by BobWong on 2019/7/13.
//  Copyright © 2019 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 选择注销原因（多选） */
@interface BMCustomAlertView : UIView

/* UI */
@property (nonatomic, copy) NSString *title;  ///< 标题，当前设定，至少会有标题
@property (nonatomic, copy) NSString *content;  ///< 内容
@property (nonatomic, copy) NSString *confirmText;  ///< 确认文本
@property (nonatomic, copy) NSString *cancelText;  ///< 取消文本
@property (nonatomic, assign) Boolean confirmOnly;  ///< 是否只有“确认”按钮

/* Action */
@property (nonatomic, copy) dispatch_block_t confirmEvent; // 确认事件
@property (nonatomic, copy) dispatch_block_t cancelEvent; // 取消事件

/* Method */
+ (instancetype)instanceView;
- (void)show;
- (void)dismiss;

+ (void)showWithTitle:(NSString *)title content:(NSString *)content confirmText:(NSString *)confirmText cancelText:(NSString *)cancelText confirmEvent:(dispatch_block_t)confirmEvent cancelEvent:(dispatch_block_t)cancelEvent;
- (void)showWithTitle:(NSString *)title content:(NSString *)content confirmText:(NSString *)confirmText cancelText:(NSString *)cancelText confirmEvent:(dispatch_block_t)confirmEvent cancelEvent:(dispatch_block_t)cancelEvent;

// 只展示确定按钮
+ (void)showOnlyConfirmWithTitle:(NSString *)title content:(NSString *)content confirmText:(NSString *)confirmText confirmEvent:(dispatch_block_t)confirmEvent;
- (void)showOnlyConfirmWithTitle:(NSString *)title content:(NSString *)content confirmText:(NSString *)confirmText confirmEvent:(dispatch_block_t)confirmEvent;

@end
