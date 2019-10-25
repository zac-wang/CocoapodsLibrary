//
//  UIView+ZCSubview.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/16.
//  Copyright © 2018年 zac. All rights reserved.
//

#import "UIView+ZCSubview.h"

@implementation UIView (ZCSubview)

- (void)zc_ergodicSubviews:(void (^)(UIView *))block {
    for (UIView *v in self.subviews) {
        block(v);
    }
}

- (void)zc_removeAllSubviews {
    [self zc_ergodicSubviews:^(UIView *v) {
        [v removeFromSuperview];
    }];
}

- (void)zc_removeAllSubviewsWithClass:(Class)viewClass {
    [self zc_ergodicSubviews:^(UIView *v) {
        if(viewClass && [v isKindOfClass:viewClass]) {
            [v removeFromSuperview];
        }
    }];
}

@end
