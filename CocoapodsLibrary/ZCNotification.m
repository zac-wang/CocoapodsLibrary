//
//  ZCNotification.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/10/31.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCNotification.h"
#import <UserNotifications/UserNotifications.h>
#import <UIKit/UIKit.h>

@interface ZCNotification()<UNUserNotificationCenterDelegate>
@end

@implementation ZCNotification

+ (instancetype)shared {
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [self new];
    });
    return _sharedInstance;
}

- (void)zc_registerRemoteNotification {
    UIApplication *app = [UIApplication sharedApplication];
    
    if (@available(iOS 10.0, *)) {
        //远程
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        UNAuthorizationOptions options = UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert;
        [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (!error) {
                NSLog(@"request authorization succeeded!");
            }
        }];
        
        //本地
        [center setNotificationCategories:[NSSet set]];
    }else{
        //本地
        UIUserNotificationType type = UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound;
        UIUserNotificationSettings *uns = [UIUserNotificationSettings settingsForTypes:type categories:[NSSet set]];
        [app registerUserNotificationSettings:uns];
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    //远程
    if([app respondsToSelector:@selector(registerForRemoteNotifications)]) { // iOS8+
        [app registerForRemoteNotifications];
    }else if([app respondsToSelector:@selector(registerForRemoteNotificationTypes:)]){ // iOS8-
        [app registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert];
    }
#pragma clang diagnostic pop
    
    [self showWarning];
}

- (NSString *)zc_getTokenWithTokenData:(NSData *)deviceToken {
    NSString *deviceTokenStr = [NSString stringWithFormat:@"%@", deviceToken];
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[<>\\s]" options:0 error:nil];
    deviceTokenStr = [regularExpression stringByReplacingMatchesInString:deviceTokenStr options:0 range:NSMakeRange(0, deviceTokenStr.length) withTemplate:@""];
    return deviceTokenStr;
}

- (void)showWarning {
    id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
    if(![delegate respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)]) {
        NSLog(@"请实现- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {\n\tNSLog(@\"向APNS注册成功，收到返回的deviceToken:%%@\", [ZCNotification getTokenWithTokenData:deviceToken]);\n}");
        if(![delegate respondsToSelector:@selector(application:didFailToRegisterForRemoteNotificationsWithError:)]) {
            NSLog(@"请实现- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {\n\tNSLog(@\"向APNS注册失败，返回错误信息:%%@\",error.localizedDescription);\n}");
        }
    }
    
    if(![delegate respondsToSelector:@selector(application:didReceiveRemoteNotification:)]) {
        NSLog(@"请实现- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {\n\tNSLog(@\"%%@\", userInfo.description);\n}");
    }
    
    if(![delegate respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)]) {
        NSLog(@"请实现-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {\n\tNSLog(@\"程序处于%%@ 收到静默推送\", application.applicationState == UIApplicationStateActive ? @\"前台\" : @\"后台\");\n}");
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler NS_AVAILABLE_IOS(10_0) {
    NSLog(@"Userinfo %@",notification.request.content.userInfo);
    
    //如果需要在应用在前台也展示通知
    if (@available(iOS 10.0, *)) {
        completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert);
    }
}

//点击推送消息后回调
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler NS_AVAILABLE_IOS(10_0) {
    NSLog(@"Userinfo %@",response.notification.request.content.userInfo);
}

@end
