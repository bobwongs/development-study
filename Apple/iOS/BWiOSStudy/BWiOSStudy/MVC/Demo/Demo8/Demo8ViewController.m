//
//  Demo8ViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2020/11/26.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import "Demo8ViewController.h"
#import "BMTencentMapAddressSelectionViewController.h"
#import "UIViewController+BMModalPresentationStyle.h"

@interface Demo8ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataSouce;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation Demo8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIActivityIndicatorView *spinner;
    if (@available(iOS 13.0, *)) {
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    } else {
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    [spinner startAnimating];
    spinner.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 44);
    self.tableView.tableFooterView = spinner;
    self.tableView.tableFooterView.hidden = NO;
}

- (IBAction)openToSelectAddress:(id)sender {
    BMTencentMapAddressSelectionViewController *vc = [BMTencentMapAddressSelectionViewController new];
    UINavigationController *nvgtVC = [[UINavigationController alloc] initWithRootViewController:vc];
//    [self presentViewController:nvgtVC animated:YES completion:nil];
    [self bm_fullScreenPresentViewController:nvgtVC];
}

- (void)backupCode {

}

#pragma mark - TableView DataSource and Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSouce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"Text Label";
    return cell;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row + 1 == self.dataSouce.count) {
//        NSLog(@"Trigger load more data event.");
//
//        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//        [spinner startAnimating];
//        spinner.frame = CGRectMake(0, 0, tableView.bounds.size.width, 44);
//        self.tableView.tableFooterView = spinner;
//        self.tableView.tableFooterView.hidden = NO;
//    }
//}

#pragma mark - Setter and Getter

- (NSArray *)dataSouce {
    return @[@"1", @"2", @"3", @"4"];
//    return @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8"];
}

@end
