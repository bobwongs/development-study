//
//  BWDemo4ViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2019/4/30.
//  Copyright © 2019 BobWongStudio. All rights reserved.
//

#import "BWDemo4ViewController.h"

@interface BWDemo4ViewController ()

@end

@implementation BWDemo4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
    [[self class] showRootViewController];
}

- (IBAction)presentVC:(id)sender {
    UINavigationController *nvgtVC = [[UINavigationController alloc] initWithRootViewController:[[self class] new]];
    [self presentViewController:nvgtVC animated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear");
    [[self class] showRootViewController];
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss");
        [[self class] showRootViewController];
    }];
}

+ (void)showRootViewController {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootVC = keyWindow.rootViewController;
    NSLog(@"rootVC: %@", rootVC);
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
