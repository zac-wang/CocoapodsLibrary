//
//  NSString+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/NSStringDrawing.h>

#define NSStringFormNumber(_number_) [NSString stringWithFormat:@"%@", _number_]

@interface NSString (ZCSupp)

@property(nonatomic, readonly) NSData *zc_data;

@property(nonatomic, readonly) NSString *zc_urlEncoded;
@property(nonatomic, readonly) NSString *zc_urlDecoded;
@property(nonatomic, readonly) NSStringEncoding zc_encoding;

@property(nonatomic, readonly) NSString *zc_pinyin;



/**
 获取字体绘画区域大小

 @param size 指定区域
 @param font 字体、或字体大小(@15)
 @return 绘画区域大小
 */
- (CGSize)zc_sizeWithMaxSize:(CGSize)size font:(id)font;
- (CGSize)zc_sizeWithMaxSize:(CGSize)size attributes:(NSDictionary<NSAttributedStringKey, id> *)attributes;

@end
