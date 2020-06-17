//
//  ZCScreenCapture.m
//  auth
//
//  Created by wzc on 2020/6/17.
//  Copyright © 2020 wzc. All rights reserved.
//

#import "ZCScreenCapture.h"
#import <AppKit/AppKit.h>

@implementation ZCScreenCapture

/// 是否有 屏幕录制权限
+ (BOOL)canRecordScreen {
    if (@available(macOS 10.15, *)) {
        CFArrayRef windowList = CGWindowListCopyWindowInfo(kCGWindowListOptionOnScreenOnly, kCGNullWindowID);
        NSUInteger numberOfWindows = CFArrayGetCount(windowList);
        NSUInteger numberOfWindowsWithName = 0;
        for (int idx = 0; idx < numberOfWindows; idx++) {
            NSDictionary *windowInfo = (NSDictionary *)CFArrayGetValueAtIndex(windowList, idx);
            NSString *windowName = windowInfo[(id)kCGWindowName];
            if (windowName) {
                numberOfWindowsWithName++;
            } else {
                //no kCGWindowName detected -> not enabled
                break; //breaking early, numberOfWindowsWithName not increased
            }

        }
        CFRelease(windowList);
        return numberOfWindows == numberOfWindowsWithName;
    }
    return YES;
}

/// 获取 屏幕录制权限
+ (void)requestScreenRecordingAuth {
    [self screenCaptureWithRect:CGRectMake(0, 0, 1, 1)];
}


/// 获取 整个屏幕截屏
+ (NSImage *)screenCapture {
    CGRect mainRect = CGDisplayBounds(CGMainDisplayID());
    return [self screenCaptureWithRect:mainRect];
}

/// 获取 指定位置屏幕截屏
+ (NSImage *)screenCaptureWithRect:(CGRect)rect {
    CGImageRef screenshot = CGWindowListCreateImage(rect,
                                                    kCGWindowListOptionOnScreenOnly,
                                                    kCGNullWindowID,
                                                    kCGWindowImageBestResolution | kCGWindowImageShouldBeOpaque);
    NSImage *image = [[NSImage alloc]initWithCGImage:screenshot size:NSZeroSize];
    CGImageRelease(screenshot);
    return image;
}

/// 获取指定窗口名的截屏
+ (NSImage *)screenCaptureWithWindowName:(NSString *)windowName {
    CFArrayRef windowListArray = CGWindowListCreate(kCGWindowListOptionOnScreenOnly, kCGNullWindowID);
    NSArray *windows = CFBridgingRelease(CGWindowListCreateDescriptionFromArray(windowListArray));
    CFRelease(windowListArray);
    for(NSMutableDictionary *dic in windows){
        NSString *layerStr = [dic objectForKey:(__bridge id)kCGWindowLayer];
        CGRect bounds;
        CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[dic objectForKey:@"kCGWindowBounds"], &bounds);
        NSRectFromCGRect(bounds);
        
        /// 目前桌面展示中 ，且有效的window
        if ([layerStr intValue] == 0 && (bounds.size.width> 10 && bounds.size.height > 10)) {
            int ownerPID = [[dic objectForKey:(__bridge id)kCGWindowNumber] intValue];
            //NSString *name =[dic objectForKey:(__bridge id)kCGWindowName];
            NSString *owerName = [dic objectForKey:(__bridge id)kCGWindowOwnerName];
            
            if ([owerName isEqualToString:windowName]) {
                CGImageRef imageRef = CGWindowListCreateImage(CGRectNull,  kCGWindowListOptionIncludingWindow, ownerPID, kCGWindowImageBoundsIgnoreFraming);
                NSImage *image = [[NSImage alloc]initWithCGImage:imageRef size:NSZeroSize];
                CGImageRelease(imageRef);
                return image;
            }
        }
    }
    return nil;
}

@end
