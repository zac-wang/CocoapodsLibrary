//
//  ZCAlert.h
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/26.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCAlertAction : UIAlertAction
@property(nonatomic, assign) int zc_index;
@end

@interface ZCAlert : UIAlertController

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message;
+ (instancetype)actionSheetWithTitle:(NSString *)title message:(NSString *)message;

/// 设置选项数组
- (void)zc_addDefaultActions:(NSArray<NSString *> *)titles handler:(void (^)(ZCAlertAction *action))handler;

/// 添加默认按钮
- (UIAlertAction *)zc_addDefaultAction:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;
/// 添加取消按钮，无事件，传nil则显示“取消”
- (UIAlertAction *)zc_addCancelAction:(NSString *)title;
/// 添加取消按钮
- (UIAlertAction *)zc_addCancelAction:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;
/// 添加按钮
- (UIAlertAction *)zc_addAction:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction *action))handler;
/// 添加UITextField， 回调中可以设置UITextField属性
- (void)zc_addTextFieldWithHandler:(void (^)(UITextField *))configurationHandler;

- (void)zc_showWithViewController:(UIViewController *)vc;


@end
