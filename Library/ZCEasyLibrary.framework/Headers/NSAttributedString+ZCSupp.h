//
//  NSAttributedString+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/24.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/NSStringDrawing.h>
#import <UIKit/UIFont.h>
#import <UIKit/UIColor.h>

@interface NSAttributedString (ZCSupp)

/// 计算字符串对应的绘画大小
- (CGSize)zc_sizeWithMaxSize:(CGSize)size;

/// 生成标签
+ (NSAttributedString *)zc_getTagTextWithTextFont:(UIFont *)font
                                         backFont:(UIFont *)backFont
                                        textColor:(UIColor *)textColor
                                        backColor:(UIColor *)backColor
                                     tagTextArray:(NSArray *)tagTextArray
                                    paddingString:(NSString *)paddingString
                                     paddingColor:(UIColor *)paddingColor;
/// 生成换行标签
+ (NSAttributedString *)zc_getTagTextWithTextFont:(UIFont *)font
                                         backFont:(UIFont *)backFont
                                        textColor:(UIColor *)textColor
                                        backColor:(UIColor *)backColor
                                     tagTextArray:(NSArray *)tagTextArray
                                    paddingString:(NSString *)paddingString
                                     paddingColor:(UIColor *)paddingColor
                                          maxSize:(CGSize)maxSize;
/// 按行生成标签数组
+ (NSArray *)zc_getTagLinesWithTextFont:(UIFont *)font
                               backFont:(UIFont *)backFont
                              textColor:(UIColor *)textColor
                              backColor:(UIColor *)backColor
                           tagTextArray:(NSArray *)tagTextArray
                          paddingString:(NSString *)paddingString
                           paddingColor:(UIColor *)paddingColor
                                maxSize:(CGSize)maxSize;
/// 生成标签数组
+ (NSArray *)zc_getTagsWithTextFont:(UIFont *)font
                           backFont:(UIFont *)backFont
                          textColor:(UIColor *)textColor
                          backColor:(UIColor *)backColor
                       tagTextArray:(NSArray *)tagTextArray;
/// 生成单个标签
+ (NSAttributedString *)zc_getTagWithTextFont:(UIFont *)font
                                     backFont:(UIFont *)backFont
                                    textColor:(UIColor *)textColor
                                    backColor:(UIColor *)backColor
                                      tagText:(NSString *)tagText;

@end
