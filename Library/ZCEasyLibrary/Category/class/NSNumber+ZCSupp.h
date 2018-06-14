//
//  NSNumber+ZCSupp.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/12/12.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (ZCSupp)

/// 解决 NSJSONSerialization 解析JSON，精度丢失问题
NSString *zc_decimalNumberWithDouble(double conversionValue);

/// 解决 NSJSONSerialization 解析JSON，精度丢失问题
@property (nonatomic, readonly) NSString *zc_decimalNumber;

@end
