//
//  ZCUserDefaults.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCUserDefaults.h"

@implementation ZCUserDefaults

+ (void)zc_save:(void (^)(NSUserDefaults *))block {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    block(user);
    [user synchronize];
}

@end
