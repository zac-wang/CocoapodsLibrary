//
//  NSDictionary+ZCMutableDeepCopy.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/1/11.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZCMutableDeepCopy)

/// 深度Copy
@property(nonatomic, readonly) NSMutableDictionary *zc_mutableDeepCopy;

@end
