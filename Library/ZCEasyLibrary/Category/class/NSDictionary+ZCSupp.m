//
//  NSDictionary+ZCSupp.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/23.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSDictionary+ZCSupp.h"
#import "NSString+ZCSupp.h"

@implementation NSDictionary (ZCSupp)

- (NSString *)zc_toUrlParamString {
    NSMutableArray *query = [NSMutableArray array];
    for (NSString *key in self.allKeys) {
        NSString* value = [self[key] zc_urlEncoded];
        NSString* param = [NSString stringWithFormat:@"%@=%@", key, value];
        [query addObject:param];
    }
    
    return [query componentsJoinedByString:@"&"];
}

- (id)zc_objectForKeyPath:(NSString *)aKeyPath {
    NSArray *arr = [aKeyPath componentsSeparatedByString:@"."];
    NSDictionary *dic = self;
    for (NSString *key in arr) {
        if(!key.length) {
            continue;
        }
        if([dic isKindOfClass:[NSArray class]]) {
            dic = [(NSArray *)dic objectAtIndex:[key intValue]];
        }else {
            dic = dic[key];
        }
    }
    return dic;
}

@end
