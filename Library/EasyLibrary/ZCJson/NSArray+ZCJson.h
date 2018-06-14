//
//  NSArray+ZCJson.h
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/23.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ZCJson)

/// 获取对应的json data
@property(nonatomic, readonly) NSData *zc_toJsonData;
/// 获取对应的json字符串
@property(nonatomic, readonly) NSString *zc_toJsonString;

@end
