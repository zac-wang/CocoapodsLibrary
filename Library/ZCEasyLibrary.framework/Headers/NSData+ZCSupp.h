//
//  NSData+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+ZCToString.h"

@interface NSData (ZCSupp)

///获取对应的json对象（字典or数组）
@property(nonatomic, readonly) id zc_toJsonObject;

@end
