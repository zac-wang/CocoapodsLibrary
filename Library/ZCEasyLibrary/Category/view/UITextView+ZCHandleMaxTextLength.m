//
//  UITextView+ZCHandleMaxTextLength.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/9.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UITextView+ZCHandleMaxTextLength.h"

@implementation UITextView (ZCHandleMaxTextLength)

#pragma mark - 设置最大长度
- (void)zc_handleMaxTextLengthWithLength:(int)textMaxLength {
    /**
     *  最大输入长度,中英文字符都按一个字符计算
     */
    NSString *toBeString = self.text;
    
    // 获取键盘输入模式
    NSString *lang = [[self textInputMode] primaryLanguage];
    
    // 中文输入的时候,可能有markedText(高亮选择的文字),需要判断这种状态
    // zh-Hans表示简体中文输入, 包括简体拼音，健体五笔，简体手写
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮选择部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，表明输入结束,则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > textMaxLength) {
                // 截取子串
                self.text = [toBeString substringToIndex:textMaxLength];
            }
        }else { // 有高亮选择的字符串，则暂不对文字进行统计和限制
        }
    } else {
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > textMaxLength) {
            // 截取子串
            self.text = [toBeString substringToIndex:textMaxLength];
        }
    }
}

@end
