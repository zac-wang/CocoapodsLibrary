//
//  ZCMenuItem.h
//  MenuItem
//
//  Created by zac on 16/11/6.
//  Copyright © 2016年 love_iphone@qq.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ZCMenuItem.h"


@interface ZCMenu : NSMenu

NS_ASSUME_NONNULL_BEGIN

- (ZCMenuItem *)zc_addItemWithTitle:(NSString *)aString block:(MenuItemBlock)block;

- (ZCMenuItem *)zc_addItemWithTitle:(NSString *)aString keyEquivalent:(NSString *)charCode block:(MenuItemBlock)block;

NS_ASSUME_NONNULL_END

@end
