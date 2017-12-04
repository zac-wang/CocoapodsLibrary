//
//  Macro.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/22.
//  Copyright © 2017年 王志超. All rights reserved.
//

#ifndef Macro_h
#define Macro_h


#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_SCALE ([[UIScreen mainScreen] scale])

#define CGRectFromCentAndSize(_cent_, _size_) CGRectMake(_cent_.x-_size_.width/2, _cent_.y-_size_.height/2, _size_.height, _size_.width)


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA (SCREEN_SCALE >= 2.0)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)




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



#define ZCCleanCacheFile(_finderPath_, _deadline_, _delay_) [ZCCacheManage zc_cleanFileWithFinderPath:_finderPath_ deadline:_deadline_ delay:_delay_]






//roundf(5.61)//四舍五入
//ceilf(5.61)//进一法
//floorf(5.31)//去尾法


#endif /* Macro_h */
