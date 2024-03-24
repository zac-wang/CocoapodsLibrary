//
//  NSAlert+ZCEasy.h
//  ZCEasyLibrary
//
//  Created by zac on 2016/11/21.
//  Copyright © 2016年 love_iphone@qq.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSAlert (ZCEasy)

+ (NSAlert *)zc_showAlertWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray *)buttons completionHandler:(void (^)(NSModalResponse returnCode))handler;

+ (NSAlert *)zc_showAlertWithTitle:(NSString *)title message:(NSString *)message view:(NSView *)v buttons:(NSArray *)buttons completionHandler:(void (^ __nullable)(NSModalResponse returnCode))handler;

+ (NSAlert *)zc_alertWithTitle:(NSString *)title message:(NSString *)message view:(NSView *)v buttons:(NSArray *)buttons;

@end
