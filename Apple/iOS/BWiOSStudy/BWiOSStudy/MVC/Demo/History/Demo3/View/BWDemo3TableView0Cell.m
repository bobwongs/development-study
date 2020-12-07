//
//  BWDemo3TableView0Cell.m
//  BWiOSStudy
//
//  Created by BobWong on 2019/5/30.
//  Copyright © 2019 BobWongStudio. All rights reserved.
//

#import "BWDemo3TableView0Cell.h"
#include <stdlib.h>

@interface BWDemo3TableView0Cell ()

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topToBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleToBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelToBottom;

@end

@implementation BWDemo3TableView0Cell

- (void)random {
    NSInteger randNum = arc4random_uniform(10);
    
    // 跟top对齐
    if (randNum < 4) {
        self.middleView.hidden = YES;
        self.bottomLabel.hidden = YES;
        
        self.topToBottom.priority = UILayoutPriorityDefaultHigh;
        self.middleToBottom.priority = UILayoutPriorityDefaultLow;
        self.labelToBottom.priority = UILayoutPriorityDefaultLow;
        
        return;
    }
    
    // 跟middle对齐
    if (randNum < 7) {
        self.middleView.hidden = NO;
        self.bottomLabel.hidden = YES;
        
        self.topToBottom.priority = UILayoutPriorityDefaultLow;
        self.middleToBottom.priority = UILayoutPriorityDefaultHigh;
        self.labelToBottom.priority = UILayoutPriorityDefaultLow;
        
        return;
    }
    
    // bottom对齐
    self.middleView.hidden = NO;
    self.bottomLabel.hidden = NO;
    
    self.topToBottom.priority = UILayoutPriorityDefaultLow;
    self.middleToBottom.priority = UILayoutPriorityDefaultLow;
    self.labelToBottom.priority = UILayoutPriorityDefaultHigh;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
