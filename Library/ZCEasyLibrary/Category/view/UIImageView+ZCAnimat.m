//
//  UIImageView+ZCAnimat.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/4/23.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "UIImageView+ZCAnimat.h"

@implementation UIImageView (ZCAnimat)

- (void)zc_animatWithImages:(NSArray<UIImage *> *)images duration:(NSTimeInterval)duration repeatCount:(NSInteger)count {
    if(count == 0) {
        count = CGFLOAT_MAX;
    }
    
    self.animationImages = images;//图片数组
    self.animationDuration = duration;//执行一次完整动画的时长
    self.animationRepeatCount = count;//动画重复次数 （0为重复播放）
    [self startAnimating];//开始动画
    //[self stopAnimating];//停止动画
    //NSLog(@"%@播放动画", self.isAnimating? @"正在" : @"尚未");
}

@end
