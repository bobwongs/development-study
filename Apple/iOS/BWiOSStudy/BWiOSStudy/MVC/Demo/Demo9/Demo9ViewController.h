//
//  Demo9ViewController.h
//  BWiOSStudy
//
//  Created by BobWong on 2020/11/27.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Demo9ViewController : UIViewController

@property (nonatomic, assign) CLLocationCoordinate2D initialSelectedCoordinate;  ///< 初始选中位置
@property (nonatomic, copy) void(^confirmSelection)(CLLocationCoordinate2D coordinate);  ///< 确实选择事件

@end

NS_ASSUME_NONNULL_END
