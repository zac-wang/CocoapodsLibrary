//
//  NSAttributedString+ZCTag.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/4/11.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//标签
NS_CLASS_DEPRECATED_IOS(2_0, 9_0, "建议使用 ZCTagView")
@interface NSAttributedString (ZCTag)

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
