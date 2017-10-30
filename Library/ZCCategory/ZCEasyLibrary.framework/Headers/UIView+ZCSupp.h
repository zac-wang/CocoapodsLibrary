//
//  UIView+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/22.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZCSupp)

- (void)zc_drawCornerRadius:(int)radius;
- (void)zc_drawCornerRadius:(int)radius borderColor:(UIColor *)color;
- (void)zc_drawCornerRadius:(int)radius borderWidth:(int)width borderColor:(UIColor *)color;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)zc_addRoundedCorners:(UIRectCorner)corners
                   withRadii:(CGSize)radii
                 borderColor:(UIColor *)borderColor
                    viewRect:(CGRect)rect;

@end
