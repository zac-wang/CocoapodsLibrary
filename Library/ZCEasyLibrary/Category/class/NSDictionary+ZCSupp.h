//
//  NSDictionary+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/23.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZCSupp)

/// 拼接并返回对应的url参数字符串
@property(nonatomic, readonly) NSString *zc_toUrlParamString;

- (id)zc_objectForKeyPath:(NSString *)aKeyPath;

@end
