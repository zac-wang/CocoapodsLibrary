//
//  NSView+ZCBorder.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/3.
//  Copyright © 2018年 love_iphone@qq.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSView (ZCBorder)

- (void)zc_addBorderWithRadius:(float)radius borderWidth:(float)borderWidth borderColor:(NSColor *)borderColor;

@end
