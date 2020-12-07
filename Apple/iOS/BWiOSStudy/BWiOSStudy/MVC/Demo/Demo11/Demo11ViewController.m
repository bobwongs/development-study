//
//  Demo11ViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2020/12/3.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import "Demo11ViewController.h"
#import <Masonry.h>

@interface Demo11ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHeight;
@property (weak, nonatomic) IBOutlet UIView *middleView;


@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic, assign) NSInteger selectedYearComponent;  ///< 选中的年Component序列
@property (nonatomic, strong) NSArray<NSArray<NSNumber *> *> *monthDataSource;  ///< 月份数据源

@end

@implementation Demo11ViewController

+ (NSInteger)currentYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]] year];
}

- (void)setupData {
    /* ---------- 初始选中的年component ---------- */
    _selectedYearComponent = 0;
    
    /* ---------- 配置数据源 ---------- */
//    NSInteger year = [[self class] currentYear];
    NSInteger month = [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:[NSDate date]] month];
    // 取1年范围内的
    NSArray *currentYearMonthArray = @[];
    NSArray *nextYearMonthArray = @[];
    NSInteger recordMonth = month;  // 记录的递增月份，值设计方面会>12，用于数据取值
    for (NSInteger index = 0; index < 12; index++) {
        if (recordMonth <= 12) {
            currentYearMonthArray = [currentYearMonthArray arrayByAddingObject:@(recordMonth)];
        } else {
            nextYearMonthArray = [nextYearMonthArray arrayByAddingObject:@(recordMonth % 12)];
        }
    }
    _monthDataSource = @[currentYearMonthArray, nextYearMonthArray];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0: return 2;
            break;
        case 1: return _monthDataSource[_selectedYearComponent].count;
    }
    return 0;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (component) {
        case 0: {
            return [NSString stringWithFormat:@"%@年", @([[self class] currentYear] + row).stringValue];
        }
        case 1: {
            return [NSString stringWithFormat:@"%@月", _monthDataSource[_selectedYearComponent][row]];
        }
    }
    return 0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _selectedYearComponent = component;
    [pickerView reloadAllComponents];
}

/* -------------------- */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test0];
}

- (void)test0 {
    CGFloat height = 80, space = 8;
    UIView *lastView;
    for (NSInteger i = 0; i < 5; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor systemPinkColor];
        [self.middleView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo((height + space) * i);
            make.height.mas_equalTo(height);
        }];
        lastView = view;
    }
    
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
    }];
}
- (IBAction)remakeAction:(id)sender {
    [self.middleView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
//    static NSInteger max = 3;
//    CGFloat height = 80, space = 8;
//    UIView *lastView;
//    for (NSInteger i = 0; i < max; i++, max++) {
//        UIView *view = [[UIView alloc] init];
//        view.backgroundColor = [UIColor systemPinkColor];
//        [self.middleView addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(10);
//            make.right.mas_equalTo(-10);
//            make.top.mas_equalTo((height + space) * i);
//            make.height.mas_equalTo(height);
//        }];
//        lastView = view;
//    }
//
//    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(0);
//    }];
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
