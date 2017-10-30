//
//  UIViewController+settingBackBarButtonItem.m
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/4/17.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import "UIViewController+xiaoaiStyle.h"
#import "UIColor+PY.h"

@implementation UIViewController (xiaoaiStyle)

#pragma mark - 页面背景颜色
- (void)setBackgroundColor {
    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
}

#pragma mark - 导航栏背景颜色
- (void)autoSetNavigationBarColor {
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    if(self.navigationController.viewControllers) {
        self.navigationController.navigationBar.translucent = NO;

        if(self.navigationController.viewControllers.firstObject != self)  {
            [self setSubPageNavigationBarColor];
        }else {
            [self setHomePageNavigationBarColor];
        }
    }
}

- (void)setHomePageNavigationBarColor {
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.24 alpha:1.00];
}

- (void)setSubPageNavigationBarColor {
//    UIImage *image = [self createImageWithColor:[UIColor colorWithHexString:@"357aeb"]];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.24 alpha:1.00];//[UIColor colorWithHexString:@"357aeb"];
}


/**
 设置返回按钮
 */
- (void)autoSetNavigationBackBarButton {
    if(!self.navigationItem.leftBarButtonItem &&
       self.navigationController.viewControllers &&
       self.navigationController.viewControllers.firstObject != self) {
        self.navigationItem.leftBarButtonItem = [self getBackBarButtonItem];
    }
}

- (UIBarButtonItem *) getBackBarButtonItem {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 80, 44)];
//    [button setTitle:@" 返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"app_back_btn"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backToPreviousViewController:) forControlEvents:UIControlEventTouchUpInside];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"\U0000e908返回"
//                                                                style:UIBarButtonItemStylePlain
//                                                               target:self
//                                                               action:@selector(backToPreviousViewController:)];
    return barItem;
}

- (void)backToPreviousViewController:(UIBarButtonItem *)viewController {
    if([self isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController *)self popViewControllerAnimated:YES];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
