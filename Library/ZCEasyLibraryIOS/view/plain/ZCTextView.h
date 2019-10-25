//
//  ZCTextView.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/28.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCTextView : UITextView

///设置属性key
@property(nonatomic, strong) NSString *zc_keyPath;

///设置文字最大输入长度
@property(nonatomic, assign) int zc_textMaxLength;

///监测文字变化事件
@property(nonatomic, copy) void(^zc_updateEvent)(ZCTextView *);

///文字编辑结束事件
@property(nonatomic, copy) void(^zc_endEditEvent)(ZCTextView *);


///最大高度,默认0不限制
@property(nonatomic, assign)   float zc_maxHeight;
///计算最合适高度
@property(nonatomic, readonly) float zc_height;
///更新高度
- (void)zc_updateHeight;

@end


@interface ZCTextView (ZCPlaceholder)
///设置提示文字
@property(nonatomic,strong) NSAttributedString *zc_placeholderAttributesString;
///设置提示文字
@property(nonatomic,copy)   NSString *zc_placeholder;
///设置提示文字颜色
@property(nonatomic,readwrite) UIColor *zc_placeholderColor;
@end
