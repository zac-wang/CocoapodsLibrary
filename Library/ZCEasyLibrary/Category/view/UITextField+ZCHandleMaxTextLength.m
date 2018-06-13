//
//  UITextField+ZCHandleMaxTextLength.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/9.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "UITextField+ZCHandleMaxTextLength.h"

@implementation UITextField (ZCHandleMaxTextLength)

#pragma mark - 设置文本最大长度
- (void)zc_handleMaxTextLengthWithLength:(int)textMaxLength {
    NSString *toBeString = self.text;
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    if (!position || !selectedRange)
    {
        if (toBeString.length > textMaxLength)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:textMaxLength];
            if (rangeIndex.length == 1) {
                self.text = [toBeString substringToIndex:textMaxLength];
            }else {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, textMaxLength)];
                self.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}

@end
