//
//  NSString+ZCSupp.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/23.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

static inline NSString* ZCStringFromObject(NSObject *_object_) {
    if(!_object_)
        return @"";
    if([(_object_) isEqual:[NSNull null]])
        return @"";
    return [NSString stringWithFormat:@"%@", _object_];
}

static inline BOOL NSStringValid(NSString *myString) {
    return [myString isKindOfClass:[NSString class]] && myString.length;
}

@interface NSString (ZCSupp)

@property(nonatomic, readonly) NSData *zc_data;

@property(nonatomic, readonly) NSDictionary *zc_urlParamSplit;

@property(nonatomic, readonly) NSString *zc_urlEncoded;
@property(nonatomic, readonly) NSString *zc_urlDecoded;
@property(nonatomic, readonly) NSStringEncoding zc_encoding;

@property(nonatomic, readonly) NSString *zc_pinyin;

@end
