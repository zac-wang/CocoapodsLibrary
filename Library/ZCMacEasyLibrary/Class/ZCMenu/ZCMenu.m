//
//  ZCMenuItem.m
//  ZCEasyLibrary
//
//  Created by zac on 16/11/6.
//  Copyright © 2016年 love_iphone@qq.com. All rights reserved.
//

#import "ZCMenu.h"

@implementation ZCMenu

- (ZCMenuItem *)zc_addItemWithTitle:(NSString *)aString block:(MenuItemBlock)block {
    return [self zc_addItemWithTitle:aString keyEquivalent:@"" block:block];
}

- (ZCMenuItem *)zc_addItemWithTitle:(NSString *)aString keyEquivalent:(NSString *)charCode block:(MenuItemBlock)block {
    ZCMenuItem *item  = [[ZCMenuItem alloc] initWithTitle:aString keyEquivalent:charCode block:block];
    [self addItem:item];
    return item;
}

@end
