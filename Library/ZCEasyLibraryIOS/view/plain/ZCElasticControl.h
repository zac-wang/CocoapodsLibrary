//
//  ZCElasticControl.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/12.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZCElasticControlTopToolBarStyle) {
    ZCElasticControlTopToolBarStyleNone = 0,
    ZCElasticControlTopToolBarStyleOkAndCancel = 1
};

/// 弹出页面
@interface ZCElasticControl : UIControl {
    /// view顶栏按钮样式，仅自定义控件调用
    ZCElasticControlTopToolBarStyle zc_topToolBarStyle;
}

@property(nonatomic, readonly) UIView *zc_contentView;

/// 初始化view，子类继承重写
- (void)initView;


- (void)zc_showView;
- (void)zc_showView:(double)duration;

- (void)zc_hiddenView;
- (void)zc_hiddenView:(double)duration completion:(void (^)(BOOL finished))completion;

@end
