//
//  NSObject+ZCDoubleValue.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/8/17.
//  Copyright © 2018年 zac. All rights reserved.
//

#import "NSObject+ZCDoubleValue.h"

@implementation NSObject (ZCDoubleValue)

- (double)zc_doubleValue {
    NSString *doubleString = [NSString stringWithFormat:@"%@", self];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber doubleValue];
}

@end
