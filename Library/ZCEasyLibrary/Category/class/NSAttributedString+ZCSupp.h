//
//  NSAttributedString+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/24.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (ZCSupp)

/// 计算字符串对应的绘画大小
- (CGSize)zc_sizeWithMaxSize:(CGSize)size;


@end
