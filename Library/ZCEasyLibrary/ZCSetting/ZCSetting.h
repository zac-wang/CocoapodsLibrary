//
//  ZCSetting.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/7.
//  Copyright © 2018年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCSetting : NSObject

+ (instancetype)shared;

@property(nonatomic, strong) NSUserDefaults *zc_userDefaults;


/// 设置默认值
- (void)zc_setDefaultValue:(id)value forKey:(NSString *)key;


/// 获取值
- (nullable id)zc_objectForKey:(NSString *)defaultName;

/// 获取值
- (NSInteger)zc_integerForKey:(NSString *)defaultName;

/// 获取值
- (double)zc_doubleForKey:(NSString *)defaultName;

/// 获取值
- (BOOL)zc_boolForKey:(NSString *)defaultName;

@end
