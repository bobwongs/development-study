//
//  BWDemo0VC.m
//  BWiOSStudy
//
//  Created by BobWong on 2018/10/19.
//  Copyright © 2018 BobWongStudio. All rights reserved.
//

#import "BWDemo0VC.h"

@interface BWDemo0VC ()

@end

@implementation BWDemo0VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets insets = self.additionalSafeAreaInsets;
        insets.bottom = 34;
        //        self.view.safeAreaInsets = insets;
        self.additionalSafeAreaInsets = UIEdgeInsetsMake(0, 0, 100, 0);
    }
    
    CGRect frame = self.view.safeAreaLayoutGuide.layoutFrame;
    
    UIView *view0 = [[UIView alloc] init];
    view0.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
//        if (@available(iOS 11.0, *)) {
//            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
//        } else {
//            make.bottom.equalTo(0);
//        }
        
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(64);
    }];
    
    
    
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
