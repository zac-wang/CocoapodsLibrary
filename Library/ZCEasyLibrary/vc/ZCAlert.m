//
//  ZCAlert.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/26.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCAlert.h"
#import <ZCEasyLibraryPrivate/Macro.h>

@implementation ZCAlertAction
@end

@implementation ZCAlert

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message {
    return [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
}

+ (instancetype)actionSheetWithTitle:(NSString *)title message:(NSString *)message {
    return [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
}

- (void)zc_addDefaultAction:(NSArray<NSString *> *)titles {
    __weak typeof(self)weakSelf = self;
    for (int i = 0; i < titles.count; i++) {
        NSString *title = titles[i];
        ZCAlertAction *action = [ZCAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if(weakSelf.zc_handler) {
                weakSelf.zc_handler((ZCAlertAction *)action);
            }
        }];
        action.zc_index = i;
        [self addAction:action];
    }
}

- (UIAlertAction *)zc_addCancelAction:(NSString *)title {
    return [self zc_addCancelAction:title?:@"取消" handler:nil];
}

- (UIAlertAction *)zc_addDefaultAction:(NSString *)title handler:(void (^)(UIAlertAction *action))handler {
    return [self zc_addAction:title style:UIAlertActionStyleDefault handler:handler];
}

- (UIAlertAction *)zc_addCancelAction:(NSString *)title handler:(void (^)(UIAlertAction *action))handler {
    return [self zc_addAction:title style:UIAlertActionStyleCancel handler:handler];
}

- (UIAlertAction *)zc_addAction:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction *action))handler {
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:style handler:handler];
    [self addAction:action];
    return action;
}

- (void)zc_addTextFieldWithHandler:(void (^)(UITextField *))configurationHandler {
    [self addTextFieldWithConfigurationHandler:configurationHandler];
}

- (void)zc_showWithViewController:(UIViewController *)vc {
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        if(ZC_IS_IPAD && !self.popoverPresentationController.sourceView){
            UIPopoverPresentationController *popPresenter = [self popoverPresentationController];
            popPresenter.sourceView = vc.view; // 这就是挂靠的对象
            //popPresenter.sourceRect = CGRectMake(ZC_SCREEN_WIDTH/2, ZC_SCREEN_HEIGHT/2, 0, 0);
        }
        [vc presentViewController:self animated:YES completion:nil];
    });
}

@end
