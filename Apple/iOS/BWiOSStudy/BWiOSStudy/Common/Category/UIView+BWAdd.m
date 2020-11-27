//
//  UIView+BWAdd.m
//  BWiOSStudy
//
//  Created by BobWong on 2020/7/14.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import "UIView+BWAdd.h"
#import <UIColor+YYAdd.h>
#import <objc/runtime.h>

static const int focusing_highlight_key;

@implementation UIView (BWAdd)

- (void)bm_setupFocusingHighlightToTextField:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bm_addFocusingHighlight) name:UITextFieldTextDidBeginEditingNotification object:textField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bm_removeFocusingHighlight) name:UITextFieldTextDidEndEditingNotification object:textField];
}

- (void)bm_addFocusingHighlight {
    NSLog(@"bm_addFocusingHighlight");
    
    UIView *view = objc_getAssociatedObject(self, &focusing_highlight_key);
    if (!view) {
        view = [[UIView alloc] init];
        objc_setAssociatedObject(self, &focusing_highlight_key, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        view.backgroundColor = UIColorHex(0x087cff);
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
    }
    
    view.hidden = NO;
}

- (void)bm_removeFocusingHighlight {
    NSLog(@"bm_removeFocusingHighlight");
    
    UIView *view = objc_getAssociatedObject(self, &focusing_highlight_key);
    view.hidden = YES;
}

@end
