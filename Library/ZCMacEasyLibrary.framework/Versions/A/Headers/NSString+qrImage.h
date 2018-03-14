//
//  NSString+qrImage.h
//  ZCAppleScript
//
//  Created by 王志超 on 2018/3/12.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface NSString (qrImage)

- (NSImage *)qrImageForSize:(CGSize)size;

@end
