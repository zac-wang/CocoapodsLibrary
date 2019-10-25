//
//  UIView+ZCSubview.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/16.
//  Copyright © 2018年 zac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZCSubview)

///遍历子view
- (void)zc_ergodicSubviews:(void(^)(UIView *v))block;

///删除子view，UIScrollView等 慎重使用
@property(nonatomic, readonly) void zc_removeAllSubviews;
///删除指定类型的子view
- (void)zc_removeAllSubviewsWithClass:(Class)viewClass;

@end
