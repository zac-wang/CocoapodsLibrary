//
//  ZCAlert.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/26.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCAlert : UIAlertController

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message;
+ (instancetype)actionSheetWithTitle:(NSString *)title message:(NSString *)message;

- (void)zc_addDefaultAction:(NSArray<NSString *> *)titles;
- (UIAlertAction *)zc_addCancelAction:(NSString *)title;
- (UIAlertAction *)zc_addDefaultAction:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;
- (UIAlertAction *)zc_addCancelAction:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;
- (UIAlertAction *)zc_addAction:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction *action))handler;
- (void)zc_addTextFieldWithHandler:(void (^)(UITextField *))configurationHandler;
- (void)zc_showWithViewController:(UIViewController *)vc;

@property(nonatomic, copy) void (^zc_handler)(UIAlertAction *action);

@end
