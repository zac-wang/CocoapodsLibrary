//
//  NSMutableAttributedString+ZCSetStyle.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/4/11.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    /// 不设置 下划线／删除线
    ZCAttribTypeStyleNone         = NSUnderlineStyleNone,
    /// 设置下划线／删除线 为 细单线
    ZCAttribTypeStyleSingle       = NSUnderlineStyleSingle,
    /// 设置下划线／删除线 为 粗单线
    ZCAttribTypeStyleThick        = NSUnderlineStyleThick,
    /// 设置下划线／删除线 为 细双线
    ZCAttribTypeStyleDouble       = NSUnderlineStyleDouble,
    
    /// 设置下划线／删除线 为 连续的实线
    ZCAttribTypePatternSolid      = NSUnderlinePatternSolid,
    /// 设置下划线／删除线 为 断续的短虚线
    ZCAttribTypePatternDot        = NSUnderlinePatternDot,
    /// 设置下划线／删除线 为 断续的长虚线
    ZCAttribTypePatternDash       = NSUnderlinePatternDash,
    /// 设置下划线／删除线 为 断续的长、短虚线
    ZCAttribTypePatternDashDot    = NSUnderlinePatternDashDot,
    /// 设置下划线／删除线 为 断续的长、短、短虚线
    ZCAttribTypePatternDashDotDot = NSUnderlinePatternDashDotDot,
    
    /// 空格 不设置 下划线／删除线
    ZCAttribTypeByWord            = NSUnderlineByWord
} ZCAttribType;

@interface NSMutableAttributedString (ZCSetStyle)

/// 添加样式
@property(nonatomic, readonly, copy) NSMutableAttributedString *(^zc_addStyle)(NSAttributedStringKey key, id value);

/// 添加样式 至指定位置
@property(nonatomic, readonly, copy) NSMutableAttributedString *(^zc_addStyleToRange)(NSAttributedStringKey key, id value, NSRange range);

/// 添加文字字体
@property(nonatomic, readonly, copy) NSMutableAttributedString *(^zc_addTextFontStyle)(UIFont *font);
/// 添加文字颜色
@property(nonatomic, readonly, copy) NSMutableAttributedString *(^zc_addTextColorStyle)(UIColor *color);
/// 添加文字背景颜色
@property(nonatomic, readonly, copy) NSMutableAttributedString *(^zc_addTintColorStyle)(UIColor *color);
/// 添加字符间距
@property(nonatomic, readonly, copy) NSMutableAttributedString *(^zc_addTextKernStyle)(int kern);
/// 添加描边宽度（负值填充效果，正值中空效果）, 设置描边颜色
@property(nonatomic, readonly, copy) NSMutableAttributedString *(^zc_addTextStrokeStyle)(int stroke, UIColor *color);
/// 添加下划线(0:不设置, 1:细单线, 2:粗单线, 1:细双线), 设置下划线颜色
@property(nonatomic, readonly, copy) NSMutableAttributedString *(^zc_addUnderlineStyle)(ZCAttribType type, UIColor *color);
/// 添加删除线(0:不设置, 1:细单线, 2:粗单线, 1:细双线), 设置删除线颜色
@property(nonatomic, readonly, copy) NSMutableAttributedString *(^zc_addStrikethroughStyle)(ZCAttribType type, UIColor *color);


/// 追加文字
@property(nonatomic, readonly, copy) NSMutableAttributedString *(^zc_appendTextAndStyle)(NSString *text, NSDictionary *style);

@end
