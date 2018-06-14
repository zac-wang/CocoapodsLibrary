//
//  ZCLocationGeocode.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/11/3.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCLocationGeocode.h"
#import <CoreLocation/CLGeocoder.h>

@implementation ZCLocationGeocode

+ (void)zc_reverseGeocodeLocation:(CLLocation *)location block:(void (^)(CLPlacemark *))block {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    if(geocoder.geocoding)
        [geocoder cancelGeocode];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *p = placemarks.firstObject;
        block(p);
        
        if(p) {
            //NSString *country=p.country; //国家
            //NSString *locality=p.locality; // 城市
            //NSString *subLocality=p.subLocality; // 城市相关信息，例如标志性建筑
            //NSString *thoroughfare=p.thoroughfare;//街道
            //NSString *name=p.name;//地名
            
            //NSString *postalCode=p.postalCode; //邮编
            //CLLocation *location=p.location;//位置
            //CLRegion *region=p.region;//区域
            
            //NSString *ISOcountryCode=p.ISOcountryCode; //国家编码
            //NSString *administrativeArea=p.administrativeArea; // 州
            //NSString *subAdministrativeArea=p.subAdministrativeArea; //其他行政区域信息
            //NSString *subThoroughfare=p.subThoroughfare; //街道相关信息，例如门牌等
            //NSArray *areasOfInterest=p.areasOfInterest; //关联的或利益相关的地标
            //NSString *inlandWater=p.inlandWater; //水源、湖泊
            //NSString *ocean=p.ocean; // 海洋
            //NSDictionary *addressDic= placemark.addressDictionary;//详细地址信息字典,包含以下部分信息
            
            NSLog(@"位置在：%@%@%@%@%@", p.country, p.locality, p.subLocality, p.thoroughfare, p.name);
        }
    }];
}

+ (void)zc_geocodeAddressString:(NSString *)addressString block:(void (^)(CLPlacemark *))block {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:addressString completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *p = placemarks.firstObject;
        block(p);
        
        if(p) {
            NSLog(@"位置在：%@%@%@%@%@", p.country, p.locality, p.subLocality, p.thoroughfare, p.name);
        }
    }];
}

+ (CLLocationDistance)zc_getDistance:(CLLocation *)location1 :(CLLocation *)location2 {
    return [location1 distanceFromLocation:location2];
}

+ (CLLocationDistance)zc_getDistanceCoord:(CLLocationCoordinate2D)coo1 :(CLLocationCoordinate2D)coo2 {
    CLLocation *l1 = [[CLLocation alloc] initWithLatitude:coo1.latitude longitude:coo1.longitude];
    CLLocation *l2 = [[CLLocation alloc] initWithLatitude:coo2.latitude longitude:coo2.longitude];
    return [self zc_getDistance:l1 :l2];
}

@end
