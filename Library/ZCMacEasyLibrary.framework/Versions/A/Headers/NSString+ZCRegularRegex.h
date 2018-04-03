//
//  NSString+ZCRegularRegex.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZCRegularTimeStamp @"^[1-9]\\d*$"       //判断是否符合 时间戳格式

@interface NSString (ZCRegularRegex)

/// 判断是否匹配正则
@property(nonatomic, readonly) BOOL(^zc_regular)(NSString *regularRegex);

/// 格式是否符合 手机号
@property(nonatomic, readonly) BOOL zc_isPhoneNumber;
/// 格式是否符合 邮箱
@property(nonatomic, readonly) BOOL zc_isEmail;
/// 格式是否符合 数字 (整数+小数)
@property(nonatomic, readonly) BOOL zc_isNumber;
/// 格式是否符合 整数
@property(nonatomic, readonly) BOOL zc_isInt;
/// 格式是否为  全中文
@property(nonatomic, readonly) BOOL zc_isChinese;

/// 判断身份证格式有效
@property(nonatomic, readonly) BOOL zc_isIDCard;
/// 判断身份证格式有效(不验证时间)
@property(nonatomic, readonly) BOOL zc_isIDCardNoVerifTime;
/// 根据身份证前17位获取正确的第18位
@property(nonatomic, readonly) NSString *zc_validVerificationCode;




/// 根据正则获取匹配内容
@property(nonatomic, readonly) NSArray<NSTextCheckingResult *> *(^zc_getMatchingForRegular)(NSString *regularRegex);
@property(nonatomic, readonly) NSArray<NSString *> *(^zc_getOneMatchingForRegular)(NSString *regularRegex);


@end
