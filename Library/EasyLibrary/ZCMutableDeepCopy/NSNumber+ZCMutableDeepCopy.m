//
//  NSNumber+ZCMutableDeepCopy.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/1/11.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSNumber+ZCMutableDeepCopy.h"

@implementation NSNumber (ZCMutableDeepCopy)

- (NSNumber *)zc_mutableDeepCopy {
    return [self copy];
}

@end
