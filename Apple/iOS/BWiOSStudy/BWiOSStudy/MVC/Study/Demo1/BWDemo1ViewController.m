//
//  BWDemo1ViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2019/1/16.
//  Copyright © 2019 BobWongStudio. All rights reserved.
//

#import "BWDemo1ViewController.h"

@interface BWDemo1ViewController ()

@property (strong, nonatomic) IBOutlet UIView *topView;

@end

@implementation BWDemo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)addAction {
    UIView *view = self.topView;
    NSLog(@"view: %@", view);
    view.frame = self.view.frame;
    
    [self.view addSubview:self.topView];
}

@end
