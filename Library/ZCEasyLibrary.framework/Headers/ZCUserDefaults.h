//
//  ZCUserDefaults.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZCUserDefaultsGetObject(_key_) [[NSUserDefaults standardUserDefaults] objectForKey:_key_]

@interface ZCUserDefaults : NSObject

/**
 保存数据

 @param block 设置要保存的数据
 */
+ (void)zc_save:(void(^)(NSUserDefaults *))block;

@end
