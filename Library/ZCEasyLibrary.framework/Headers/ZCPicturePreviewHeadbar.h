//
//  ZCPicturePreviewHeadbar.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/16.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCPicturePreviewHeadbar : UIToolbar

@property(nonatomic, strong) UIBarButtonItem *zc_leftItem;

@property(nonatomic, strong) UIBarButtonItem *zc_pageItem;

@property(nonatomic, strong) UIBarButtonItem *zc_deleteItem;


- (void)zc_pageNum:(NSUInteger)pageNum totalNum:(NSUInteger)totalNum;

@property(nonatomic, copy) void(^zc_deleteImageBlock)(void);

@end
