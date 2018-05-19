//
//  ZCTextDecimalField.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/18.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "ZCTextField.h"

//限制输入类型为小数，可限制小数位数
@interface ZCTextDecimalField : ZCTextField

/// 是否允许负数，默认只允许正数
@property(nonatomic, assign) BOOL zc_isMinus;

/// 整数部分 最大长度，默认12位
@property(nonatomic, assign) int zc_integerLength;

/// 保留小数点后几位，默认两位小数
@property(nonatomic, assign) int zc_decimalLength;

/// 得到text数值
@property(nonatomic, readonly) double zc_textValue;

@end
