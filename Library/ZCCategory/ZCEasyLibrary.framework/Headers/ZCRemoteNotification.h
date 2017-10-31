//
//  ZCRemoteNotification.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/10/31.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCRemoteNotification : NSObject

/**
 注册远程推送
 */
+ (void)registerRemoteNotification;

/**
 注册本地推送
 */
+ (void)registerUserNotification;

/**
 根据deviceToken获取推送字符串

 @param deviceToken token二进制
 @return token字符串
 */
+ (NSString *)getTokenWithTokenData:(NSData *)deviceToken;

@end
