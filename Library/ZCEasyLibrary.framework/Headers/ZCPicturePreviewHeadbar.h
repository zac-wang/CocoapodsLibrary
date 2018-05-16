//
//  ZCPicturePreviewHeadbar.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/16.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCPicturePreviewHeadbar : UIToolbar

@property(nonatomic, strong) UIBarButtonItem *leftItem;

@property(nonatomic, strong) UIBarButtonItem *pageItem;

@property(nonatomic, strong) UIBarButtonItem *deleteItem;

@property(nonatomic, copy) void(^deleteImageBlock)(void);

@end
