//
//  NSString+ZCFile.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/3/27.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSString+ZCFile.h"

#if TARGET_OS_IPHONE
#import <MobileCoreServices/MobileCoreServices.h>
#elif TARGET_OS_MAC
#endif

@implementation NSString (ZCFile)

- (NSString *)zc_mimeType {
    CFStringRef extension = CFBridgingRetain(self.pathExtension);
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, extension, NULL);
    CFBridgingRelease(extension);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassMIMEType);
    CFBridgingRelease(UTI);
    return CFBridgingRelease(MIMEType);
}

@end
