//
//  NSNumber+ZCSupp.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/12/12.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSNumber+ZCSupp.h"

@implementation NSNumber (ZCSupp)

NSString *zc_decimalNumberWithDouble(double conversionValue){
    NSString *doubleString        = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}

- (NSString *)zc_decimalNumber {
    return zc_decimalNumberWithDouble([self doubleValue]);
}

@end
