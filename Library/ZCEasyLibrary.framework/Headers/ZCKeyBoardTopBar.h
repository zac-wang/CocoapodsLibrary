//
//  ZCKeyBoardTopBar.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2018/4/25.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZCKeyBoardTopBarStylePlain = 0,
    ZCKeyBoardTopBarStyleTextField = 1,
} ZCKeyBoardTopBarStyle;

@interface ZCKeyBoardTopBar : UIToolbar

+ (instancetype)shared;

@property(nonatomic, weak) UITextField *zc_textField;

@property(nonatomic, weak) UITextView *zc_textView;

@property(nonatomic, readonly) ZCKeyBoardTopBar *(^style)(ZCKeyBoardTopBarStyle style);

@end
