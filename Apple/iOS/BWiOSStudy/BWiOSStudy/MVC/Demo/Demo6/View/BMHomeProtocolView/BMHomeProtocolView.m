//
//  BMHomeProtocolView.m
//  BMWash
//
//  Created by BobWong on 2019/7/13.
//  Copyright © 2019 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMHomeProtocolView.h"
#import <YYLabel.h>
#import <YYTextLayout.h>
#import <NSAttributedString+YYText.h>
//#import "BMRouterManager.h"
#import <YYCategories.h>

@interface BMHomeProtocolView ()

/* UI */
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;

@property (weak, nonatomic) IBOutlet YYLabel *contentLabel;

/* UI Data */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLabelHeight;

@end

@implementation BMHomeProtocolView

#pragma mark - View Life

- (void)dealloc {
    NSLog(@"dealloc BMHomeProtocolView");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
    [self setupData];
}

#pragma mark - Public Method

+ (instancetype)instanceView {
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return array.firstObject;
}

- (void)show {
    UIView *superView = [UIApplication sharedApplication].keyWindow;
//    UIView *superView = [BMRouterManager currentViewController].view;
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

#pragma mark - Action

- (IBAction)confirmAction:(id)sender {
    if (_confirmEvent) _confirmEvent();
}

- (IBAction)dismissAction:(id)sender {
    if (_cancelEvent) _cancelEvent();
    [self dismiss];
}

#pragma mark - Private Method

- (void)setup {
    self.mainView.layer.cornerRadius = 10.0;
    
    _contentLabel.numberOfLines = 0;
    _contentLabel.userInteractionEnabled = YES;
    _contentLabel.font = [UIFont systemFontOfSize:14.0];
    _contentLabel.textColor = UIColorHex(0x333333);
    NSString *tipsText = @"感谢您使用月亮小屋APP！我们深知个人信息对您的重要性，并会尽全力保护您的个人信息安全可靠。为了更好地保障您的个人权益，在您使用我们的产品前，请务必审慎阅读并充分理解《用户协议》和《隐私权政策》内的所有条款。您点击“同意并继续”的行为即表示当表示您已经理解并同意以上协议的全部内容。如您同意以上协议内容，请点击“同意并继续”，开始使用我们的产品和服务！";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:tipsText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 6;
    [attributedString addAttribute:NSParagraphStyleAttributeName
                      value:paragraphStyle
                      range:NSMakeRange(0, tipsText.length)];
    
    CGSize size = CGSizeMake(CGRectGetWidth(_contentLabel.frame), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:attributedString];
    CGFloat tipsTextHeight = layout.textBoundingSize.height;
    _contentLabelHeight.constant = tipsTextHeight;
    
    NSString *protocolHighlightText = @"《用户协议》";
    NSRange protocolRange = [tipsText rangeOfString:protocolHighlightText];
    NSString *privacyHighlightText = @"《隐私权政策》";
    NSRange privacyRange = [tipsText rangeOfString:privacyHighlightText];
    
    __weak typeof(self) weakSelf = self;
    [attributedString yy_setTextHighlightRange:protocolRange color:UIColor.orangeColor backgroundColor:UIColor.whiteColor tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"protocolHighlightText tap");
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.tapProtocolEvent) strongSelf.tapProtocolEvent();
    }];
    [attributedString yy_setTextHighlightRange:privacyRange color:UIColorHex(0x0378FF) backgroundColor:nil tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"privacyHighlightText tap");
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.tapPrivacyEvent) strongSelf.tapPrivacyEvent();
    }];
    _contentLabel.attributedText = attributedString;
}

- (void)setupData {
    // 监听BMNotificationRequestLogin事件，若是：移除显示。
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismiss) name:BMNotificationRequestLogin object:nil];
}

@end
