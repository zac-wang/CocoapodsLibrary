//
//  UIColor+ZCSupp.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/23.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>


#define UIColorFromRGB(rgbValue) UIColorFromRGBAlpha(rgbValue, 1.0)
#define UIColorFromRGBAlpha(rgbValue, _alpha_) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:(_alpha_)]


#define ZCColorTypeControl UIColorFromRGBAlpha(0x000000, 0.6)



@interface UIColor (ZCSupp)

@property(nonatomic, readonly) UIColor *(^zc_alpha)(double);

@end
