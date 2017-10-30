//
//  NSData+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZCSupp)

@property (nonatomic, readonly) NSString *zc_md5;
@property (nonatomic, readonly) NSString *zc_sha1;
@property (nonatomic, readonly) NSString *zc_base64;

@end
