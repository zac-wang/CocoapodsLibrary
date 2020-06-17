//
//  ZCScreenCapture.h
//  auth
//
//  Created by wzc on 2020/6/17.
//  Copyright © 2020 wzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCScreenCapture : NSObject

/// 是否有 屏幕录制权限
+ (BOOL)canRecordScreen;

/// 获取 屏幕录制权限
+ (void)requestScreenRecordingAuth;


/// 获取 整个屏幕截屏
+ (NSImage *)screenCapture;

/// 获取 指定位置屏幕截屏
+ (NSImage *)screenCaptureWithRect:(CGRect)rect;

/// 获取指定窗口名的截屏
+ (NSImage *)screenCaptureWithWindowName:(NSString *)windowName;

@end
