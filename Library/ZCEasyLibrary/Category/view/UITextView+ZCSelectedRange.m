//
//  UITextView+ZCSelectedRange.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/4/25.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "UITextView+ZCSelectedRange.h"

@implementation UITextView (ZCSelectedRange)

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
