//
//  UIView+ZCConvert.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/24.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UIView+ZCConvert.h"

@implementation UIView (ZCConvert)

- (CGRect (^)(UIView *))zc_frameForView {
    return ^(UIView *view) {
        CGRect rc = [self convertRect:self.bounds toView:view];
        return rc;
    };
}

@end
