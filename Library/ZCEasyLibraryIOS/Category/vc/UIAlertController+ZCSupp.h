//
//  UIAlertController+ZCSupp.h
//  ZCEasyLibrary
//
//  Created by wzc on 2020/6/10.
//  Copyright © 2020 zac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIAlertController (ZCSupp)

/// Alert
+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message;
/// Sheet
+ (instancetype)actionSheetWithTitle:(NSString *)title message:(NSString *)message;



/// 添加默认按钮、事件
- (UIAlertAction *)zc_addDefaultAction:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;
/// 设置默认选项数组、事件
- (void)zc_addDefaultActions:(NSArray<NSString *> *)titles handler:(void (^)(UIAlertAction *action))handler;
/// 添加取消按钮，传nil则显示“取消”
- (UIAlertAction *)zc_addCancelAction:(NSString *)title;
/// 添加取消按钮、事件
- (UIAlertAction *)zc_addCancelAction:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;
/// 添加按钮、按钮样式、事件
- (UIAlertAction *)zc_addAction:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction *action))handler;

/// 添加UITextField， 回调中可以设置UITextField属性
- (void)zc_addTextFieldWithHandler:(void (^)(UITextField *))configurationHandler;


/// 显示Alert
- (void)zc_showWithViewController:(UIViewController *)vc;

@end

