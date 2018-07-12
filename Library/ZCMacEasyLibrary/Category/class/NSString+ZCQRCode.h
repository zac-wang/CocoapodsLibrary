//
//  NSString+ZCQRCode.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/3.
//  Copyright © 2018年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface NSString (ZCQRCode)

- (NSImage *)zc_qrImageForSize:(CGSize)size;

@end
