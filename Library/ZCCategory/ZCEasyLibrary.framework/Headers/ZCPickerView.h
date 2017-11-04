//
//  ZCPickerView.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/1.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCPickerView : UIControl

- (instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic, readonly) UIPickerView *zc_pickerView;

#pragma mark - 设置源数据
/// 方法一、直接设置title数组，仅一列
@property(nonatomic, strong) NSArray *zc_dataSource;

/// 方法二、设置数据列数，行数
- (void)zc_componentCount:(NSInteger)count rowCount:(NSInteger(^)(UIPickerView *pic, NSInteger component))block;
/// 设置title
@property(nonatomic, copy)   NSString *(^zc_cell)(UIPickerView *pic, NSInteger component, NSInteger row);


///选择后的回调方法
@property(nonatomic, copy) void(^zc_selectPicker)(UIPickerView *pic, NSArray<NSNumber *> *selectRowArray, NSArray<NSString *> *selectTitleArray);

@end
