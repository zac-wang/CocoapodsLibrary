//
//  ZCBannerView.h
//  ZCBannerViewDemo
//
//  Created by 王志超 on 2017/10/10.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCBannerView : UIScrollView

@property(nonatomic, strong) UIPageControl *pageControl;

/**
 初始化（方法一）
 例：[banerScrollView initBanner:[[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:@"main_banner.bundle"]];

 @param fileUrlArray 图片地址数组
 */
- (void)zc_initBanner:(NSArray *)fileUrlArray;

/**
 初始化（方法二）

 @param count 图片个数
 @param block 回调imageView、标号，来设置图片，可用于网络图片等
 */
- (void)zc_initBannerWithCount:(NSInteger)count imageViewBlock:(void(^)(UIImageView *imageView, int num))block;

/// 滚动间隔时间，默认3秒
@property(nonatomic, assign) int zc_timeInterval;

/// YES:单个页面不滚动，默认NO
@property(nonatomic, assign) BOOL zc_oneImageNotRolling;

/// 选择图片后的事件
@property(nonatomic, copy) void(^zc_selectImageView)(UIImageView *imgView, NSInteger index);

/// 开始滚动
- (void)zc_start;
/// 停止滚动
- (void)zc_stop;

@end
