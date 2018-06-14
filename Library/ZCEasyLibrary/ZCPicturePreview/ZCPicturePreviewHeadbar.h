//
//  ZCPicturePreviewHeadbar.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/16.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 图片浏览导航栏
@interface ZCPicturePreviewHeadbar : UIToolbar

@property(nonatomic, strong) UIBarButtonItem *zc_leftItem;

@property(nonatomic, strong) UIBarButtonItem *zc_pageItem;

@property(nonatomic, strong) UIBarButtonItem *zc_deleteItem;

- (void)zc_hiddenDeleteItem;

- (void)zc_pageNum:(NSUInteger)pageNum totalNum:(NSUInteger)totalNum;

@property(nonatomic, copy) void(^zc_deleteImageBlock)(void);

@end
