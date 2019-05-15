//
//  BWDemo2ViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2019/3/20.
//  Copyright © 2019 BobWongStudio. All rights reserved.
//

#import "BWDemo2ViewController.h"

@interface BWDemo2ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *button0;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shortSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *longSpace;

@property (weak, nonatomic) IBOutlet UITextField *textField;
、
@end

@implementation BWDemo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
//    UIButton *button0 = self.button0;
//    button0.layer.cornerRadius = 8.0;
    
//    _shortSpace.active = NO;
//    _longSpace.active = YES;
    
//    _shortSpace.active = YES;
//    _longSpace.active = NO;
    
//    [NSLayoutConstraint deactivateConstraints:@[_shortSpace]];
//    [NSLayoutConstraint activateConstraints:@[_longSpace]];
}

- (void)textFieldDidChange:(NSNotification *)notification {
    NSLog(@"textFieldDidChange: ");
    NSLog(@"notification: %@", notification);
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 20;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    <#TableViewCell#> *cell = [tableView dequeueReusableCellWithIdentifier:<#CellId#>];
//    <#Model#> *<#model#> = <#self.dataSource[indexPath.row]#>;
//
//    return cell;
//}

- (IBAction)button0Action:(UIButton *)sender {
    BOOL selected = !sender.isSelected;
    sender.selected = selected;
    NSLog(@"selected: %@", @(selected));
    
    _shortSpace.active = selected;
    _longSpace.active = !selected;
    
    [self.view setNeedsLayout];
    [self.view layoutSubviews];
    
    [NSLayoutConstraint deactivateConstraints:@[_shortSpace]];
    [NSLayoutConstraint activateConstraints:@[_longSpace]];
    
    
//    _shortSpace.priority = !selected ? UILayoutPriorityRequired : UILayoutPriorityDefaultLow;
//    _longSpace.priority = selected ? UILayoutPriorityRequired : UILayoutPriorityDefaultLow;
    
//    _shortSpace.priority = UILayoutPriorityRequired;
//    _longSpace.priority = UILayoutPriorityDefaultLow;
    
    
}

@end
