//
//  NSString+ZCSize.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/23.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/NSStringDrawing.h>

@interface NSString (ZCSize)

/**
 获取字体绘画区域大小

 @param size 指定区域
 @param font 字体、或字体大小(@15)
 @return 绘画区域大小
 */
- (CGSize)zc_sizeWithMaxSize:(CGSize)size font:(id)font;
- (CGSize)zc_sizeWithMaxSize:(CGSize)size attributes:(NSDictionary<NSAttributedStringKey, id> *)attributes;

@end
