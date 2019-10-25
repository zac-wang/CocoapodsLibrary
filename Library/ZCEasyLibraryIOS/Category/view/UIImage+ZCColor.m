//
//  UIImage+ZCColor.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/10.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UIImage+ZCColor.h"

@implementation UIImage (ZCColor)

+ (UIImage *)zc_imageWithColor:(UIColor *)color {
    UIImage *theImage = [self zc_imageWithColor:color size:CGSizeMake(1.0f, 1.0f)];
    return theImage;
}

+ (UIImage *)zc_imageWithColor:(UIColor *)color size:(CGSize)size {
    if(!color) {
        color = [UIColor clearColor];
    }
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
