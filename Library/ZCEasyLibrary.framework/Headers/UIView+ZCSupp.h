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

///遍历子view
- (void)zc_ergodicSubviews:(void(^)(UIView *v))block;

/**
 阴影

 @param shadowColor 阴影颜色
 @param shadowOffset 阴影偏移量
 @param shadowOpacity 阴影不透明度
 */
- (void)zc_shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowOpacity:(float)shadowOpacity;

/**
 添加渐变色

 @param colors 颜色数组
 @param startPoint 渐变色的开始位置
 @param endPoint 渐变色的结束位置
 @param locations 颜色区间数组（元素类型为NSNumber(float)，开始为0，结束为1）
 @return layer对象
 */
- (CAGradientLayer *)zc_setBackgroundColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint locations:(NSArray *)locations;


- (void)zc_addFrameSizeChangeEvent:(void (^)(UIView *))zc_addFrameSizeChangeEvent;
- (void)zc_removeFrameSizeChangeEvent;

@end
