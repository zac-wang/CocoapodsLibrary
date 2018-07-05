//
//  ZCMenuItem.m
//  MenuItem
//
//  Created by zac on 2018/6/21.
//  Copyright © 2018年 wangzhichao. All rights reserved.
//

#import "ZCMenuItem.h"

@interface ZCMenuItem()

@property(nonatomic, copy) MenuItemBlock menuItemBlock;

@end

@implementation ZCMenuItem

- (instancetype)initWithTitle:(NSString *)string block:(MenuItemBlock)block {
    return [self initWithTitle:string keyEquivalent:@"" block:block];
}

- (instancetype)initWithTitle:(NSString *)string keyEquivalent:(NSString *)charCode block:(MenuItemBlock)block {
    self = [super initWithTitle:string action:@selector(clickMe:) keyEquivalent:charCode];
    if (self) {
        self.menuItemBlock = block;
        self.target = self;
    }
    return self;
}

- (void)clickMe:(NSMenuItem *)item {
    if(self.menuItemBlock)
        self.menuItemBlock(item);
}

@end
