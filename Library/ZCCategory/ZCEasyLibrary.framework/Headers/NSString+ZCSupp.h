//
//  NSString+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/NSStringDrawing.h>

@interface NSString (ZCSupp)

@property(nonatomic, readonly) NSData *zc_data;

@property(nonatomic, readonly) NSString *zc_urlEncoded;
@property(nonatomic, readonly) NSString *zc_urlDecoded;
@property(nonatomic, readonly) NSStringEncoding zc_encoding;

@property(nonatomic, readonly) NSString *zc_pinyin;

///获取对应的json对象（字典or数组）
@property(nonatomic, readonly) id zc_toJsonObject;


@property(nonatomic, readonly) NSString *zc_md5;
@property(nonatomic, readonly) NSString *zc_sha1;
@property(nonatomic, readonly) NSString *zc_fileMd5;
@property(nonatomic, readonly) NSString *zc_base64;
@property(nonatomic, readonly) NSString *zc_base64DecodeString;
@property(nonatomic, readonly) NSData   *zc_base64DecodeData;


@property(nonatomic, readonly) BOOL zc_isPhoneNumber;
@property(nonatomic, readonly) BOOL zc_isEmail;
@property(nonatomic, readonly) BOOL zc_isNumber;
@property(nonatomic, readonly) BOOL zc_isIDCard;
@property(nonatomic, readonly) BOOL zc_isChinese;

- (CGSize)zc_sizeWithMaxSize:(CGSize)size font:(id)font;
- (CGSize)zc_sizeWithMaxSize:(CGSize)size attributes:(NSDictionary<NSAttributedStringKey, id> *)attributes;

@end
