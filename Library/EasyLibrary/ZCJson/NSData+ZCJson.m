//
//  NSData+ZCJson.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "NSData+ZCJson.h"

@implementation NSData (ZCJson)

- (id)zc_toJsonObject {
    if (!self.length)
        return nil;
    
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:&err];
    return dic;
}

@end
