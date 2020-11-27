//
//  BWDemo3ViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2019/4/28.
//  Copyright © 2019 BobWongStudio. All rights reserved.
//

#import "BWDemo3ViewController.h"
#import "BWDemo3TableView0Cell.h"

#define BW_CELL_ID @"BW_CELL_ID"

@interface BWDemo3ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation BWDemo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BWDemo3TableView0Cell class]) bundle:nil] forCellReuseIdentifier:BW_CELL_ID];
    
    _textField.text = @"new";
}

- (IBAction)buttonAction:(id)sender {
    _textField.text = [NSString stringWithFormat:@"%@", [NSDate date]];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    _textField.text = [NSString stringWithFormat:@"%@", [NSDate date]];
//}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"shouldChangeCharactersInRange");
    return YES;
}



//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 100;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BWDemo3TableView0Cell *cell = [tableView dequeueReusableCellWithIdentifier:BW_CELL_ID];
    [cell random];
    return cell;
}

@end
