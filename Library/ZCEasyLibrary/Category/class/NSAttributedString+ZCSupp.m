//
//  NSAttributedString+ZCSupp.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/24.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSAttributedString+ZCSupp.h"

@implementation NSAttributedString (ZCSupp)

- (CGSize)zc_sizeWithMaxSize:(CGSize)size {
    CGSize resultSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    return CGSizeMake(resultSize.width, ceilf(resultSize.height));
}

@end
