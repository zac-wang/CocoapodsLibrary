//
//  UIResponder+ZCGetNextResponderObj.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/10.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UIResponder+ZCGetNextResponderObj.h"

@implementation UIResponder (ZCGetNextResponderObj)

- (id)getNextResponderForClass:(Class)_class {
    UIResponder *target = self;
    while (target) {
        target = target.nextResponder;
        if ([target isKindOfClass:_class]) {
            return target;
        }
    }
    return target;
}

@end
