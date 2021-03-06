//
//  UIView+ZCCornerRadius.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZCCornerRadius)

- (void)zc_drawCornerRadius:(double)radius;
- (void)zc_drawCornerRadius:(double)radius borderColor:(UIColor *)color;
- (void)zc_drawCornerRadius:(double)radius borderWidth:(double)width borderColor:(UIColor *)color;
/**
 *  设置部分圆角
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   圆角大小
 *  @param borderColor   边框线条颜色
 *  @param lineWidth    边框线条宽度
 */
- (CAShapeLayer *)zc_addRoundedCorners:(UIRectCorner)corners
                                 radii:(CGSize)radii
                           borderColor:(UIColor *)borderColor
                             lineWidth:(double)lineWidth;

/**
 *  设置部分圆角,可以设置虚线
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii            圆角大小
 *  @param borderColor      边框线条颜色
 *  @param lineWidth        边框线条宽度
 *  @param lineDashPattern  虚线样式
 */
- (CAShapeLayer *)zc_addRoundedCorners:(UIRectCorner)corners
                                 radii:(CGSize)radii
                           borderColor:(UIColor *)borderColor
                             lineWidth:(double)lineWidth
                       lineDashPattern:(NSArray *)lineDashPattern;

@end
