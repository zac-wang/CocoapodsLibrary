//
//  UITextField+ZCKeyBoardTopBar.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2018/4/25.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "UITextField+ZCKeyBoardTopBar.h"

@implementation UITextField (ZCKeyBoardTopBar)
@dynamic zc_keyBoardTopBar;

- (void)setZc_keyBoardTopBar:(ZCKeyBoardTopBar *)zc_keyBoardTopBar {
    zc_keyBoardTopBar.zc_textField = self;
}

@end
