//
//  ZCLocationManager.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <CoreLocation/CLLocationManager.h>

/// 实时刷新当前位置
extern NSNotificationName const ZCLocationChangedNotification;

@interface ZCLocationManager : NSObject

///YES:在后台也可定位，默认NO:只在前台开启定位
+ (instancetype)shared;
@property(nonatomic, readonly) CLLocationManager *zc_clManager;

/// 允许打印log
@property(nonatomic, assign) BOOL zc_enabledLog;

/// 开启后台定位(iOS9+)
@property(nonatomic, readwrite) BOOL zc_backgroundLocation;

/// 获取当前地理位置
@property(nonatomic, readonly) CLLocationCoordinate2D zc_nowCoordinate;

/// 实时刷新当前位置(也可注册广播)
@property(nonatomic, copy) void(^zc_updateLocations)(NSArray<CLLocation *> *locations);



@property(nonatomic, readonly) void zc_start;
@property(nonatomic, readonly) void zc_stop;

@end
