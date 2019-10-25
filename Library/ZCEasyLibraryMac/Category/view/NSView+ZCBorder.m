//
//  NSView+ZCBorder.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/3.
//  Copyright © 2018年 love_iphone@qq.com. All rights reserved.
//

#import "NSView+ZCBorder.h"

@implementation NSView (ZCBorder)

- (void)zc_addBorderWithRadius:(float)radius borderWidth:(float)borderWidth borderColor:(NSColor *)borderColor {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    self.translatesAutoresizingMaskIntoConstraints = NO;//用autolayout则设置NO
}

@end
