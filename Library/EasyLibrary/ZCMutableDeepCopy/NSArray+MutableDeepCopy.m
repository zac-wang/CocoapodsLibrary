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
    for(id value in self) {//循环读取复制每一个元素
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
        [arr addObject:copyValue];
    }
    return arr;
}

@end
