//
//  ZCTagView.h
//  CocoapodsLibrary
//
//  Created by zac on 2018/5/21.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZCTagViewStyle) {
    /// 默认居左
    ZCTagViewStyleDefault  = 0,
    /// 分散
    ZCTagViewStyleDisperse = 1,
    /// 分散，出现单个tag则居中
    ZCTagViewStyleCenter   = 2
};

/// 标签
@interface ZCTagView : UIView

/// 标签 水平间距
@property(nonatomic, assign) double zc_btnHorizontalGap;
/// 标签 垂直间距
@property(nonatomic, assign) double zc_btnVerticalGap;
/// 标签 高度，默认15
@property(nonatomic, assign) double zc_btnHeight;

/// 标签 分布类型
@property(nonatomic, assign) ZCTagViewStyle zc_tagStyle;

/// 设置标签名称数组
@property(nonatomic, strong) NSArray<NSString *> *zc_tagTitles;

/// 标签控件数组
@property(nonatomic, readonly) NSArray<UIButton *> *zc_tagButtons;

/// 标签触发事件
@property(nonatomic, copy) void(^zc_btnClickBlock)(UIButton *btn);

/// 获取当前高度
@property(nonatomic, assign) double zc_viewHeight;


/**
 排列标签位置

 @param tagViews 标签控件数组
 @param btnHorizontalGap 标签 水平间距
 @param btnVerticalGap 标签 垂直间距
 @param btnHeight 标签 高度
 */
+ (void)zc_tagViews:(NSArray<UIView *> *)tagViews btnHorizontalGap:(double)btnHorizontalGap btnVerticalGap:(double)btnVerticalGap btnHeight:(double)btnHeight;

/**
 排列标签位置

 @param tagViews 标签控件数组
 @param btnHorizontalGap 标签 水平间距
 @param btnVerticalGap 标签 垂直间距
 @param btnHeight 标签 高度
 @param isDisperse 标签 YES分散分布，NO居左
 */
+ (void)zc_tagViews:(NSArray<UIView *> *)tagViews btnHorizontalGap:(double)btnHorizontalGap btnVerticalGap:(double)btnVerticalGap btnHeight:(double)btnHeight isDisperse:(ZCTagViewStyle)isDisperse;

@end
