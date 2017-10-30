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

- (void)addDefaultAction:(NSArray<NSString *> *)titles;
- (UIAlertAction *)addCancelAction:(NSString *)title;
- (UIAlertAction *)addDefaultAction:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;
- (UIAlertAction *)addCancelAction:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;
- (UIAlertAction *)addAction:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction *action))handler;
- (void)addTextFieldWithHandler:(void (^)(UITextField *))configurationHandler;
- (void)showWithViewController:(UIViewController *)vc;

@property(nonatomic, copy) void (^handler)(UIAlertAction *action);

@end
