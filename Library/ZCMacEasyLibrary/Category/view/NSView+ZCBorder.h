//
//  NSView+ZCBorder.h
//  ZCMacEasyLibrary
//
//  Created by zac on 2018/7/3.
//  Copyright © 2018年 zac. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSView (ZCBorder)

- (void)zc_addBorderWithRadius:(float)radius borderWidth:(float)borderWidth borderColor:(NSColor *)borderColor;

@end
