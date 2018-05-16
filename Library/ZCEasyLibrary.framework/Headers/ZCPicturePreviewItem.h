//
//  ZCPicturePreviewItem.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2018/5/13.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCPicturePreviewItem : UIScrollView

/// 当前预览的图片下标
@property(nonatomic, readonly) NSUInteger zc_index;

/// 页面ImageView
@property(nonatomic, readonly) UIImageView *imgView;

@end
