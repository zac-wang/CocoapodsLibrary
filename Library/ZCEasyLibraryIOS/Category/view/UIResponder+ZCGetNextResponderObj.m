//
//  UIResponder+ZCGetNextResponderObj.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/10.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UIResponder+ZCGetNextResponderObj.h"

@implementation UIResponder (ZCGetNextResponderObj)

- (id (^)(__unsafe_unretained Class))zc_getNextResponderForClass {
    return ^(Class className) {
        UIResponder *target = self;
        while (target) {
            target = target.nextResponder;
            if ([target isKindOfClass:className]) {
                return target;
            }
        }
        return target;
    };
}

@end
