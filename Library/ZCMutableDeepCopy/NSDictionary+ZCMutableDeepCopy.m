//
//  NSDictionary+ZCMutableDeepCopy.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/1/11.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSDictionary+ZCMutableDeepCopy.h"

@implementation NSDictionary (ZCMutableDeepCopy)

- (NSMutableDictionary *)zc_mutableDeepCopy {
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] initWithCapacity:[self count]];
    NSArray *keys=[self allKeys];
    for(id key in keys) {
        id value=[self objectForKey:key];
        id copyValue;
        if ([value respondsToSelector:@selector(zc_mutableDeepCopy)]) {
            copyValue = [value zc_mutableDeepCopy];
        }else if([value respondsToSelector:@selector(mutableCopy)] &&
                 [value respondsToSelector:@selector(mutableCopyWithZone:)]) {
            copyValue = [value mutableCopy];
        }else if([value respondsToSelector:@selector(copy)] &&
                 [value respondsToSelector:@selector(copyWithZone:)]) {
            copyValue = [value copy];
        }else{
            copyValue = value;
        }
        [dict setObject:copyValue forKey:key];
    }
    return dict;
}

@end
