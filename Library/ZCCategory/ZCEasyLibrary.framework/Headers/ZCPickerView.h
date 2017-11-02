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

- (void)zc_componentCount:(NSInteger)count rowCount:(NSInteger(^)(UIPickerView *pic, NSInteger component))block;
@property(nonatomic, copy)   NSString *(^zc_cell)(UIPickerView *pic, NSInteger component, NSInteger row);

///选择后的回调方法
@property(nonatomic, copy) void(^zc_selectPicker)(UIPickerView *pic, NSArray<NSNumber *> *selectRowArray, NSArray<NSString *> *selectTitleArray);

@end
