//
//  NSString+ZCFile.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/3/27.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "NSString+ZCFile.h"

#if TARGET_OS_IPHONE
#import <MobileCoreServices/MobileCoreServices.h>
#elif TARGET_OS_MAC
#endif

@implementation NSString (ZCFile)

- (NSString *)zc_mimeType {
    NSString *extension = [self pathExtension];
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (CFStringRef)CFBridgingRetain(extension), NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassMIMEType);
    return (__bridge NSString *)MIMEType;
}

@end
