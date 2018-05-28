# Animation

项目中实用的iOS动画技术开发总结

## Contents

- 常规的动画类型
- UIView Animation
- Core Animation
- 开发心得
- Reference

## 常规的动画类型

平移、旋转、缩放（以及包括参考中心点的修改）

透明度

关键帧动画

## UIView Animation

**使用UIView提供的便捷的动画相关类方法**

```objective-c
// 参考UIView(UIViewAnimationWithBlocks)分类
+ (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(4_0); // delay = 0.0, options = 0
+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);
+ (void)transitionFromView:(UIView *)fromView toView:(UIView *)toView duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(4_0); // toView added to fromView.superview, fromView removed from its superview
```

**示例**

```objective-c
// 振动效果
[UIView animateWithDuration:0.1 animations:^{
    self.animatingView.transform = CGAffineTransformMakeScale(1.2, 1.2);
} completion:^(BOOL finished) {
    [UIView animateWithDuration:0.05 animations:^{
        self.animatingView.transform = CGAffineTransformIdentity;
    }];
}];
// transform：仿射变换，可用于做旋转、伸缩等常规动画
```

**可做动画的UIView属性**

| Property          | Changes you can make                     |
| ----------------- | ---------------------------------------- |
| `frame`           | Modify this property to change the view’s size and position relative to its superview’s coordinate system. (If the `transform` property does not contain the identity transform, modify the `bounds` or `center` properties instead.) |
| `bounds`          | Modify this property to change the view’s size. |
| `center`          | Modify this property to change the view’s position relative to its superview’s coordinate system. |
| `transform`       | Modify this property to scale, rotate, or translate the view relative to its center point. Transformations using this property are always performed in 2D space. (To perform 3D transformations, you must animate the view’s layer object using Core Animation.) |
| `alpha`           | Modify this property to gradually change the transparency of the view. |
| `backgroundColor` | Modify this property to change the view’s background color. |
| `contentStretch`  | Modify this property to change the way the view’s contents are stretched to fill the available space. |

## Core Animation

**CABasicAnimation基本动画**

```objective-c
// 修改alpha值
CGFloat alpha = self.animatingView.alpha;
CABasicAnimation *fadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
fadeAnim.fromValue = @(alpha);
fadeAnim.toValue = @(!alpha);
fadeAnim.duration = 2.0;
[self.animatingView.layer addAnimation:fadeAnim forKey:@"opacity"];

// 改变在layer中的数据值为动画最终值
self.animatingView.layer.opacity = !alpha;
```

**CAKeyframeAnimation关键帧动画**

```objective-c
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
```

**Key Path**

position

transform.rotation

transform.scale

等等

## **开发心得**

对动画先要有个认识，其次用掌握的开发技术去实现，可先用动画编辑软件进行动画构建加深对动画的理解；

对Apple API有些带有Completion回调的思考，先让动画或者一些处理顺利完成，之后再进行接下来的工作，目的是为了更好的用户体验或者一些想要实现的目标效果；

### Reference

https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/AnimatingViews/AnimatingViews.html

https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40004514-CH1-SW1