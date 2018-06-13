//
//  UIColor+ZCSupp.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "UIColor+ZCSupp.h"

@implementation UIColor (ZCSupp)

- (UIColor *(^)(double))zc_alpha {
    return ^UIColor *(double alpha) {
        return [self colorWithAlphaComponent:alpha];
    };
}

@end
