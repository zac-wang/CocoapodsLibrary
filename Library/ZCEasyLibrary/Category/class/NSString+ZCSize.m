//
//  NSString+ZCSize.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "NSString+ZCSize.h"
#import <UIKit/UIFont.h>

@implementation NSString (ZCSize)

#pragma mark - 计算文本绘画大小

- (CGSize)zc_sizeWithMaxSize:(CGSize)size font:(id)font {
    if(![font isKindOfClass:[UIFont class]]) {
        font = [UIFont systemFontOfSize:[font floatValue]];
    }
    return [self zc_sizeWithMaxSize:size attributes:@{NSFontAttributeName : font}];
}

- (CGSize)zc_sizeWithMaxSize:(CGSize)size attributes:(NSDictionary<NSAttributedStringKey, id> *)attributes {
    if(size.height == 0)
        size = CGSizeMake(size.width, MAXFLOAT);
    CGSize resultSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return CGSizeMake(resultSize.width, ceilf(resultSize.height));
}

@end
