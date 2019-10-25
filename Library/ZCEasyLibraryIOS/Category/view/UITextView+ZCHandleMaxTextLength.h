//
//  UITextView+ZCHandleMaxTextLength.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/9.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (ZCHandleMaxTextLength)

/// 设置最大长度
- (void)zc_handleMaxTextLengthWithLength:(int)textMaxLength;

@end
