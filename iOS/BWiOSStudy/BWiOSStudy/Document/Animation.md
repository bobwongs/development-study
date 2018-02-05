# Animation

项目中实用的iOS动画技术开发总结

## Contents

- UIView Animation
- Core Animation
- Reference

### UIView Animation

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

动画相关方法

Objective-C示例

```objective-c

```

Swift示例

```swift

```

### Core Animation



### Reference

https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/AnimatingViews/AnimatingViews.html