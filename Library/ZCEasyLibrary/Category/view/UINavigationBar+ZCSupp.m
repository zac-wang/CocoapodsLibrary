//
//  UINavigationBar+ZCSupp.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/1.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "UINavigationBar+ZCSupp.h"

@implementation UINavigationBar (ZCSupp)
@dynamic zc_transparent;

- (void)setZc_transparent:(BOOL)zc_transparent {
    self.translucent = zc_transparent;
    if(zc_transparent) {
        UIImage *image = [UIImage new];
        [self setShadowImage:image];//导航栏下方的分割线
        [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
}

@end
