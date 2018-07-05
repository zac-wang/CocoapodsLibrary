//
//  NSAlert+ZCEasy.m
//  MenuItem
//
//  Created by wangzhichao on 2016/11/21.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import "NSAlert+ZCEasy.h"

@implementation NSAlert (ZCEasy)

+ (NSAlert *)zc_alertWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray *)buttons completionHandler:(void (^ __nullable)(NSModalResponse returnCode))handler {
    NSAlert *alert = [[NSAlert alloc] init];
    for (NSString *btn in buttons) {
        [alert addButtonWithTitle:btn];
    }
    [alert setMessageText:title];
    [alert setInformativeText:message];
    [alert setAlertStyle:NSAlertStyleWarning];
    NSUInteger action = [alert runModal];
    if(handler)
        handler(action);
    return alert;
}

@end
