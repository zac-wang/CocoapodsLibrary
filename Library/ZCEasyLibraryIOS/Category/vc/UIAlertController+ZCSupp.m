//
//  UIAlertController+ZCSupp.m
//  ZCEasyLibrary
//
//  Created by wzc on 2020/6/10.
//  Copyright © 2020 zac. All rights reserved.
//

#import "UIAlertController+ZCSupp.h"


@implementation UIAlertController (ZCSupp)

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message {
    return [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
}

+ (instancetype)actionSheetWithTitle:(NSString *)title message:(NSString *)message {
    return [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
}


- (UIAlertAction *)zc_addDefaultAction:(NSString *)title handler:(void (^)(UIAlertAction *action))handler {
    return [self zc_addAction:title style:UIAlertActionStyleDefault handler:handler];
}

- (void)zc_addDefaultActions:(NSArray<NSString *> *)titles handler:(void (^)(UIAlertAction *))handler {
    for (NSString *title in titles) {
        [self zc_addDefaultAction:title handler:handler];
    }
}

- (UIAlertAction *)zc_addCancelAction:(NSString *)title {
    return [self zc_addCancelAction:title?:@"取消" handler:nil];
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
        if((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
           && !self.popoverPresentationController.sourceView){
            UIPopoverPresentationController *popPresenter = [self popoverPresentationController];
            popPresenter.sourceView = vc.view; // 这就是挂靠的对象
            //popPresenter.sourceRect = CGRectMake(ZC_SCREEN_WIDTH/2, ZC_SCREEN_HEIGHT/2, 0, 0);
        }
        [vc presentViewController:self animated:YES completion:nil];
    });
}

@end
