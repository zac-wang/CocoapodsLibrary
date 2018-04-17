//
//  NSString+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZCStringFromObject(_object_) [NSString stringWithFormat:@"%@", _object_]

#define NSStringValid(__string__) ({ \
    NSString *myString = __string__; \
    [myString isKindOfClass:[NSString class]] && myString.length; \
})

@interface NSString (ZCSupp)

@property(nonatomic, readonly) NSData *zc_data;

@property(nonatomic, readonly) NSDictionary *zc_urlParamSplit;

@property(nonatomic, readonly) NSString *zc_urlEncoded;
@property(nonatomic, readonly) NSString *zc_urlDecoded;
@property(nonatomic, readonly) NSStringEncoding zc_encoding;

@property(nonatomic, readonly) NSString *zc_pinyin;

@end
