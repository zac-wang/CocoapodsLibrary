//
//  MBProgressHUD+easy.m
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/4/17.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import "MBProgressHUD+easy.h"

@implementation MBProgressHUD (easy)

+ (void)showText:(NSString *)text {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.labelText = text;
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [hud hide:YES afterDelay:1];
    });
}

+ (MBProgressHUD *)showLoadding {
    return [self showLoaddingWithShade:YES];
}

+ (MBProgressHUD *)showLoaddingWithShade:(BOOL)shade {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:window];
    [window addSubview:hud];
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.dimBackground = YES;
    hud.userInteractionEnabled  = shade;
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [hud show:YES];
    });
    return hud;
}


@end
