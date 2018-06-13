//
//  CALayer+ZCSupp.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/30.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "CALayer+ZCSupp.h"
#import <UIKit/UIColor.h>

@implementation CALayer (ZCSupp)
@dynamic zc_borderColor;

- (void)setZc_borderColor:(UIColor *)_color_ {
    self.borderColor = _color_.CGColor;
}

@end
