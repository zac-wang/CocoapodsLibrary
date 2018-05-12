//
//  UITextView+ZCHandleMaxTextLength.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/9.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (ZCHandleMaxTextLength)

/// 设置最大长度
- (void)zc_handleMaxTextLengthWithLength:(int)textMaxLength;

@end
