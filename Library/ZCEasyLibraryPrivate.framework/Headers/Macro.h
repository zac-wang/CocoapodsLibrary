//
//  Macro.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/22.
//  Copyright © 2017年 王志超. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/// 根据中心点 和大小 计算出CGRect
#define CGRectFromCentAndSize(_cent_, _size_) CGRectMake(_cent_.x-_size_.width/2, _cent_.y-_size_.height/2, _size_.height, _size_.width)

#define ZC_SCREEN_SIZE          ([[UIScreen mainScreen] bounds].size)
#define ZC_SCREEN_WIDTH         (ZC_SCREEN_SIZE.width)
#define ZC_SCREEN_HEIGHT        (ZC_SCREEN_SIZE.height)
#define ZC_SCREEN_MAX_LENGTH    (MAX(ZC_SCREEN_WIDTH, ZC_SCREEN_HEIGHT))
#define ZC_SCREEN_MIN_LENGTH    (MIN(ZC_SCREEN_WIDTH, ZC_SCREEN_HEIGHT))
#define ZC_SCREEN_SCALE         ([[UIScreen mainScreen] scale])

#define ZC_SCREEN_NOW_IS_PORTRAIT UIDeviceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)

/// 设备是否是iPad
#define ZC_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
/// 设备是否是iphone
#define ZC_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
/// 设备是否是视网膜屏幕
#define ZC_IS_RETINA (ZC_SCREEN_SCALE >= 2.0)
/// 设备是否是iPhone X
#define ZC_IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)




/// 获取当前App的基本信息字典
#define ZCAppInfoPlist          ([[NSBundle mainBundle] infoDictionary])
///app名称
#define ZCAppInfoName           ([ZCAppInfoPlist objectForKey:@"CFBundleDisplayName"])
#define ZCAppInfoBundleName     ([ZCAppInfoPlist objectForKey:@"CFBundleName"])
/// app版本
#define ZCAppInfoVersion        ([ZCAppInfoPlist objectForKey:@"CFBundleShortVersionString"])
/// app build版本
#define ZCAppInfoBuildVersion   ([ZCAppInfoPlist objectForKey:@"CFBundleVersion"])
/// app bundleIdentifier
#define ZCAppInfoBundleId       ([ZCAppInfoPlist objectForKey:@"CFBundleIdentifier"])
///手机别名： 用户定义的名称
#define ZCDeviceName            ([[UIDevice currentDevice] name])
///手机系统版本
#define ZCiOSSystemVersion      ([[UIDevice currentDevice].systemVersion floatValue])






#define UIColorFromRGB(rgbValue) UIColorFromRGBAlpha(rgbValue, 1.0)
#define UIColorFromRGBAlpha(rgbValue, _alpha_) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:(_alpha_)]


/// 清理文件夹，（要清理的目录，过期时间/秒）
#define ZCCleanCacheFile(_finderPath_, _deadline_) [ZCCacheManage zc_cleanFileWithFinderPath:_finderPath_ deadline:_deadline_ delay:0.5]

/// 创建一个UUID
#define ZC_CREATE_NEW_UUID ([[NSUUID UUID] UUIDString])



/// 兼容xcode9以下
#ifndef __IPHONE_10_0
typedef NSString * NSAttributedStringKey NS_EXTENSIBLE_STRING_ENUM;
#endif


//roundf(5.61)//四舍五入
//ceilf(5.61)//进一法
//floorf(5.31)//去尾法


#endif /* Macro_h */
