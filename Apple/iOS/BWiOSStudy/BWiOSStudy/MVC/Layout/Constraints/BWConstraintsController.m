//
//  BWConstraintsController.m
//  BWUserInterface
//
//  Created by BobWong on 16/8/15.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "BWConstraintsController.h"

@interface BWConstraintsController ()

@property (nonatomic, strong) UIView *viewMasonryLast;

@end

@implementation BWConstraintsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUIWithConstraints];
}

/*-------------------
    Constraints
    优点
        更加方便地用于不同屏幕尺寸的适配；
    缺点
        不方便进行UI调试；
    开发经验
        UI调试的经验，如何定位和排查Bug，以及Bug的修复；
 -------------------*/
- (void)setUIWithConstraints {
    [self setConstraintsWithMasonry];
    [self setConstraintsWithNSLayoutConstraints];
}

/*-------------------
    Masonry
    描述
        Constraints框架；
    优点
        简便快捷；
 -------------------*/
- (void)setConstraintsWithMasonry {
    CGFloat space = 20;
    CGFloat w_view = 200;
    
    UIView *view0 = [[UIView alloc] init];
    self.viewMasonryLast = view0;
    view0.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(space);
        make.width.mas_equalTo(w_view);
        make.top.mas_equalTo(64 + space);
        make.height.mas_equalTo(50);
    }];
    
    /*--------------------
        Animation
    --------------------*/
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGFloat x_orginal = CGRectGetMinX(view0.frame);
        CGFloat x = x_orginal + 150;
        
        [UIView animateWithDuration:.25 animations:^{
            
            [view0 mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(x);
            }];
            
            [self.view layoutSubviews];
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:.25 animations:^{
                [view0 mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(x_orginal);
                }];
                
                [self.view layoutSubviews];
            }];
        }];
    });
}

/*-------------------
    NSLayoutConstraints
    缺点
        需要编写和维护大量的代码，可读性差；
 -------------------*/
- (void)setConstraintsWithNSLayoutConstraints {
    CGFloat space = 20;
    CGFloat multiplier = 1.0;
    UIView *superview = self.view;
    
    UIView *view1 = [[UIView alloc] init];
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view1.backgroundColor = [UIColor orangeColor];
    [superview addSubview:view1];
    
    CGRect rect = CGRectMake(space, 70, 200, 50);
    
    [superview addConstraints:@[
                                //view1 constraints
                                [NSLayoutConstraint constraintWithItem:view1
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:superview
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:multiplier
                                                              constant:rect.origin.x],
                                [NSLayoutConstraint constraintWithItem:view1
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:multiplier
                                                              constant:rect.size.width],
                                [NSLayoutConstraint constraintWithItem:view1
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:_viewMasonryLast
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:multiplier
                                                              constant:rect.origin.y],
                                [NSLayoutConstraint constraintWithItem:view1
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:multiplier
                                                              constant:rect.size.height]
                                ]];
}

@end
