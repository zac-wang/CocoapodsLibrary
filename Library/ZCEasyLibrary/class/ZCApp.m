//
//  ZCApp.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/4.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCApp.h"

@implementation ZCApp

+ (void (^)(NSString *))zc_callMobilePhone {
    return ^(NSString *number) {
        NSString *tel = [NSString stringWithFormat:@"tel://%@", number];
        NSURL *url = [NSURL URLWithString:tel];
        
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            [[UIApplication sharedApplication] openURL:url];
#pragma clang diagnostic pop
        }
    };
}

+ (NSString *)zc_uuid {
    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return uuid;
}

@end
