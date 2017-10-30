//
//  UIViewController+settingBackBarButtonItem.h
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/4/17.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (xiaoaiStyle)

/**
 设置页面背景颜色
 */
- (void)setBackgroundColor;

/**
 设置返回按钮
 */
- (void)autoSetNavigationBackBarButton;

- (void)backToPreviousViewController:(UIBarButtonItem *)viewController ;
/**
 设置导航栏颜色
 */
- (void)autoSetNavigationBarColor;
- (void)setHomePageNavigationBarColor;
- (void)setSubPageNavigationBarColor;

- (UIImage *)createImageWithColor:(UIColor *)color;

@end
