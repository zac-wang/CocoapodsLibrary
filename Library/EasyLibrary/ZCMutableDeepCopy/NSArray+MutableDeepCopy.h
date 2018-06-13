//
//  NSArray+MutableDeepCopy.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/1/11.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MutableDeepCopy)

/// 深度Copy
@property(nonatomic, readonly) NSMutableArray *zc_mutableDeepCopy;

@end
