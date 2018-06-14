//
//  UIView+ZCConvert.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/24.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UIView+ZCConvert.h"

@implementation UIView (ZCConvert)

- (CGRect)zc_convertView:(UIView *)view {
    CGRect rc = [view convertRect:view.bounds toView:self];
    return rc;
}

@end
