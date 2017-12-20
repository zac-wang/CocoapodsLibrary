//
//  NSNumber+ZCSupp.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/12/12.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (ZCSupp)

/// 解决 NSJSONSerialization 解析JSON，精度丢失问题
NSString *zc_decimalNumberWithDouble(double conversionValue);

/// 解决 NSJSONSerialization 解析JSON，精度丢失问题
@property (nonatomic, readonly) NSString *zc_decimalNumber;

@end
