//
//  ZCTextDecimalField.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/18.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCTextDecimalField.h"

@interface ZCTextField()
- (void)textFieldDidChange:(UITextField *)textField;
@end

@interface ZCTextDecimalField() {
    /// 用户要保留的小数位数，即zc_decimalLength
    NSNumber *zc_decimalLengthNumber;
}
@end

@implementation ZCTextDecimalField
@synthesize zc_isMinus;
@synthesize zc_integerLength;
@synthesize zc_decimalLength;

/// 是否允许负数，默认只允许正数
- (void)setZc_isMinus:(BOOL)isMinus {
    zc_isMinus = isMinus;
    if (@available(iOS 11.0, *)) {
        self.smartDashesType = UITextSmartDashesTypeNo;
    }
    [self textFieldDidChange:self];
}

/// 整数部分 最大长度，默认12位
- (NSUInteger)zc_integerLength {
    return zc_integerLength <= 0 ? 12 : zc_integerLength;
}

- (void)setZc_integerLength:(NSUInteger)integerLength {
    zc_integerLength = integerLength;
    [self textFieldDidChange:self];
}

/// 保留小数点后几位，默认两位小数
- (NSUInteger)zc_decimalLength {
    return zc_decimalLengthNumber != nil ? zc_decimalLengthNumber.unsignedIntegerValue : 2;
}

- (void)setZc_decimalLength:(NSUInteger)decimalLength {
    zc_decimalLengthNumber = @(decimalLength);
    [self textFieldDidChange:self];
}

/// text发生变化
- (void)textFieldDidChange:(UITextField *)textField {
    [super textFieldDidChange:textField];
    
    NSString *newText = [self zc_changeTextFieldNumber:self.text];
    if (![newText isEqualToString:self.text]) {
        self.text = newText;
    }
}

- (NSString *)zc_changeTextFieldNumber:(NSString *)text {
    if (!text.length) {
        return text;
    }
    
    // 1、字符串 不允许出现 非数字、小数点 以外的字符, 除开头外不允许出现减号
    NSMutableString *newText = [NSMutableString string];
    for (int i = 0; i < text.length; i++) {
        unichar single = [text characterAtIndex:i];
        if ((single >= '0' && single <= '9') || single == '.') {
            [newText appendFormat:@"%c", single];
        }
    }
    
    // 2、开头不能是 小数点
    for (int i = 0; i < newText.length; i++) {
        if([newText characterAtIndex:0] == '.') {
            [newText deleteCharactersInRange:NSMakeRange(0, 1)];
        } else {
            break;
        }
    }
    
    // 3、开头不能是 0（字符串有两个以上字符 且 第二个字符不是小数点的情况下）
    for (int i = 0; i < (int)newText.length - 1; i++) {
        if([newText characterAtIndex:0] == '0' && [newText characterAtIndex:1] != '.') {
            [newText deleteCharactersInRange:NSMakeRange(0, 1)];
        } else {
            break;
        }
    }
    
    // 4、不能存在两个小数点
    NSRange pointRange = [newText rangeOfString:@"."];
    if(pointRange.location != NSNotFound) {//已存在小数点，忽略后面
        NSUInteger start = pointRange.location+pointRange.length;
        NSRange rane = NSMakeRange(start, newText.length - start);
        [newText replaceOccurrencesOfString:@"." withString:@"" options:NSLiteralSearch range:rane];
    }
            
    // 5、限制整数位、小数位长度
    NSArray *numArr = [newText componentsSeparatedByString:@"."];
    NSString *integerString = numArr.firstObject;
    NSString *decimalString = numArr.count > 1 ? numArr[1] : @"";
    if (integerString.length > self.zc_integerLength) {
        integerString = [integerString substringToIndex:self.zc_integerLength];
    }
    if (decimalString.length > self.zc_decimalLength) {
        decimalString = [decimalString substringToIndex:self.zc_decimalLength];
    }
    if (numArr.count > 1) {
        newText = [NSMutableString stringWithFormat:@"%@.%@", integerString, decimalString];
    } else {
        newText = [NSMutableString stringWithFormat:@"%@", integerString];
    }
    
    // 6、是否可以为负数
    if ([text hasPrefix:@"-"] && self.zc_isMinus) {
        [newText insertString:@"-" atIndex:0];
    }
    return newText;
}

- (double)zc_textValue {
    return [self.text doubleValue];
}

@end
