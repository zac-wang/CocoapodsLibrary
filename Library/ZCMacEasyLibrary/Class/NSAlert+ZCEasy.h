//
//  NSAlert+ZCEasy.h
//  MenuItem
//
//  Created by wangzhichao on 2016/11/21.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSAlert (ZCEasy)

+ (NSAlert *)zc_alertWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray *)buttons completionHandler:(void (^)(NSModalResponse returnCode))handler;

@end
