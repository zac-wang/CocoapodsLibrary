//
//  NSDictionary+ZCJson.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZCJson)

///获取对应的json data
@property(nonatomic, readonly) NSData *zc_toJsonData;
///获取对应的json字符串
@property(nonatomic, readonly) NSString *zc_toJsonString;

@end
