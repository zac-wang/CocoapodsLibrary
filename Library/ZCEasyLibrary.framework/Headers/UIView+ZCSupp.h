//
//  UIView+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/22.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZCSupp)

///删除子view，UIScrollView等 慎重使用
@property(nonatomic, readonly) void zc_removeAllSubviews;
///删除指定类型的子view
- (void)zc_removeAllSubviewsWithClass:(Class)viewClass;

- (void)zc_addFrameSizeChangeEvent:(void (^)(UIView *))zc_addFrameSizeChangeEvent;
- (void)zc_removeFrameSizeChangeEvent;

- (CAGradientLayer *)zc_setBackgroundColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint locations:(NSArray *)locations;

@end
