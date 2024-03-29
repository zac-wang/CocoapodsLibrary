//
//  NSAlert+ZCEasy.m
//  ZCEasyLibrary
//
//  Created by zac on 2016/11/21.
//  Copyright © 2016年 love_iphone@qq.com. All rights reserved.
//

#import "NSAlert+ZCEasy.h"

@implementation NSAlert (ZCEasy)

+ (NSAlert *)zc_showAlertWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray *)buttons completionHandler:(void (^ __nullable)(NSModalResponse returnCode))handler {
    return [self zc_showAlertWithTitle:title message:message view:nil buttons:buttons completionHandler:handler];
}

+ (NSAlert *)zc_showAlertWithTitle:(NSString *)title message:(NSString *)message view:(NSView *)v buttons:(NSArray *)buttons completionHandler:(void (^ __nullable)(NSModalResponse returnCode))handler {
    NSAlert *alert = [self zc_alertWithTitle:title message:message view:v buttons:buttons];
    [[NSRunningApplication currentApplication] activateWithOptions:NSApplicationActivateIgnoringOtherApps];
    NSUInteger action = [alert runModal];
    if(handler)
        handler(action);
    return alert;
}

+ (NSAlert *)zc_alertWithTitle:(NSString *)title message:(NSString *)message view:(NSView *)v buttons:(NSArray *)buttons {
    NSAlert *alert = [[self alloc] init];
    [alert setMessageText:title];
    if (message) [alert setInformativeText:message];
    if (v) [alert setAccessoryView:v];
    for (NSString *btn in buttons) {
        [alert addButtonWithTitle:btn];
    }
    [alert setAlertStyle:NSAlertStyleWarning];
    return alert;
}

@end
