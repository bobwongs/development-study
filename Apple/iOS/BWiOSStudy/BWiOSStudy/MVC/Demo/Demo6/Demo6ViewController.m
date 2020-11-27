//
//  Demo6ViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2020/8/24.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import "Demo6ViewController.h"
#import <YYText.h>
#import "BMHomeProtocolView.h"

@interface Demo6ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label00;

// YYLabel0
@property (weak, nonatomic) IBOutlet YYLabel *yyLabel0;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yyLabel0Height;

@property (weak, nonatomic) IBOutlet UILabel *label1;


@end

@implementation Demo6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLabel00];
    
    [self testLabel0];
    [self testLabel1];
}

- (void)setupLabel00 {
//    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
//    attach.image = [UIImage imageNamed:@"time"];
//    attach.bounds = CGRectMake(0, 0, 13, 13);
//    UITextField
//    NSString *longText = @"longTextlongTextlongTextlongTextlongTextlongTextlongTextlongText\n";
//    
//    
//    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
////    NSString *showText = [NSString stringWithFormat:@"%@  ", _label00.text];
//    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@""];
//    [attrString appendAttributedString:attachString];
//    [attrString appendAttributedString:[[NSAttributedString alloc] initWithString:longText]];
//    [attrString appendAttributedString:attachString];
//    [attrString appendAttributedString:[[NSAttributedString alloc] initWithString:longText]];
//    
//    self.label00.attributedText = attrString;
}

- (IBAction)showProtocolView:(id)sender {
    [[BMHomeProtocolView instanceView] show];
}

- (void)testLabel0 {
    
}

- (void)testLabel1 {
    NSString *tipsText = _label1.text;
    NSString *protocolHighlightText = @"《用户协议》";
    NSRange protocolRange = [tipsText rangeOfString:protocolHighlightText];
    NSString *privacyHighlightText = @"《隐私权政策》";
    NSRange privacyRange = [tipsText rangeOfString:privacyHighlightText];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:tipsText];
    [attributedString yy_setTextHighlightRange:protocolRange color:UIColor.orangeColor backgroundColor:nil tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"Protocol");
    }];
    [attributedString yy_setTextHighlightRange:privacyRange color:UIColor.orangeColor backgroundColor:nil tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"Privacy");
    }];
    _label1.attributedText = attributedString;
    _label1.userInteractionEnabled = YES;
    
//    [_label1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel1Action)]];
}

- (void)tapLabel1Action {
    NSLog(@"tapLabel1Action");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
