//
//  ZCLocationManager.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <CoreLocation/CLLocationManager.h>

@interface ZCLocationManager : NSObject

///YES:在后台也可定位，默认NO:只在前台开启定位
+ (instancetype)shared;
///打印log
@property(nonatomic, assign) BOOL enabledLog;

@property(nonatomic, readonly) CLLocationManager *clManager;
///获取当前地理位置
@property(nonatomic, readonly) CLLocationCoordinate2D nowCoordinate;
@property(nonatomic, copy) void(^updateLocations)(NSArray *locations);



@property(nonatomic, readonly) void start;
@property(nonatomic, readonly) void stop;

@end
