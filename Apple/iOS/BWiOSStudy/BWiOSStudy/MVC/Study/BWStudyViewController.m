//
//  BWStudyViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2018/5/28.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import "BWStudyViewController.h"
#import "BWDemo1ViewController.h"

@interface BWStudyViewController ()


@end

@implementation BWStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.hidesBottomBarWhenPushed = YES;
    
//    UIView *view0 = [[UIView alloc] init];
//    view0.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:view0];
//    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.right.mas_equalTo(0);
//        make.bottom.mas_equalTo(0);
//        make.height.mas_equalTo(64);
//    }];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Test" style:UIBarButtonItemStylePlain target:self action:@selector(test0Action)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)test0Action {
    BWDemo1ViewController *demo1ViewController = [BWDemo1ViewController new];
    [self.navigationController pushViewController:demo1ViewController animated:YES];
}

- (IBAction)sayHi:(id)sender {
    self.textField.text = @"SayHi";
}

- (IBAction)clear:(id)sender {
    self.textField.text = @"";
}

@end
