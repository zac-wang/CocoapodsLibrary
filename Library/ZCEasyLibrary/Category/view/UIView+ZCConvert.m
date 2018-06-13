//
//  UIView+ZCConvert.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/24.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "UIView+ZCConvert.h"

@implementation UIView (ZCConvert)

- (CGRect)zc_convertView:(UIView *)view {
    CGRect rc = [view convertRect:view.bounds toView:self];
    return rc;
}

@end
