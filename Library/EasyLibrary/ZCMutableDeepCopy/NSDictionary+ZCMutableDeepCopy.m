//
//  NSDictionary+ZCMutableDeepCopy.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/1/11.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "NSDictionary+ZCMutableDeepCopy.h"

@implementation NSDictionary (ZCMutableDeepCopy)

- (NSMutableDictionary *)zc_mutableDeepCopy {
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] initWithCapacity:[self count]];
    //新建一个NSMutableDictionary对象，大小为原NSDictionary对象的大小
    NSArray *keys=[self allKeys];
    for(id key in keys) {//循环读取复制每一个元素
        id value=[self objectForKey:key];
        id copyValue;
        if ([value respondsToSelector:@selector(zc_mutableDeepCopy)]) {
            //如果key对应的元素可以响应mutableDeepCopy方法(还是NSDictionary)，调用mutableDeepCopy方法复制
            copyValue = [value zc_mutableDeepCopy];
        }else if([value respondsToSelector:@selector(mutableCopy)]) {
            copyValue = [value mutableCopy];
        }else if([value respondsToSelector:@selector(copy)]) {
            copyValue = [value copy];
        }else{
            copyValue = value;
        }
        [dict setObject:copyValue forKey:key];
    }
    return dict;
}

@end
