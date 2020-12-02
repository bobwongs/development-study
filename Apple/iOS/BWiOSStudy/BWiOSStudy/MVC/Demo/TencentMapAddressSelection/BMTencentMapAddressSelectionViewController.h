//
//  BMTencentMapAddressSelectionViewController.h
//  BWiOSStudy
//
//  Created by BobWong on 2020/11/27.
//  Copyright © 2020 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QMapKit/QMSSearchResult.h>

NS_ASSUME_NONNULL_BEGIN

@interface BMTencentMapAddressSelectionViewController : UIViewController

@property (nonatomic, strong) CLLocation *initialSelectedLocation;  ///< 初始选中位置
@property (nonatomic, copy) void(^confirmSelection)(QMSPoiData *location);  ///< 确实选择事件

@end

NS_ASSUME_NONNULL_END
