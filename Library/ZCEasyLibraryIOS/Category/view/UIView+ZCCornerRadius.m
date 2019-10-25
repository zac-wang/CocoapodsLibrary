//
//  UIView+ZCCornerRadius.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UIView+ZCCornerRadius.h"
#import "NSObject+ZCRuntime.h"

#define ZCRoundedCornersShapeLayerKey @"ZCRoundedCornersShapeLayerKey"

@interface ZCRoundedCornersShapeLayer : CAShapeLayer
@end
@implementation ZCRoundedCornersShapeLayer
@end

@implementation UIView (ZCCornerRadius)

- (void)zc_drawCornerRadius:(double)radius {
    [self zc_drawCornerRadius:radius borderColor:[UIColor clearColor]];
}

- (void)zc_drawCornerRadius:(double)radius borderColor:(UIColor *)color {
    [self zc_drawCornerRadius:radius borderWidth:0.5 borderColor:color];
}

- (void)zc_drawCornerRadius:(double)radius borderWidth:(double)width borderColor:(UIColor *)color {
    [self initialRoundedCornersShapeLayer];
    
    self.layer.borderWidth = width;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderColor = (color ?: [UIColor clearColor]).CGColor;
    //self.layer.shouldRasterize = YES;
}

- (CAShapeLayer *)zc_addRoundedCorners:(UIRectCorner)corners
                                 radii:(CGSize)radii
                           borderColor:(UIColor *)borderColor
                             lineWidth:(double)lineWidth {
    return [self zc_addRoundedCorners:corners radii:radii borderColor:borderColor lineWidth:lineWidth lineDashPattern:nil];
}

- (CAShapeLayer *)zc_addRoundedCorners:(UIRectCorner)corners
                                 radii:(CGSize)radii
                           borderColor:(UIColor *)borderColor
                             lineWidth:(double)lineWidth
                       lineDashPattern:(NSArray *)lineDashPattern {
    ZCRoundedCornersShapeLayer *shape = [self initialRoundedCornersShapeLayer];
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    rounded.lineCapStyle = kCGLineCapRound;         // 线条拐角
    rounded.lineJoinStyle = kCGLineCapRound;        // 终点处理
    shape.path = rounded.CGPath;
    shape.lineWidth = lineWidth;                    // 线条宽度
    shape.strokeColor = borderColor.CGColor;        // 线条颜色
    shape.lineJoin = kCALineJoinRound;          //线与线之间连接点的样式，此处以圆角为例
    if(lineDashPattern) {
        shape.lineDashPattern = lineDashPattern;          //虚线样式，第一个参数:每节线段的长度，第二个参数:每节线段之间的间距
    }
    shape.fillColor = [UIColor clearColor].CGColor;
    
    [self.layer insertSublayer:shape atIndex:0];
    
    
    ZCRoundedCornersShapeLayer *mask = [[ZCRoundedCornersShapeLayer alloc] init];
    mask.path = rounded.CGPath;
    self.layer.mask = mask;
    
    self.layer.masksToBounds = YES;
    return shape;
}

- (ZCRoundedCornersShapeLayer *)initialRoundedCornersShapeLayer {
    ZCRoundedCornersShapeLayer *shape = [self zc_dynamicValueForKey:ZCRoundedCornersShapeLayerKey];
    if(!shape) {
        shape = [[ZCRoundedCornersShapeLayer alloc] init];
        [self zc_setDynamicValue:shape forKey:ZCRoundedCornersShapeLayerKey];
    }else{
        [shape removeFromSuperlayer];
    }
    if([self.layer.mask isKindOfClass:[ZCRoundedCornersShapeLayer class]]) {
        self.layer.mask = nil;
    }
    return shape;
}

@end
