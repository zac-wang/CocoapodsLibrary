//
//  ZCTextView.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/28.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCTextView : UITextView

/**
 设置提示文字
 */
@property(nonatomic,copy)   NSString *zc_placeholder;

/**
 监测文字变化事件
 */
@property(nonatomic, copy) void(^zc_updateEvent)(ZCTextView *);

/**
 设置属性key
 */
@property(nonatomic, strong) NSString *zc_keyPath;

/**
 设置文字最大输入长度
 */
@property(nonatomic, assign) int zc_textMaxLength;

@end
