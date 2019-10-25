//
//  ZCLocationGeocode.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/3.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <CoreLocation/CLPlacemark.h>
#import <CoreLocation/CLLocation.h>

/// 计算两坐标间的距离
#define DistanceFromLocation(__CLLocationModel1__, __CLLocationModel2__) [ZCLocationGeocode zc_getDistance:__CLLocationModel1__ :__CLLocationModel2__]

@interface ZCLocationGeocode : NSObject

/**
 根据地理位置获取地理名称等信息
 
 @param location 地理位置
 @param block 结果回调
 */
+ (void)zc_reverseGeocodeLocation:(CLLocation *)location block:(void(^)(CLPlacemark *p))block;

/**
 根据地理名称获取地理位置等信息
 
 @param addressString 地理名称
 @param block 结果回调
 */
+ (void)zc_geocodeAddressString:(NSString *)addressString block:(void(^)(CLPlacemark *p))block;


/**
 计算两坐标间的距离,偏差±50米

 @param location1 坐标1
 @param location2 坐标2
 */
+ (CLLocationDistance)zc_getDistance:(CLLocation *)location1 :(CLLocation *)location2;
/// 计算两坐标间的距离
+ (CLLocationDistance)zc_getDistanceCoord:(CLLocationCoordinate2D)coo1 :(CLLocationCoordinate2D)coo2;


@end
