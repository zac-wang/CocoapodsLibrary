//
//  NSArray+ZCJson.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "NSArray+ZCJson.h"

@implementation NSArray (ZCJson)

- (NSData *)zc_toJsonData {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return data;
}

- (NSString *)zc_toJsonString {
    NSData *data = [self zc_toJsonData];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return result;
}

@end