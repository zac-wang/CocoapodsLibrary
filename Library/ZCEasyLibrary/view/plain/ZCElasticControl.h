//
//  ZCElasticControl.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/12.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 弹出页面
@interface ZCElasticControl : UIControl

@property(nonatomic, strong) UIView *zc_backView;
@property(nonatomic, assign) CGRect zc_bodyFrame;

@property(nonatomic, readonly) UIView *(^zc_newLineView)(CGRect frame);

- (void)zc_showView;
- (void)zc_showView:(double)duration;

- (void)zc_hiddenView;
- (void)zc_hiddenView:(double)duration completion:(void (^)(BOOL finished))completion;

@end
