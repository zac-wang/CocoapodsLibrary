//
//  NSDictionary+ZCJson.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "NSDictionary+ZCJson.h"
#import "NSData+ZCJson.h"

@implementation NSDictionary (ZCJson)

- (NSData *)zc_toJsonData {
    return [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
}

- (NSString *)zc_toJsonString {
    NSData *data = [self zc_toJsonData];
    return data.zc_toString;
}

@end
