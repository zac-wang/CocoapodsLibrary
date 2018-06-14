//
//  NSArray+MutableDeepCopy.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/1/11.
//  Copyright © 2018年 王志超. All rights reserved.
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
