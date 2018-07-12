//
//  ZCTabBarItem.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/29.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCTabBarItem.h"

@implementation ZCTabBarItem

- (void)zc_setTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    [self zc_setTitle:title image:image selectedImage:selectedImage selectedTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.34 green:0.63 blue:0.93 alpha:1.00]}];
}

- (void)zc_setTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage selectedTitleTextAttributes:(NSDictionary<NSAttributedStringKey,id> *)selectedTitleTextAttributes {
    self.title = title;
    self.image = image;
    if(selectedImage) {
        self.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    [self setTitleTextAttributes:selectedTitleTextAttributes forState:UIControlStateSelected];
}

@end
