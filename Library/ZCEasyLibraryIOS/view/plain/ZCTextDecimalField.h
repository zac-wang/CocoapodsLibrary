//
//  ZCTextDecimalField.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/18.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCTextField.h"

IB_DESIGNABLE

//限制输入类型为小数，可限制小数位数
@interface ZCTextDecimalField : ZCTextField

/// 是否允许负数，默认只允许正数
@property(nonatomic, assign) IBInspectable BOOL zc_isMinus;

/// 整数部分 最大长度，默认12位
@property(nonatomic, assign) IBInspectable NSUInteger zc_integerLength;

/// 保留小数点后几位，默认两位小数
@property(nonatomic, assign) NSUInteger zc_decimalLength;

/// 得到text数值
@property(nonatomic, readonly) double zc_textValue;

@end
