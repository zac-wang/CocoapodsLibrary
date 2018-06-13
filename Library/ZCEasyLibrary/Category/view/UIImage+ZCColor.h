//
//  UIImage+ZCColor.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/10.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZCColor)

/// 根据颜色创建图片
+ (UIImage *)zc_imageWithColor:(UIColor *)color;

/// 根据颜色、大小创建图片
+ (UIImage *)zc_imageWithColor:(UIColor *)color size:(CGSize)size;

@end
