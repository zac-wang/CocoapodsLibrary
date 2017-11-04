//
//  NSData+ZCEncrypt.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZCEncrypt)

@property (nonatomic, readonly) NSString *zc_md5;
@property (nonatomic, readonly) NSString *zc_sha1;
@property (nonatomic, readonly) NSString *zc_base64;

/// AES256加密
- (NSData *)zc_AES256EncryptWithKey:(NSString *)key;
/// AES256解密
- (NSData *)zc_AES256DecryptWithKey:(NSString *)key;

@end
