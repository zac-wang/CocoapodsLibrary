//
//  UIImageView+ZCGif.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/12/4.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ZCGif) <CAAnimationDelegate>

/// 播放gif动画，设置gifName
@property(nonatomic, readwrite) IBInspectable NSString *zc_gifImageName;

/**
 播放gif动画

 @param gifPath gif图片地址
 @param repeatCount 重复次数, 0 表示无限
 */
- (void)zc_gifImagePath:(NSString *)gifPath repeatCount:(float)repeatCount;

/**
 播放gif动画

 @param gifPath gif图片地址
 @param repeatCount 重复次数, 0 表示无限
 @param calculationMode 重复次数, 0 表示无限
 */
- (void)zc_gifImagePath:(NSString *)gifPath repeatCount:(float)repeatCount calculationMode:(CAAnimationCalculationMode)calculationMode;

@end
