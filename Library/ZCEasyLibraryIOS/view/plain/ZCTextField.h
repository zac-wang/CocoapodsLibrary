//
//  ZCTextField.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/27.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCTextField : UITextField

///设置文字最大输入长度
@property(nonatomic, assign) int zc_textMaxLength;

///监测文字变化事件
@property(nonatomic, copy) void(^zc_updateEvent)(ZCTextField *);

///文字编辑结束事件
@property(nonatomic, copy) void(^zc_endEditEvent)(ZCTextField *);

///设置输入框左边的小图标
- (void)zc_setLeftImage:(UIImage *)image frame:(CGRect)frame;

@end
