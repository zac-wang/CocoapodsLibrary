//
//  NSImage+compressed.m
//  WeChatIM
//
//  Created by wzc on 2019/7/4.
//  Copyright © 2019 wzc. All rights reserved.
//

#import "NSImage+compressed.h"

@implementation NSImage (compressed)

#pragma mark - 将图片按照比例压缩
//rate 压缩比0.1～1.0之间
- (NSData *)compressed:(CGFloat)rate {
    NSData *imgDt = [self TIFFRepresentation];
    if (!imgDt) {
        return nil;
    }
    
    NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepWithData:imgDt];
    NSMutableDictionary *imageProps = [NSMutableDictionary dictionary];
    imageProps[NSImageCompressionFactor] = @(rate);// 按照比例压缩
    imgDt = [imageRep representationUsingType:NSBitmapImageFileTypeJPEG properties:imageProps];
    
    return imgDt;
}

@end
