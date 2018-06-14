//
//  NSNumber+MutableDeepCopy.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/1/11.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSNumber+MutableDeepCopy.h"

@implementation NSNumber (MutableDeepCopy)

- (NSNumber *)zc_mutableDeepCopy {
    return [self copy];
}

@end
