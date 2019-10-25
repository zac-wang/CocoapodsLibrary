//
//  UIView+ZCSupp.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/22.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UIView+ZCSupp.h"
#import "NSObject+ZCRuntime.h"
//#import "ZCListenFrameSizeChange.h"

@implementation UIView (ZCSupp)

- (void)zc_shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowOpacity:(float)shadowOpacity {
    self.layer.shadowOffset = shadowOffset;
    if(shadowColor)
        self.layer.shadowColor = shadowColor.CGColor;
    if(shadowOpacity)
        self.layer.shadowOpacity = shadowOpacity;
}

#define ZCColor_GradientLayer @"ZCColor_GradientLayer"
- (CAGradientLayer *)zc_setBackgroundColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint locations:(NSArray *)locations {
    //colors = @[(__bridge id)[UIColor blueColor].CGColor, (__bridge id)[UIColor greenColor].CGColor];
    //startPoint = CGPointMake(0.0, 0.5);
    //endPoint = CGPointMake(1.0, 0.5);
    //locations = @[@(0.0), @(1.0)]
    //NSLog(@"%@", colors);
    CAGradientLayer *gradientLayer = (CAGradientLayer *)[self zc_dynamicValueForKey:ZCColor_GradientLayer];
    if(!gradientLayer) {
        gradientLayer = [CAGradientLayer layer];
        [self zc_setDynamicValue:gradientLayer forKey:ZCColor_GradientLayer];
    }
    [self.layer insertSublayer:gradientLayer atIndex:0];
    gradientLayer.frame = self.frame;
    if(colors && colors.count) {
        if([colors.firstObject isKindOfClass:[UIColor class]]) {
            NSMutableArray *_colors = [NSMutableArray array];
            for (UIColor *color in colors) {
                [_colors addObject:(__bridge id)color.CGColor];
            }
            gradientLayer.colors = _colors;
        }else{
            gradientLayer.colors = colors;
        }
        gradientLayer.startPoint = startPoint;
        gradientLayer.endPoint = endPoint;
        gradientLayer.locations = locations;
    }
    return gradientLayer;
}

//- (void)zc_addFrameSizeChangeEvent:(void (^)(UIView *))zc_addFrameSizeChangeEvent {
//    [[ZCListenFrameSizeChange shared] zc_addFrameSizeChangeEvent:zc_addFrameSizeChangeEvent forView:self];
//}
//
//- (void)zc_removeFrameSizeChangeEvent {
//    [[ZCListenFrameSizeChange shared] zc_removeFrameSizeChangeEventForView:self];
//}

@end
