//
//  ZCTextField.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/27.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCTextField : UITextField

/**
 监测文字变化事件
 */
@property(nonatomic, copy) void(^zc_updateEvent)(ZCTextField *);

/**
 设置属性key
 */
@property(nonatomic, strong) NSString *zc_keyPath;

/**
 设置文字最大输入长度
 */
@property(nonatomic, assign) int zc_textMaxLength;

@end
