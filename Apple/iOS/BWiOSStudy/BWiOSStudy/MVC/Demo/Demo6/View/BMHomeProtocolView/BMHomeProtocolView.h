//
//  BMHomeProtocolView.h
//  BMWash
//
//  Created by BobWong on 2019/7/13.
//  Copyright © 2019 月亮小屋（中国）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 选择注销原因（多选） */
@interface BMHomeProtocolView : UIView

/* Action */
@property (nonatomic, copy) dispatch_block_t confirmEvent; // 确认事件
@property (nonatomic, copy) dispatch_block_t cancelEvent; // 取消事件
@property (nonatomic, copy) dispatch_block_t tapProtocolEvent; // 用户协议点击事件
@property (nonatomic, copy) dispatch_block_t tapPrivacyEvent; // 隐私权政策点击事件

/* Method */
+ (instancetype)instanceView;
- (void)show;
- (void)dismiss;

@end
