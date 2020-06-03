//
//  NSDictionary+ZCJson.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSDictionary+ZCJson.h"

@implementation NSDictionary (ZCJson)

- (NSData *)zc_toJsonData {
    return [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
}

- (NSString *)zc_toJsonString {
    NSData *data = [self zc_toJsonData];
    return [[NSString alloc] initWithData:(NSData *)data encoding:NSUTF8StringEncoding];
}

@end
