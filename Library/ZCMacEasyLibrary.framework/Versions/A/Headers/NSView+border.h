//
//  NSView+border.h
//  ZCAppleScript
//
//  Created by 王志超 on 2018/3/5.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSView (border)

- (void)addBorderWithRadius:(float)radius borderWidth:(float)borderWidth borderColor:(NSColor *)borderColor;

@end
