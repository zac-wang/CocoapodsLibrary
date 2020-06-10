//
//  ZCLocationManager.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCLocationManager.h"
#import <CoreLocation/CoreLocation.h>
#import "Macro.h"
#import "ZCUserDefaults.h"

NSNotificationName const ZCLocationChangedNotification = @"ZCLocationChangedNotification";

@interface ZCLocationManager()<CLLocationManagerDelegate>
@end

@implementation ZCLocationManager
@synthesize zc_clManager;

+ (instancetype)shared {
    static ZCLocationManager *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        //1.应用使用期间地位位置信息,info.plist-->必须设置NSLocationWhenInUseUsageDescription【为您提供更优质的服务】
        //2.允许后台获取地理位置信息,info.plist-->必须设置NSLocationAlwaysUsageDescription【以便后台同步您的数据】
        if(!ZCAppInfoPlist[@"NSLocationAlwaysUsageDescription"] && !ZCAppInfoPlist[@"NSLocationWhenInUseUsageDescription"]) {
            NSLog(@"尚未配置后台定位权限(NSLocationAlwaysUsageDescription),尚未配置前台定位权限(NSLocationWhenInUseUsageDescription)");
        }
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //定位
        zc_clManager = [[CLLocationManager alloc] init];
        zc_clManager.delegate = self;
        zc_clManager.desiredAccuracy = kCLLocationAccuracyBest;//设置定位精度，最好的，但耗电量大
        zc_clManager.distanceFilter = 200;//定位频率,每隔多少米定位一次
        //[clManager startMonitoringForRegion:region];//对指定区域进行监控
    }
    return self;
}

- (CLLocation *)zc_nowLocation {
    return zc_clManager.location;
}

- (CLLocationCoordinate2D)zc_nowCoordinate {
    return self.zc_nowLocation.coordinate;
}

- (void)setZc_backgroundLocation:(BOOL)bgLocation {
//    zc_clManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;//导航级别的精确度
    if (@available(iOS 9.0, *))
        zc_clManager.allowsBackgroundLocationUpdates = bgLocation; //允许后台刷新
    zc_clManager.pausesLocationUpdatesAutomatically = !bgLocation; //不允许自动暂停刷新
    zc_clManager.distanceFilter = kCLDistanceFilterNone;  //不需要移动都可以刷新
}

- (void)zc_start {
    [zc_clManager startUpdatingLocation];
}

- (void)zc_stop {
    [zc_clManager stopUpdatingLocation];
}

- (void)zc_checkAuthorizationStatus:(void(^)(BOOL servicesEnabled, BOOL authStatus, NSString *msg))block {
    BOOL enable=[CLLocationManager locationServicesEnabled];
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    NSString *message;
    if (!enable) {
        message = @"定位服务未开启，请进入系统［设置］> [隐私] > [定位服务]中打开开关，并允许使用定位服务";
    }else {
        //定位服务授权状态
        if(status == kCLAuthorizationStatusNotDetermined) {//   用户没有决定是否使用定位服务
        }else if(status == kCLAuthorizationStatusRestricted) {//受限制的。可能是由于活动限制定位服务，用户不能改变。这个状态可能不是用户拒绝的定位服务
        }else if(status == kCLAuthorizationStatusDenied) {//    用户禁止，或者在设置里的定位服务中关闭
            message = [NSString stringWithFormat:@"定位权限未开启，请进入系统［设置］> [%@]中打开开关，并允许使用定位服务", ZCAppInfoName?:ZCAppInfoBundleName];
        }else if(status == kCLAuthorizationStatusAuthorizedAlways) {//用户允许在任何状态下获取位置信息。包括监测区域、访问区域、或者在有显著的位置变化时
        }else if(status == kCLAuthorizationStatusAuthorizedWhenInUse) {//仅被允许在使用应用程序的时候
        }
    }
    
    block(enable, status != kCLAuthorizationStatusDenied, message);
}

#pragma mark - 🔌 CLLocationManagerDelegate Method
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
        if ([manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            if(ZCAppInfoPlist[@"NSLocationAlwaysAndWhenInUseUsageDescription"] || ZCAppInfoPlist[@"NSLocationAlwaysUsageDescription"]) {
                [manager requestAlwaysAuthorization];
            }else{
                [manager requestWhenInUseAuthorization];
            }
        }
    }
}

#pragma mark - 位置(发生改变)刷新，会频繁调用
-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if(self.zc_updateLocations) {
        self.zc_updateLocations(locations);
    }
    
    NSDictionary *userInfo = @{@"locations":locations};
    NSNotification *notification = [NSNotification notificationWithName:ZCLocationChangedNotification object:nil userInfo:userInfo];
    [[NSNotificationQueue defaultQueue] enqueueNotification:notification postingStyle:NSPostASAP];
//    [[NSNotificationCenter defaultCenter] postNotificationName:ZCLocationChangedNotification object:nil userInfo:userInfo];
    
    if(self.zc_enabledLog) {
        CLLocation *location = locations.lastObject;
        CLLocationCoordinate2D coordinate = location.coordinate;
        NSLog(@"经度:%3.5f, 维度:%3.5f, 海拔:%3.5f", coordinate.longitude,coordinate.latitude,location.altitude);
    }
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"error:%@",error.localizedDescription);
}

@end
