//
//  ZCLocationGeocode.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/11/3.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <CoreLocation/CLPlacemark.h>

#define CLLocationModel(__latitude__, __longitude__) [[CLLocation alloc] initWithLatitude:__latitude__ longitude:__longitude__]
///计算两坐标间的距离,偏差±50米
#define DistanceFromLocation(__CLLocationModel1__, __CLLocationModel2__) [__CLLocationModel1__ distanceFromLocation:__CLLocationModel2__]

@interface ZCLocationGeocode : NSObject

/**
 根据地理位置获取地理名称等信息
 
 @param location 地理位置
 @param block 结果回调
 */
+ (void)reverseGeocodeLocation:(CLLocation *)location block:(void(^)(CLPlacemark *))block;

/**
 根据地理名称获取地理位置等信息
 
 @param addressString 地理名称
 @param block 结果回调
 */
+ (void)geocodeAddressString:(NSString *)addressString block:(void(^)(CLPlacemark *))block;

@end
