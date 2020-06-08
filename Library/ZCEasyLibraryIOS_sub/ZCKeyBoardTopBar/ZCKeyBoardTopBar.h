//
//  ZCKeyBoardTopBar.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/25.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    /// 只有取消按钮
    ZCKeyBoardTopBarStylePlain = 0,
    /// 有输入框、取消按钮
    ZCKeyBoardTopBarStyleTextField = 1,
} ZCKeyBoardTopBarStyle;

@interface ZCKeyBoardTopBar : UIToolbar

+ (instancetype)shared;

/// 设置样式
@property(nonatomic, assign) ZCKeyBoardTopBarStyle zc_topBarStyle;

/// UITextField 或者 UITextView
@property(nonatomic, weak)   id<UITextInput, NSCoding> zc_textInputView;

@end
