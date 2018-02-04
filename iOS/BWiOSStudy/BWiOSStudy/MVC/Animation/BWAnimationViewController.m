//
//  BWAnimationViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2018/2/4.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import "BWAnimationViewController.h"

@interface BWAnimationViewController ()

@end

@implementation BWAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI {
    UIView *view0 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 150, 150)];
    view0.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view0];
    
    [UIView animateWithDuration:0.25 animations:^{
        view0.frame
    } completion:^(BOOL finished) {
        
    }];
}

@end
