//
//  BWStudyViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2018/5/28.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import "BWStudyViewController.h"

@interface BWStudyViewController ()


@end

@implementation BWStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)sayHi:(id)sender {
    self.textField.text = @"SayHi";
}

- (IBAction)clear:(id)sender {
    self.textField.text = @"";
}

@end
