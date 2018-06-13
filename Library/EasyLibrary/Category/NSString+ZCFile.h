//
//  NSString+ZCFile.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/3/27.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZCFile)

/// 根据拓展名 获取MIME类型
@property(nonatomic, readonly) NSString *zc_mimeType;

@end
