//
//  NSAttributedString+ZCSupp.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/24.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "NSAttributedString+ZCSupp.h"

@implementation NSAttributedString (ZCSupp)

- (CGSize)zc_sizeWithMaxSize:(CGSize)size {
    CGSize resultSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    return CGSizeMake(resultSize.width, ceilf(resultSize.height));
}

@end
