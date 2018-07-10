//
//  ZCKeyBoardTopBar.h
//  CocoapodsLibrary
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

@property(nonatomic, weak) UITextField *zc_textField;

@property(nonatomic, weak) UITextView *zc_textView;

@property(nonatomic, readonly) ZCKeyBoardTopBar *(^zc_style)(ZCKeyBoardTopBarStyle style);

@end
