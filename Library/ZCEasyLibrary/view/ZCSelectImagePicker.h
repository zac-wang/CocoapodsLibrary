//
//  ZCSelectImagePicker.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/30.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZCSelectImagePicker : NSObject

- (instancetype)init;

@property(nonatomic, readonly) UIImagePickerController *zc_pickerController;

@property(nonatomic, assign) int tag;

///选择图片后回调的方法
@property(nonatomic, copy) void(^zc_selectPickerController)(UIImage *image);
///取消选择图片后回调的方法
@property(nonatomic, copy) void(^zc_cancelSelectPickerController)(void);

///选择图片
- (void)zc_showWithSourceType:(UIImagePickerControllerSourceType)type vc:(UIViewController *)vc;

///展示选择
- (void)zc_showWithViewController:(UIViewController *)vc;

@end
