//
//  NSObject+ZCToString.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/12/12.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "NSObject+ZCToString.h"
#import "NSArray+ZCJson.h"
#import "NSDictionary+ZCJson.h"
#import "NSNumber+ZCSupp.h"

@implementation NSObject (ZCToString)

- (NSString *)zc_toString {
    if([self isKindOfClass:[NSNull class]]) {
        return nil;
    }else if([self isKindOfClass:[NSString class]]) {
        return (NSString *)self;
    }else if([self isKindOfClass:[NSData class]]) {
        return [[NSString alloc] initWithData:(NSData *)self encoding:NSUTF8StringEncoding];
    }else if([self isKindOfClass:[NSNumber class]]) {
        NSNumber *num = (NSNumber *)self;
        if (strcmp([num objCType], @encode(double)) == 0) {
            double value = [num doubleValue];
            return [NSString stringWithFormat:@"%.12lg", value];
        }else{
            return [NSString stringWithFormat:@"%@", num];
        }
    }else if([self isKindOfClass:[NSArray class]]) {
        return [(NSArray *)self zc_toJsonString];
    }else if([self isKindOfClass:[NSDictionary class]]) {
        return [(NSDictionary *)self zc_toJsonString];
    }
    return [NSString stringWithFormat:@"%@", self];
}

@end
