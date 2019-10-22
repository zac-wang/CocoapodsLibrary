//
//  NSString+ZCEncrypt.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZCEncrypt)

@property(nonatomic, readonly) NSString *zc_md5;
@property(nonatomic, readonly) NSString *zc_sha1;
@property(nonatomic, readonly) NSString *zc_fileMd5;
@property(nonatomic, readonly) NSString *zc_base64;
@property(nonatomic, readonly) NSString *zc_base64DecodeString;
@property(nonatomic, readonly) NSData   *zc_base64DecodeData;

@end
