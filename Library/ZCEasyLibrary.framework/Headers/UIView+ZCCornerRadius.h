//
//  UIView+ZCCornerRadius.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZCCornerRadius)

- (void)zc_drawCornerRadius:(int)radius;
- (void)zc_drawCornerRadius:(int)radius borderColor:(UIColor *)color;
- (void)zc_drawCornerRadius:(int)radius borderWidth:(int)width borderColor:(UIColor *)color;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   圆角大小
 *  @param borderColor   边框线条颜色
 *  @param lineWidth    边框线条宽度
 */
- (CAShapeLayer *)zc_addRoundedCorners:(UIRectCorner)corners
                                 radii:(CGSize)radii
                           borderColor:(UIColor *)borderColor
                             lineWidth:(float)lineWidth;

@end
