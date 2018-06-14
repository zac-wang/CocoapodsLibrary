//
//  UIImage+ZCColor.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/10.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZCColor)

/// 根据颜色创建图片
+ (UIImage *)zc_imageWithColor:(UIColor *)color;

/// 根据颜色、大小创建图片
+ (UIImage *)zc_imageWithColor:(UIColor *)color size:(CGSize)size;

@end
