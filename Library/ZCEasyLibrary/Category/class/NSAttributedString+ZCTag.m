//
//  NSAttributedString+ZCTag.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/4/11.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "NSAttributedString+ZCTag.h"
#import "NSAttributedString+ZCSupp.h"

@implementation NSAttributedString (ZCTag)

+ (NSAttributedString *)zc_getTagTextWithTextFont:(UIFont *)font
                                         backFont:(UIFont *)backFont
                                        textColor:(UIColor *)textColor
                                        backColor:(UIColor *)backColor
                                     tagTextArray:(NSArray *)tagTextArray
                                    paddingString:(NSString *)paddingString
                                     paddingColor:(UIColor *)paddingColor {
    return [self zc_getTagTextWithTextFont:font backFont:backFont textColor:textColor backColor:backColor tagTextArray:tagTextArray paddingString:paddingString paddingColor:paddingColor maxSize:CGSizeZero];
}

+ (NSAttributedString *)zc_getTagTextWithTextFont:(UIFont *)font
                                         backFont:(UIFont *)backFont
                                        textColor:(UIColor *)textColor
                                        backColor:(UIColor *)backColor
                                     tagTextArray:(NSArray *)tagTextArray
                                    paddingString:(NSString *)paddingString
                                     paddingColor:(UIColor *)paddingColor
                                          maxSize:(CGSize)maxSize {
    NSArray *stringArray = [self zc_getTagLinesWithTextFont:font backFont:backFont textColor:textColor backColor:backColor tagTextArray:tagTextArray paddingString:paddingString paddingColor:paddingColor maxSize:CGSizeZero];
    
    if(stringArray.count <= 1)
        return stringArray.firstObject;
    
    NSMutableAttributedString *resultString = [NSMutableAttributedString new];
    for (NSMutableAttributedString *str in stringArray) {
        [resultString appendAttributedString:str];
        [resultString appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n"]];
    }
    
    return resultString;
}

+ (NSArray *)zc_getTagLinesWithTextFont:(UIFont *)font
                               backFont:(UIFont *)backFont
                              textColor:(UIColor *)textColor
                              backColor:(UIColor *)backColor
                           tagTextArray:(NSArray *)tagTextArray
                          paddingString:(NSString *)paddingString
                           paddingColor:(UIColor *)paddingColor
                                maxSize:(CGSize)maxSize {
    if(!font)
        font = [UIFont systemFontOfSize:13];
    if(!backFont)
        backFont = font;
    if(!textColor)
        textColor = [UIColor blackColor];
    if(!backColor)
        backColor = [UIColor clearColor];
    if(!paddingString)
        paddingString = @" ";
    if(!paddingColor)
        paddingColor = [UIColor clearColor];
    BOOL isWrap = !CGSizeEqualToSize(maxSize, CGSizeZero);
    
    NSArray *tagAttTextArray = [self zc_getTagsWithTextFont:font backFont:backFont textColor:textColor backColor:backColor tagTextArray:tagTextArray];
    
    // 间隔
    NSMutableAttributedString *gapString;
    gapString = [[NSMutableAttributedString alloc] initWithString:paddingString
                                                       attributes:@{
                                                                    NSFontAttributeName : backFont,
                                                                    NSForegroundColorAttributeName : [UIColor clearColor],
                                                                    NSBackgroundColorAttributeName : paddingColor,
                                                                    }];
    
    
    NSMutableArray *stringArray = [NSMutableArray array];
    NSMutableAttributedString *string = [NSMutableAttributedString new];
    for (int i = 0; i < tagAttTextArray.count; i++) {
        NSMutableAttributedString *tempString = [string mutableCopy];
        [tempString appendAttributedString:tagAttTextArray[i]];
        
        if(isWrap){
            CGSize size1 = [string zc_sizeWithMaxSize:maxSize];
            CGSize size2 = [tempString zc_sizeWithMaxSize:maxSize];
            if(isWrap && size1.width != 0 && size1.height != 0 && size1.height != size2.height) {
                [stringArray addObject:string];
                
                string = [NSMutableAttributedString new];
                [string appendAttributedString:tagAttTextArray[i]];
                [string appendAttributedString:gapString];
                continue;
            }
        }
        string = tempString;
        [string appendAttributedString:gapString];
        
    }
    if(string.length) {
        [stringArray addObject:string];
    }
    return stringArray;
}

+ (NSArray *)zc_getTagsWithTextFont:(UIFont *)font
                           backFont:(UIFont *)backFont
                          textColor:(UIColor *)textColor
                          backColor:(UIColor *)backColor
                       tagTextArray:(NSArray *)tagTextArray {
    NSMutableArray *tagAttTextArray = [NSMutableArray array];
    for (NSString *item in tagTextArray) {
        NSAttributedString *tagAttString = [self zc_getTagWithTextFont:font backFont:backFont textColor:textColor backColor:backColor tagText:item];
        [tagAttTextArray addObject:tagAttString];
    }
    return tagAttTextArray;
}

+ (NSAttributedString *)zc_getTagWithTextFont:(UIFont *)font
                                     backFont:(UIFont *)backFont
                                    textColor:(UIColor *)textColor
                                    backColor:(UIColor *)backColor
                                      tagText:(NSString *)tagText {
    NSMutableAttributedString *attSubString = [[NSMutableAttributedString alloc] initWithString:tagText];
    [attSubString addAttributes:@{
                                  NSFontAttributeName : font,
                                  NSForegroundColorAttributeName : textColor,
                                  NSBackgroundColorAttributeName : backColor,
                                  } range:NSMakeRange(0,attSubString.length)];
    
    // 文字居中
    float baselineOffset = 0.36 * (backFont.pointSize - font.pointSize);
    [attSubString addAttribute:NSBaselineOffsetAttributeName value:@(baselineOffset) range:NSMakeRange(0, attSubString.length)];
    
    return attSubString;
}

@end
