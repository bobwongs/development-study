//
//  Demo8ViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2020/11/26.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import "Demo8ViewController.h"
#import <QMapKit/QMSSearcher.h>
#import "Demo9ViewController.h"
#import "UIViewController+BMModalPresentationStyle.h"

@interface Demo8ViewController () <QMSSearchDelegate>

@property (nonatomic, strong) QMSSearcher *mapSearcher;

@end

@implementation Demo8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapSearcher = [[QMSSearcher alloc] initWithDelegate:self];
}

- (IBAction)openToSelectAddress:(id)sender {
    Demo9ViewController *vc = [Demo9ViewController new];
    UINavigationController *nvgtVC = [[UINavigationController alloc] initWithRootViewController:vc];
//    [self presentViewController:nvgtVC animated:YES completion:nil];
    [self bm_fullScreenPresentViewController:nvgtVC];
}

- (void)backupCode {
    QMSSuggestionSearchOption *sugOption = [[QMSSuggestionSearchOption alloc] init];
//    sugOption.keyword = @"北京南";
//    sugOption.region = @"北京";
    [self.mapSearcher searchWithSuggestionSearchOption:sugOption];
    
    
//    QMSPoiSearchOption *searchOption = [[QMSPoiSearchOption alloc] init];
//    [self.mapSearcher searchWithPoiSearchOption:searchOption];
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
