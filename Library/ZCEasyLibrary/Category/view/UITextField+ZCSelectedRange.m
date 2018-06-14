//
//  UITextField+ZCSelectedRange.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/25.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UITextField+ZCSelectedRange.h"

@implementation UITextField (ZCSelectedRange)

- (NSRange)zc_selectedRange{
    NSInteger location = [self offsetFromPosition:self.beginningOfDocument toPosition:self.selectedTextRange.start];
    NSInteger length = [self offsetFromPosition:self.selectedTextRange.start toPosition:self.selectedTextRange.end];
    return NSMakeRange(location, length);
}

- (void)setZc_selectedRange:(NSRange)selectedRange{
    UITextPosition *startPosition = [self positionFromPosition:self.beginningOfDocument offset:selectedRange.location];
    UITextPosition *endPosition = [self positionFromPosition:self.beginningOfDocument offset:selectedRange.location + selectedRange.length];
    UITextRange *selectedTextRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectedTextRange];
}

@end
