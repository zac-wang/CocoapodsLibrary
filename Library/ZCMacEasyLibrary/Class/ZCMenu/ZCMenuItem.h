//
//  ZCMenuItem.h
//  MenuItem
//
//  Created by zac on 2018/6/21.
//  Copyright © 2018年 wangzhichao. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef void (^MenuItemBlock)(NSMenuItem * _Nonnull);

@interface ZCMenuItem : NSMenuItem

- (instancetype)initWithTitle:(NSString *)string block:(MenuItemBlock)block;
- (instancetype)initWithTitle:(NSString *)string keyEquivalent:(NSString *)charCode block:(MenuItemBlock)block;

@end
