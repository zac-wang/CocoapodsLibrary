//
//  UITextView+ZCKeyBoardTopBar.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/25.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UITextView+ZCKeyBoardTopBar.h"

@implementation UITextView (ZCKeyBoardTopBar)
@dynamic zc_keyBoardTopBar;

- (void)setZc_keyBoardTopBar:(ZCKeyBoardTopBar *)zc_keyBoardTopBar {
    zc_keyBoardTopBar.zc_textView = self;
}

@end
