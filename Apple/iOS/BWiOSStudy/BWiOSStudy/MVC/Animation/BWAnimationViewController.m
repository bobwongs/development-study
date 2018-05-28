//
//  BWAnimationViewController.m
//  BWiOSStudy
//
//  Created by BobWong on 2018/2/4.
//  Copyright © 2018年 BobWongStudio. All rights reserved.
//

#import "BWAnimationViewController.h"

@interface BWAnimationViewController ()

@property (strong, nonatomic) UIView *view0;
@property (weak, nonatomic) IBOutlet UIView *animatingView;

@end

@implementation BWAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setUpViews];
}

- (void)setUpViews {
    UIView *view0 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 150, 150)];
    self.view0 = view0;
    view0.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view0];
}

- (void)animate0 {
    [UIView animateWithDuration:0.25 animations:^{
        self.view0.frame = CGRectMake(0, 0, 50, 50);
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    NSLog(@"tapAction");
}

#pragma mark - Animation

- (IBAction)moveAction:(id)sender {
    [[self class] animate:^{
        self.animatingView.frame = CGRectMake(245, 180, 60, 60);
    }];
}

- (IBAction)rotateAction:(id)sender {
    [[self class] animate:^{
        self.animatingView.transform = CGAffineTransformMakeRotation(2);
    }];
}

- (IBAction)scaleAction:(id)sender {
//    [[self class] animate:^{
//        self.animatingView.transform = CGAffineTransformMakeScale(3.0, 3.0);
//    }];
    
    // 振动效果
    [UIView animateWithDuration:0.1 animations:^{
        self.animatingView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.05 animations:^{
            self.animatingView.transform = CGAffineTransformIdentity;
        }];
    }];
}

- (IBAction)alphaAction:(id)sender {
    [[self class] animate:^{
        self.animatingView.alpha = !self.animatingView.alpha;
    }];
}

+ (void)animate:(dispatch_block_t)animation {
    [UIView animateWithDuration:0.25 animations:animation];
}

- (IBAction)caBasicAnimation:(id)sender {
//    CALayer *superLayer = self.view.layer;
//
//    CALayer *layer0 = [CALayer new];
//    layer0.frame = CGRectMake(20, 200, 200, 50);
//    layer0.backgroundColor = [UIColor greenColor].CGColor;
//    [superLayer addSublayer:layer0];
    
    CGFloat alpha = self.animatingView.alpha;
    CABasicAnimation *fadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnim.fromValue = @(alpha);
    fadeAnim.toValue = @(!alpha);
    fadeAnim.duration = 2.0;
    [self.animatingView.layer addAnimation:fadeAnim forKey:@"opacity"];
    
    // 改变在layer中的数据值为动画最终值
    self.animatingView.layer.opacity = !alpha;
}

- (IBAction)keyframeAnimation:(id)sender {
    CALayer *superLayer = self.view.layer;
    
    CALayer *layer0 = [CALayer new];
    layer0.frame = CGRectMake(74, 74, 50, 50);
    layer0.backgroundColor = [UIColor greenColor].CGColor;
    [superLayer addSublayer:layer0];
    
    // 创建CGPath作为轨迹
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,74.0,74.0);
    CGPathAddCurveToPoint(thePath,NULL,74.0,500.0,
                          320.0,500.0,
                          320.0,74.0);
    CGPathAddCurveToPoint(thePath,NULL,320.0,500.0,
                          566.0,500.0,
                          566.0,74.0);
    
    CAKeyframeAnimation *theAnimation;
    
    // 创建动画对象，规定position为动画属性
    theAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimation.path = thePath;
    theAnimation.duration = 5.0;
    
    // 给layer添加动画
    [layer0 addAnimation:theAnimation forKey:@"position"];
}

@end
