//
//  NSArray+MutableDeepCopy.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/1/11.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSArray+MutableDeepCopy.h"

@implementation NSArray (MutableDeepCopy)

- (NSMutableArray *)zc_mutableDeepCopy {
    NSMutableArray *arr = [NSMutableArray array];
    for(id value in self) {
        id copyValue;
        if ([value respondsToSelector:@selector(zc_mutableDeepCopy)]) {
            copyValue = [value zc_mutableDeepCopy];
        }else if([value respondsToSelector:@selector(mutableCopy)]) {
            copyValue = [value mutableCopy];
        }else if([value respondsToSelector:@selector(copy)]) {
            copyValue = [value copy];
        }else{
            copyValue = value;
        }
        [arr addObject:copyValue];
    }
    return arr;
}

@end
