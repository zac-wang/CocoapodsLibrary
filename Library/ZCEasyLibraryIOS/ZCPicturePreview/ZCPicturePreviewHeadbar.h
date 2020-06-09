//
//  ZCPicturePreviewHeadbar.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/16.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 图片浏览导航栏
@interface ZCPicturePreviewHeadbar : UINavigationBar

/// 显示deleteButton
- (void)zc_showDeleteItem;

/// 设置标题
@property(nonatomic, readwrite) NSString *zc_title;

@end
