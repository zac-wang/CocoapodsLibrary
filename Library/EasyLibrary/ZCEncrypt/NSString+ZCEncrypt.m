//
//  NSString+ZCEncrypt.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSString+ZCEncrypt.h"
#import "NSString+ZCSupp.h"
#import "NSData+ZCEncrypt.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (ZCEncrypt)

- (NSString *)zc_md5 {
    return self.zc_data.zc_md5;
}

- (NSString *)zc_sha1 {
    return self.zc_data.zc_sha1;
}

#define EveryTimeReadSize 64 * 1024 * 1024
- (NSString *) zc_fileMd5 {
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:self];
    if( handle== nil ) {
        return nil;
    }
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    while(true) {
        @autoreleasepool {
            NSData *fileData = [handle readDataOfLength:EveryTimeReadSize];
            CC_MD5_Update(&md5, [fileData bytes], (CC_LONG)[fileData length]);
            if([fileData length] == 0)
                break;
        }
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSMutableString *hash =[NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [hash appendFormat:@"%02x", digest[i]];
    
    return hash;
}

- (NSString *)zc_base64 {
    return self.zc_data.zc_base64;
}

- (NSData *)zc_base64DecodeData {
    return [[NSData alloc] initWithBase64EncodedString:self options:0];
}

- (NSString *)zc_base64DecodeString {
    return [[NSString alloc] initWithData:self.zc_base64DecodeData encoding:NSASCIIStringEncoding];
}

@end
