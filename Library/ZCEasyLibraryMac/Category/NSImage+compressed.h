//
//  NSImage+compressed.h
//  WeChatIM
//
//  Created by wzc on 2019/7/4.
//  Copyright © 2019 wzc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (compressed)

- (NSData *)compressed:(CGFloat)rate;

@end
