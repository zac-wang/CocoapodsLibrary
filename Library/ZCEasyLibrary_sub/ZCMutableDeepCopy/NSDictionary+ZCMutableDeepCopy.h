//
//  NSDictionary+ZCMutableDeepCopy.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/1/11.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZCMutableDeepCopy)

/// 深度Copy
@property(nonatomic, readonly) NSMutableDictionary *zc_mutableDeepCopy;

@end
