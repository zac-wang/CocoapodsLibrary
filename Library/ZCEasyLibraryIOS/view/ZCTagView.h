//
//  ZCTagView.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/21.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZCTagViewStyle) {
    /// 默认居左
    ZCTagViewStyleDefault  = 0,
    /// 分散
    ZCTagViewStyleDisperse = 1,
    /// 分散，出现单个tag则居中
    ZCTagViewStyleCenter   = 2
};

IB_DESIGNABLE

/// 标签
@interface ZCTagView : UIView

/// 标签 水平间距
@property(nonatomic, assign)  IBInspectable double zc_btnHorizontalGap;
/// 标签 垂直间距
@property(nonatomic, assign)  IBInspectable double zc_btnVerticalGap;
/// 标签 高度，默认15
@property(nonatomic, assign)  IBInspectable double zc_btnHeight;

/// 标签 分布类型
#if TARGET_INTERFACE_BUILDER
@property (nonatomic, assign) IBInspectable NSUInteger zc_tagStyle;
#else
@property(nonatomic, assign)  ZCTagViewStyle zc_tagStyle;
#endif

/// 设置标签名称数组
@property(nonatomic, strong)  NSArray<NSString *> *zc_tagTitles;




/// 标签控件数组
@property(nonatomic, readonly) NSArray<UIButton *> *zc_tagButtons;

/// 标签触发事件
@property(nonatomic, copy)     void(^zc_btnClickBlock)(UIButton *btn);

/// 获取当前高度
@property(nonatomic, readonly) double zc_viewHeight;

@end
