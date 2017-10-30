//
//  MBProgressHUD+easy.h
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/4/17.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (easy)

+ (void)showText:(NSString *)text;


/**
 显示加载中
 */
+ (MBProgressHUD *)showLoadding;

+ (MBProgressHUD *)showLoaddingWithShade:(BOOL)shade;


@end
