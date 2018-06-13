//
//  UIView+ZCConvert.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/24.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZCConvert)

/// 获取 view 在当前视图中 的 相对frame
- (CGRect)zc_convertView:(UIView *)view;

@end
