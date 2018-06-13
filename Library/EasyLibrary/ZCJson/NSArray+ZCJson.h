//
//  NSArray+ZCJson.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ZCJson)

/// 获取对应的json data
@property(nonatomic, readonly) NSData *zc_toJsonData;
/// 获取对应的json字符串
@property(nonatomic, readonly) NSString *zc_toJsonString;

@end
