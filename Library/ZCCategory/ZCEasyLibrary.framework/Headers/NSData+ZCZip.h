//
//  NSData+ZCZip.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/3.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZCZip)

/// 数据压缩
- (NSData*) zc_compressZipData;
/// 数据解压缩
- (NSData *)zc_uncompressZipData;

@end
