//
//  UIViewController+emptyData.h
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/6/15.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (emptyData)

@property(nonatomic, assign)   CGRect emptyDataFrame;
- (void)initialEmptyDataViewWithView:(UIView *)view;

/**
 设置显示空数据页面
 */
@property(nonatomic, assign)   BOOL showEmptyData;

/**
 设置空页面显示的文字
 
 @param title 标题
 @param buttonTitle 按钮文字
 */
- (void)setEmptyDataTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle;

/**
 当数据为空时
 
 @param btn btn
 */
- (void)emptyDataEvent:(UIButton *)btn;

@end
