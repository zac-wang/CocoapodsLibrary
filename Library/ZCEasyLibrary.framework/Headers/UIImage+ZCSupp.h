//
//  UIImage+ZCSupp.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/1.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZCSupp)

+ (UIImage *)zc_imageWithColor:(UIColor *)color;

+ (UIImage *)zc_imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)zc_imageWithImageStream:(CVImageBufferRef)imageBuffer;

@end
