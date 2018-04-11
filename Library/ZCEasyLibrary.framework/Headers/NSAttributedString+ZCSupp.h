//
//  NSAttributedString+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/24.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (ZCSupp)

/// 计算字符串对应的绘画大小
- (CGSize)zc_sizeWithMaxSize:(CGSize)size;



@end
