//
//  ZCPicturePreviewItem.h
//  CocoapodsLibrary
//
//  Created by zac on 2018/5/13.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 图片浏览 item
@interface ZCPicturePreviewItem : UIScrollView

/// 当前预览的图片下标
@property(nonatomic, readonly) NSUInteger zc_index;

/// 页面ImageView
@property(nonatomic, readonly) UIImageView *zc_imgView;

@property(nonatomic, assign)   BOOL zc_loadding;

- (void)zc_viewDidAppear;
- (void)zc_viewDidDisappear;

@end
