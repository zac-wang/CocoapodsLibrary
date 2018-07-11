//
//  NSView+ZCBackgroundColor.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/3.
//  Copyright © 2018年 love_iphone@qq.com. All rights reserved.
//

#import "NSView+ZCBackgroundColor.h"

@implementation NSView (ZCBackgroundColor)
@dynamic zc_backgroundColor;

- (void)setZc_backgroundColor:(NSColor *)backgroundColor {
    CALayer *viewLayer = [CALayer layer];
    [viewLayer setBackgroundColor:backgroundColor.CGColor];
    [self setWantsLayer:YES];
    [self setLayer:viewLayer];
}

@end
