# iOS UI布局

iOS UI的布局方式

## Contents

- 布局
- Frame
- Constraints

## 布局

界面的搭建方式，对不同场景使用更合适的布局方式，可以在很大程度上提升项目开发效率和可维护性。

## Frame

绝对布局，设定UI控件指定的位置和大小

**常用界面尺寸参数：**

状态栏高度、导航条高度、TabBar高度、屏幕宽度、屏幕高度

**Frame布局时获得CGRect属性函数的运用：**

```objective-c
CGFloat CGRectGetWidth ( CGRect rect );
CGFloat CGRectGetHeight ( CGRect rect );
CGFloat CGRectGetMinX ( CGRect rect );
CGFloat CGRectGetMidX ( CGRect rect );
CGFloat CGRectGetMaxX ( CGRect rect );
CGFloat CGRectGetMinY ( CGRect rect );
CGFloat CGRectGetMidY ( CGRect rect );
CGFloat CGRectGetMaxY ( CGRect rect );
```

**Frame开发技巧：**

可以用于获得CGRect的宽和高，而且可以通过调用上述函数来使创建的UI元素的位置或大小是基于规定好的UI的，以及也可以对齐UI；

使用循环语句创建大量的同类型UI；

重写layoutSubview方法，在View的frame属性修改时，进行对子空间重新布局。

## Constraints

相对布局，设定与父控件、兄弟控件、子控件的位置关系来进行布局，可以方便适配不同尺寸的屏幕

**约束相关的系统方法：**

```objective-c
setNeedsLayout
// 告诉layoutView页面需要更新，但不立即执行；
  
setNeedsUpdateConstraints
// 需要更新约束，在下次计算或者更新约束时更新约束；
  
layoutIfNeeded
// 如需要立即更新；
  
updateConstraitsIfNeed
// 如需要立即更新约束；
  
layoutSubViews
// 重写布局的系统方法；
  
updateConstraints
// 更新约束的系统方法；
  
// 更新约束调用方法顺序
setNeedsUpdateConstraints -> updateConstraitsIfNeed -> updateConstraints, 标记 -> 如约束变动或已经标记 -> 更新约束 ；

// 说明：不能使用此方式在动画上；
```

Constraints的代码实现

```objective-c
[view setTranslatesAutoresizingMaskIntoConstraints:NO];

// 方法描述
/* 
 By default, the autoresizing mask on a view gives rise to constraints that fully determine
 the view's position. This allows the auto layout system to track the frames of views whose
 layout is controlled manually (through -setFrame:, for example).
 When you elect to position the view using auto layout by adding your own constraints,
 you must set this property to NO. IB will do this for you.
 */
   
+ (instancetype)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c
   
// 方法描述
// Create constraints explicitly.  Constraints are of the form "view1.attr1 = view2.attr2 * multiplier + constant"
// If your equation does not have a second view and attribute, use nil and NSLayoutAttributeNotAnAttribute.
/*
参数说明
view1：加约束的目标视图；
attr1：view1的设置属性；
view2：view1的相对参考视图；
attire：view2所被参考的属性；
multiplier：乘数；
constant：偏移常量；
方法使用
如果方法中view2为父视图或兄弟视图（即不为空），视图不能自己给自己加约束（即不能向视图对象自己发送方法信息来给自己加约束），要用父视图来加约束；
*/
// 示例
UIView * view = [[UIView alloc] init];
view.backgroundColor = [UIColor greenColor];
[self.view addSubview:view];
[view setTranslatesAutoresizingMaskIntoConstraints:NO]; 
// Center X in superview
[self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
// NSLayoutAttribute
// 对比
// NSLayoutAttributeTop和NSLayoutAttributeTopMargin等类似属性的区别：Margin是边界距离，一个视图相对于参考视图（父视图，兄弟视图）的距离；Top是指视图的Top位置；
```

Constraint开源框架——**Masonry**

资源网站：https://github.com/SnapKit/Masonry

框架使用

```objective-c
[view mas_makeConstraints:^(MASConstraintMaker *make) { }];
[self.topConstraint uninstall];
[view mas_updateConstraints:^(MASConstraintMaker *make) { }];
[view mas_remakeConstraints:^(MASConstraintMaker *make) { }];
```