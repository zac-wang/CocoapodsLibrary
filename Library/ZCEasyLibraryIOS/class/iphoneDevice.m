//
//  iphoneDevice.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/22.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "iphoneDevice.h"
#import <sys/utsname.h>

@implementation iphoneDevice



///手机序列号
//NSString *identifierNumber = [[UIDevice currentDevice] uniqueIdentifier];
////手机系统版本
//NSString *phoneVersion = [[UIDevice currentDevice] systemVersion];
////手机型号
//NSString *phoneModel = [[UIDevice currentDevice] model];
////地方型号  （国际化区域名称）
//NSString *localPhoneModel = [[UIDevice currentDevice] localizedModel];

#define IphoneType @{@"iPhone1,1" : @"iPhone 2G", @"iPhone1,2" : @"iPhone 3G", @"iPhone2,1" : @"iPhone 3GS", @"iPhone3,1" : @"iPhone 4", @"iPhone3,2" : @"iPhone 4", @"iPhone3,3" : @"iPhone 4", @"iPhone4,1" : @"iPhone 4S", @"iPhone5,1" : @"iPhone 5", @"iPhone5,2" : @"iPhone 5", @"iPhone5,3" : @"iPhone 5c", @"iPhone5,4" : @"iPhone 5c", @"iPhone6,1" : @"iPhone 5s", @"iPhone6,2" : @"iPhone 5s", @"iPhone7,1" : @"iPhone 6 Plus", @"iPhone7,2" : @"iPhone 6", @"iPhone8,1" : @"iPhone 6s", @"iPhone8,2" : @"iPhone 6s Plus", @"iPhone8,4" : @"iPhone SE", @"iPhone9,1" : @"iPhone 7", @"iPhone9,2" : @"iPhone 7 Plus", @"iPod1,1" : @"iPod Touch 1G", @"iPod2,1" : @"iPod Touch 2G", @"iPod3,1" : @"iPod Touch 3G", @"iPod4,1" : @"iPod Touch 4G", @"iPod5,1" : @"iPod Touch 5G", @"iPad1,1" : @"iPad 1G", @"iPad2,1" : @"iPad 2", @"iPad2,2" : @"iPad 2", @"iPad2,3" : @"iPad 2", @"iPad2,4" : @"iPad 2", @"iPad2,5" : @"iPad Mini 1G", @"iPad2,6" : @"iPad Mini 1G", @"iPad2,7" : @"iPad Mini 1G", @"iPad3,1" : @"iPad 3", @"iPad3,2" : @"iPad 3", @"iPad3,3" : @"iPad 3", @"iPad3,4" : @"iPad 4", @"iPad3,5" : @"iPad 4", @"iPad3,6" : @"iPad 4", @"iPad4,1" : @"iPad Air", @"iPad4,2" : @"iPad Air", @"iPad4,3" : @"iPad Air", @"iPad4,4" : @"iPad Mini 2G", @"iPad4,5" : @"iPad Mini 2G", @"iPad4,6" : @"iPad Mini 2G", @"i386" : @"iPhone Simulator", @"x86_64" : @"iPhone Simulator"}

NSString *zc_iphoneType() {
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    for (NSString *key in IphoneType.allKeys) {
        if ([platform isEqualToString:key])
            return IphoneType[key];
    }
    
    
    return platform;
}

@end
