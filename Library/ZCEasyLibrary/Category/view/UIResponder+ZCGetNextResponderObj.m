//
//  UIResponder+ZCGetNextResponderObj.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/10.
//  Copyright © 2018年 王志超. All rights reserved.
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
