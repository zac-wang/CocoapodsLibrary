//
//  NSString+ZCFile.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/3/27.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZCFile)

/// 根据拓展名 获取MIME类型
@property(nonatomic, readonly) NSString *zc_mimeType;

@end
