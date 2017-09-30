//
//  BWFrameController.m
//  BWUserInterface
//
//  Created by BobWong on 16/8/15.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "BWFrameController.h"

@interface BWFrameController ()

@end

@implementation BWFrameController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUIWithFrame];
}

/*--------------------
    Frame
    优点
        灵活、可控；
        方便地做UI调试，Debug，断点调试；
        可以更好地做动画；
    缺点
        不同尺寸的屏幕适配比较麻烦；
        Label要手动计算高度；
    开发经验总结
        Frame做UI刷新的经验，刷新包括显示数据和UI数据，对刷新机制的设计和封装；
 -------------------*/
- (void)setUIWithFrame {
    CGFloat space = 20;
    
    /*---------------------
        View
    ---------------------*/
    UIView *view0 = [[UIView alloc] initWithFrame:CGRectMake(space, NAVIGATION_BAR_HEIGHT_FULL + space, 200, 100)];
    view0.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view0];
    
    UIView *view0Right = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(view0.frame) + space, 0, 50, 50)];
    view0Right.center = CGPointMake(CGRectGetMidX(view0Right.frame), CGRectGetMidY(view0.frame));
    view0Right.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view0Right];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(space, CGRectGetMaxY(view0.frame) + space, 200, 100)];
    view1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];
    
    /*---------------------
        Label
        Label在frame下需要实现根据文本量、文本字号、文本行数来计算Label的高度，需要通过计算才能让Label正确的显示
        如果只有一行，可以通过使用一个单例实例，在程序一启动的时候就进行计算，把1行、2行、3行的高进行一次计算，存储到内存里，需要用到的时候直接进行使用，而不用每次都进行计算，这样可以提高程序的执行效率
     ---------------------*/
    UILabel *label0 = [[UILabel alloc] initWithFrame:CGRectMake(space, CGRectGetMaxY(view1.frame) + space, 200, 0)];
    label0.text = @"This is a label!This is a label!This is a label!";
    label0.font = [UIFont systemFontOfSize:20.0];
    label0.numberOfLines = 0;
    [label0 reframeLabelAccordingToText];
    label0.textAlignment = NSTextAlignmentLeft;
    label0.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label0];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(space, CGRectGetMaxY(label0.frame) + 20, 200, H_TEXT_SINGLE_17)];
    label1.text = @"This is a single text";
    label1.font = [UIFont systemFontOfSize:17];
    label1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:label1];
    
    /*--------------------
        UI调试
     --------------------*/
    NSLog(@"label0 is %@", label0);
    
    /*--------------------
        Animation
    --------------------*/
    UIButton *button0 = [UIButton buttonWithType:UIButtonTypeSystem];
    button0.frame = CGRectMake(space, CGRectGetMaxY(label1.frame) + space, 200, 50);
    [button0 setTitle:@"Animation" forState:UIControlStateNormal];
    button0.backgroundColor = [UIColor greenColor];
    [button0 addTarget:self action:@selector(buttonAct:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button0];
}

- (void)buttonAct:(UIButton *)sender {
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = sender.frame;
        frame.origin.x += 50;
        sender.frame = frame;
    }];
}

@end
