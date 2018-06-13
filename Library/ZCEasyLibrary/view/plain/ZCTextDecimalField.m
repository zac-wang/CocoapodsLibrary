//
//  ZCTextDecimalField.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/18.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "ZCTextDecimalField.h"

@interface ZCTextField()
- (void)textFieldDidChange:(UITextField *)textField;
@end

@interface ZCTextDecimalField()
/// 用户是否修改过要保留的小数位数，即zc_decimalLength
@property(nonatomic, assign) BOOL zc_isUserChangeDecimalLength;
@end

@implementation ZCTextDecimalField
@synthesize zc_isMinus;
@synthesize zc_integerLength;
@synthesize zc_decimalLength;

- (void)setZc_isMinus:(BOOL)isMinus {
    zc_isMinus = isMinus;
    if (@available(iOS 11.0, *)) {
        self.smartDashesType = UITextSmartDashesTypeNo;
    }
}

- (int)zc_integerLength {
    return zc_integerLength <= 0 ? 12 : zc_integerLength;
}

- (int)zc_decimalLength {
    if(self.zc_isUserChangeDecimalLength) { // 用户是否修改过zc_decimalLength
        return zc_decimalLength;
    }else {
        return 2; // 默认保留两位小数
    }
}

- (void)setZc_decimalLength:(int)decimalLength {
    zc_decimalLength = decimalLength;
    self.zc_isUserChangeDecimalLength = YES;
}

- (void)textFieldDidChange:(UITextField *)textField {
    [super textFieldDidChange:textField];
    
    self.text = [self zc_changeTextFieldNumber:self.text];
}

- (NSString *)zc_changeTextFieldNumber:(NSString *)text {
    //是否可以为负数
    if(self.zc_isMinus && [text isEqualToString:@"-"]) {
        return text;
    }
    
    if(text.length) {
        BOOL isMinus = self.zc_isMinus && [text hasPrefix:@"-"];
        if(isMinus) {
            text = [text substringFromIndex:1];
        }
        
        NSMutableString *string = [NSMutableString string];
        // 去除 非数字、非小数点 字符
        for (int i = 0; i < text.length; i++) {
            unichar single = [text characterAtIndex:i];
            if ((single < '0' || single > '9') && single != '.') {
                break;
            }
            
            
            if(string.length == 0) {
                if(single == '.') { // 开头不能是 小数点
                    continue;
                }
            }else if(string.length == 1) {
                // 第一个字符不能是 0（第二个字符不是小数点的情况下）
                if([string characterAtIndex:0] == '0') {
                    if(single != '.') {
                        [string deleteCharactersInRange:NSMakeRange(0, 1)];
                    }
                }
            }
            
            // 不能存在两个小数点
            if(single == '.') {
                NSRange range = [string rangeOfString:@"."];
                if(range.location != NSNotFound) {//已存在小数点，忽略后面
                    break;
                }
            }
            
            [string appendFormat:@"%c", single];
        }
        
        NSUInteger integerLength = string.length;
        // 小数点后留n位
        NSRange range = [string rangeOfString:@"."];
        if(range.location != NSNotFound) {
            NSUInteger maxLength = range.location + (self.zc_decimalLength <= 0 ? 0 : 1) + self.zc_decimalLength;
            if(string.length > maxLength) {
                NSRange deleteRange = NSMakeRange(maxLength, string.length - maxLength);
                [string deleteCharactersInRange:deleteRange];
            }
            integerLength = range.location;
        }
        // 限制整数部分 最大长度
        if(self.zc_integerLength < integerLength) {
            NSRange deleteRange = NSMakeRange(self.zc_integerLength, string.length - self.zc_integerLength);
            [string deleteCharactersInRange:deleteRange];
        }
        
        NSString *head = isMinus ? @"-" : @"";
        NSString *result = [NSString stringWithFormat:@"%@%@", head, string.length ? string : @"0"];
        return result;
    }
    return text;
}

- (double)zc_textValue {
    return [self.text doubleValue];
}

@end
