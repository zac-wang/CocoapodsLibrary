//
//  UIImageView+ZCAnimat.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/4/23.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ZCAnimat)

/**
 播放动画
 stopAnimating //停止动画
 
 @param images 动画图片数组
 @param duration 执行一次完整动画的时长
 @param count 动画重复次数
 */
- (void)zc_animatWithImages:(NSArray<UIImage *> *)images duration:(NSTimeInterval)duration repeatCount:(NSInteger)count;

@end
