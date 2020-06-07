//
//  ZCPicturePreview.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/12.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCPicturePreviewItem.h"
#import "ZCPicturePreviewHeadbar.h"

/// 图片浏览
@interface ZCPicturePreview : UIScrollView

+ (instancetype)shared;

/// 界面导航栏（可以移除 自定义界面）
@property(nonatomic, readonly) ZCPicturePreviewHeadbar *zc_headBar;

/// 设置 预览 图片总个数
@property(nonatomic, assign) NSUInteger zc_imageCount;

/// 获取 正在预览的图片下标
@property(nonatomic, readonly) NSUInteger zc_nowShowImgIndex;

/// 即将刷新，初始化界面
@property(nonatomic, copy) void(^zc_willChangeBlock)(ZCPicturePreview *picturePreview, ZCPicturePreviewItem *item);

/// 刷新，初始化界面
@property(nonatomic, copy) void(^zc_didChangeBlock)(ZCPicturePreview *picturePreview, ZCPicturePreviewItem *item);

@end


@interface ZCPicturePreview (ZCMonitorImageView)

/// 绑定 UIImageView 与 对应 预览下标
- (void)zc_monitorImageView:(UIImageView *)imgView index:(NSUInteger)index;

/// 绑定 UIView子类 与 对应 预览下标
- (void)zc_monitorView:(UIView *)view index:(NSUInteger)index;

@end


@interface ZCPicturePreview (ZCAnimat)

- (void)zc_showViewWithView:(UIView *)view;

- (void)zc_showViewWithView:(UIView *)view index:(NSUInteger)index;

- (void)zc_hiddenView;

- (void)zc_hiddenViewWithCGRect:(CGRect)rect;

@end