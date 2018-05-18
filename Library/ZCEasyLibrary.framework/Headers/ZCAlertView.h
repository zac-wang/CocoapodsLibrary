//
//  ZCAlertView.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2018/5/17.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "ZCElasticControl.h"

typedef void (^ZCAlertActionHandle)(UIAlertAction *action);

@interface ZCAlertView : ZCElasticControl

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;

/// 添加默认按钮
- (UIButton *)zc_addDefaultAction:(NSString *)title handler:(ZCAlertActionHandle)handler;
/// 添加取消按钮，无事件，传nil则显示“取消”
- (UIButton *)zc_addCancelAction:(NSString *)title;
/// 添加取消按钮
- (UIButton *)zc_addCancelAction:(NSString *)title handler:(ZCAlertActionHandle)handler;

- (void)zc_show;

@end
