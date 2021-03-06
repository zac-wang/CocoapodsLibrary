//
//  NSString+ZCRegularRegex.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZCRegularTimeStamp @"^[1-9]\\d*$"       //判断是否符合 存数字格式

@interface NSString (ZCRegularRegex)

/// 判断是否匹配正则
- (BOOL)zc_regular:(NSString *)regularRegex;

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

///银行卡号合法性
@property(nonatomic, readonly) BOOL zc_isBankCard;

/// 判断身份证格式有效
@property(nonatomic, readonly) BOOL zc_isIDCard;
/// 判断身份证格式有效(不验证时间)
@property(nonatomic, readonly) BOOL zc_isIDCardNoVerifTime;
/// 根据身份证前17位获取正确的第18位
@property(nonatomic, readonly) NSString *zc_validVerificationCodeForIDCard;
/// 根据身份证获取周岁年龄, 负数 则身份证号码不正确
@property(nonatomic, readonly) int zc_ageForIDCard;




/// 根据正则获取匹配内容
- (NSArray<NSTextCheckingResult *> *)zc_getMatchingForRegular:(NSString *)regularRegex;
- (NSArray<NSString *> *)zc_getOneMatchingForRegular:(NSString *)regularRegex;


@end
