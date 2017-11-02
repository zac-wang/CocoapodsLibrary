//
//  NSDictionary+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZCSupp)

///拼接对应的url参数字符串
@property(nonatomic, readonly) NSString *zc_toUrlParam;

- (id)objectForKeyPath:(id)aKeyPath;

@end
