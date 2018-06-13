//
//  ZCPicturePreviewItem.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2018/5/13.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 图片浏览 item
@interface ZCPicturePreviewItem : UIScrollView

/// 当前预览的图片下标
@property(nonatomic, readonly) NSUInteger zc_index;

/// 页面ImageView
@property(nonatomic, readonly) UIImageView *zc_imgView;

@property(nonatomic, assign)   BOOL zc_loadding;

- (void)viewDidAppear;
- (void)viewDidDisappear;

@end
