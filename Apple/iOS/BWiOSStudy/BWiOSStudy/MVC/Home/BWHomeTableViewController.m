//
//  BWHomeTableViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2017/9/30.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWHomeTableViewController.h"

NSString *const BWKeyTitle = @"BWKeyTitle";
NSString *const BWKeySegueId = @"BWKeySegueId";

NSString *const kTitleLayoutWays = @"Layout";

NSString *const kSegueIdPushToLayoutWays = @"home_to_layout";

@interface BWHomeTableViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation BWHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dict2 = @{BWKeyTitle: kTitleLayoutWays,
                            BWKeySegueId: kSegueIdPushToLayoutWays};
    self.dataSource = @[dict2];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource ? self.dataSource.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = _dataSource[indexPath.row][BWKeyTitle];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSDictionary *dict = _dataSource[indexPath.row];
    [self performSegueWithIdentifier:dict[BWKeySegueId] sender:dict];  // sender为segue提供参数信息
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *vc = segue.destinationViewController;
    NSDictionary *dict = (NSDictionary *)sender;
    vc.title = dict[BWKeyTitle];
}

@end
