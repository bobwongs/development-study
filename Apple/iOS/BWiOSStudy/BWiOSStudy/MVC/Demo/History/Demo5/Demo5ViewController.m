//
//  Demo5ViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2020/7/9.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import "Demo5ViewController.h"
#import "UIView+BWAdd.h"
#import <SVProgressHUD.h>
#import "BMCustomAlertView.h"
#import <YYCategories.h>

@interface Demo5ViewController ()

@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UIView *view0;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView0;

@property (weak, nonatomic) IBOutlet UIButton *button0;
@property (weak, nonatomic) IBOutlet UIButton *buttonColor0;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label0;

@end

@implementation Demo5ViewController

- (void)dealloc {
    NSLog(@"dealloc Demo5ViewController");
}

- (IBAction)showCustomAlert:(id)sender {
    [BMCustomAlertView showWithTitle:@"title" content:@"content" confirmText:@"OK" cancelText:@"Cancel" confirmEvent:^{
        NSLog(@"confirm");
    } cancelEvent:^{
        NSLog(@"cancel");
    }];
}

- (IBAction)showCustomAlert2:(id)sender {
    [BMCustomAlertView showOnlyConfirmWithTitle:@"title" content:@"my content" confirmText:@"OK" confirmEvent:^{
        NSLog(@"OK");
    }];
}

- (IBAction)showAlert3:(id)sender {
    [BMCustomAlertView showOnlyConfirmWithTitle:@"title" content:nil confirmText:@"OK" confirmEvent:^{
        NSLog(@"OK");
    }];
}

- (IBAction)button0Action:(id)sender {
//    self.button0.enabled = !self.button0.isEnabled;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
    // 创建图片图片附件
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"invalid"];
    attach.bounds = CGRectMake(16, -2, 31, 12);
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"很长的地址很长的地址很长的地址很长的地址很长的地址很长的地址很长的地址很长的地址    "];
    [attrString appendAttributedString:attachString];
    _label1.attributedText = attrString;
}

- (IBAction)toDemo5VCAction:(id)sender {
    [self.navigationController pushViewController:[[self class] new] animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    
//    [SVProgressHUD showWithStatus:@"status"];
//    [SVProgressHUD showInfoWithStatus:@"info with status"];
    
    self.button0.enabled = !self.button0.isEnabled;
    
//    [SVProgressHUD appearance].backgroundColor = [UIColor colorWithRGB:<#(uint32_t)#> alpha:<#(CGFloat)#>];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]];
    [SVProgressHUD setForegroundColor:UIColor.whiteColor];
    
    [SVProgressHUD showSuccessWithStatus:@"Success"];
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
