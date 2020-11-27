//
//  BMCustomAlertView.m
//  BMWash
//
//  Created by BobWong on 2019/7/13.
//  Copyright © 2019 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMCustomAlertView.h"

@interface BMCustomAlertView ()

/* UI */
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;

/* UI Data */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleToBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *confirmToSuperLeft;

@end

@implementation BMCustomAlertView

#pragma mark - View Life

- (void)dealloc {
    NSLog(@"dealloc BMCustomAlertView");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

#pragma mark - Public Method

+ (instancetype)instanceView {
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return array.firstObject;
}

- (void)show {
    UIView *superView = [UIApplication sharedApplication].keyWindow;
    [superView addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView);
    }];
    [UIView animateWithDuration:0.25 animations:^{ self.alpha = 1; }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

+ (void)showWithTitle:(NSString *)title content:(NSString *)content confirmText:(NSString *)confirmText cancelText:(NSString *)cancelText confirmEvent:(dispatch_block_t)confirmEvent cancelEvent:(dispatch_block_t)cancelEvent {
    [[[self class] instanceView] showWithTitle:title content:content confirmText:confirmText cancelText:cancelText confirmEvent:confirmEvent cancelEvent:cancelEvent];
}

- (void)showWithTitle:(NSString *)title content:(NSString *)content confirmText:(NSString *)confirmText cancelText:(NSString *)cancelText confirmEvent:(dispatch_block_t)confirmEvent cancelEvent:(dispatch_block_t)cancelEvent {
    if (title) self.title = title;
    self.content = content; // 不判断，根据值刷UI
    if (confirmText) self.confirmText = confirmText;
    if (cancelText) self.cancelText = cancelText;
    if (confirmEvent) self.confirmEvent = confirmEvent;
    if (cancelEvent) self.cancelEvent = cancelEvent;
    [self show];
}

+ (void)showOnlyConfirmWithTitle:(NSString *)title content:(NSString *)content confirmText:(NSString *)confirmText confirmEvent:(dispatch_block_t)confirmEvent {
    [[[self class] instanceView] showOnlyConfirmWithTitle:title content:content confirmText:confirmText confirmEvent:confirmEvent];
}

- (void)showOnlyConfirmWithTitle:(NSString *)title content:(NSString *)content confirmText:(NSString *)confirmText confirmEvent:(dispatch_block_t)confirmEvent {
    if (title) self.title = title;
    self.content = content; // 不判断，根据值刷UI
    if (confirmText) self.confirmText = confirmText;
    if (confirmEvent) self.confirmEvent = confirmEvent;
    self.confirmOnly = YES;
    [self show];
}

#pragma mark - Action

- (IBAction)confirmAction:(id)sender {
    if (_confirmEvent) _confirmEvent();
    [self dismiss];
}

- (IBAction)dismissAction:(id)sender {
    if (_cancelEvent) _cancelEvent();
    [self dismiss];
}

//- (IBAction)bgViewTapAction:(id)sender {
//    if (_cancelEvent) _cancelEvent();
//    [self dismiss];
//}


#pragma mark - Private Method

- (void)setup {
    self.mainView.layer.cornerRadius = 3.0;
}

#pragma mark - Setter and Getter

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setContent:(NSString *)content {
    _content = content;
    self.contentLabel.text = content;
    self.contentLabel.hidden = !content;
    self.titleToBottom.priority = content ? 200 : UILayoutPriorityDefaultHigh; // 若有，则进行展示；若无，则隐藏。
}

- (void)setConfirmText:(NSString *)confirmText {
    _confirmText = confirmText;
    [self.confirmButton setTitle:confirmText forState:UIControlStateNormal];
}

- (void)setCancelText:(NSString *)cancelText {
    _cancelText = cancelText;
    [self.cancelButton setTitle:cancelText forState:UIControlStateNormal];
}

- (void)setConfirmOnly:(Boolean)confirmOnly {
    _confirmOnly = confirmOnly;
    self.confirmToSuperLeft.priority = confirmOnly ? UILayoutPriorityDefaultHigh : 200;
    self.cancelButton.hidden = confirmOnly;
}

@end
