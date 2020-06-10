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

/// 图片浏览（内部仅有三个UIImageView 进行左右切换，节省内存 不会因zc_imageCount图片数的增加而增加）
@interface ZCPicturePreview : UIScrollView

+ (instancetype)shared;

/// 界面导航栏（可以移除 自定义界面）
@property(nonatomic, readonly) ZCPicturePreviewHeadbar *zc_headBar;

/// 设置 预览 图片总个数
@property(nonatomic, assign)   NSUInteger zc_imageCount;

/// 获取 正在预览的图片下标
@property(nonatomic, readonly) NSUInteger zc_nowShowImgIndex;

/// 即将刷新，设置item.zc_imgView.image
@property(nonatomic, copy) void(^zc_willChangeBlock)(ZCPicturePreview *picturePreview, ZCPicturePreviewItem *item);

/// 刷新完成
@property(nonatomic, copy) void(^zc_didChangeBlock)(ZCPicturePreview *picturePreview, ZCPicturePreviewItem *item);

/// 删除事件
@property(nonatomic, copy) void(^zc_deleteImageBlock)(NSUInteger showImgIndex);

@end


@interface ZCPicturePreview (ZCAnimat)

/// 显示，图片view  当前图片下标 (用于切换至其他图片)
- (void)zc_showViewWithView:(UIView *)view index:(NSUInteger)index;
/// 显示， 当前图片下标 (用于切换至其他图片)
- (void)zc_showViewWithIndex:(NSUInteger)index;

/// 隐藏
- (void)zc_hiddenView;
/// 隐藏
- (void)zc_hiddenViewWithCGRect:(CGRect)rect;

@end
