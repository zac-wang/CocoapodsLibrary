//
//  UIImageView+ZCGif.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/12/4.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ZCGif) <CAAnimationDelegate>

/**
 播放gif动画

 @param gifPath gif图片地址
 @param repeatCount 重复次数, 0 表示无限
 */
- (void)zc_gifImage:(NSString *)gifPath repeatCount:(float)repeatCount;

@end