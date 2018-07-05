//
//  NSView+ZCSupp.m
//  ZCAppleScript
//
//  Created by zac on 2018/3/12.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSView+ZCSupp.h"

@implementation NSView (ZCSupp)

- (void)zc_addSubviewWithMaxSize:(NSView *)view {
    [self addSubview:view];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    [self addConstraint:widthConstraint];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self addConstraint:heightConstraint];
}

@end
