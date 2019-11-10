//
//  UIView+ZCConvert.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/24.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZCConvert)

/// 获取 当前视图 在view坐标系中 的 相对frame
@property(nonatomic, readonly) CGRect(^zc_frameForView)(UIView *view);

@end
