//
//  ZCSelectDatePicker.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/29.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCElasticControl.h"

@interface ZCSelectDatePicker : ZCElasticControl

- (instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic, readonly) UIDatePicker *zc_datePicker;


///用于设置回调方法中，返回格式化时间的格式
@property(nonatomic, copy) NSString *zc_dateFormat;

/**
 选择时间后的回调方法
 
 @param datePicker datePicker
 @param date 时间
 @param message 格式化字符串
 */
@property(nonatomic, copy) void(^zc_selectDatePicker)(UIDatePicker *pic, NSDate *date, NSString *message);

@property(nonatomic, assign) BOOL zc_selectEndRemoveFromSuperview;

@end
