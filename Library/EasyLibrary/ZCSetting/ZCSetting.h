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


/**
 是否以Setting.bundle文件为准，默认NO
    YES：若文件存在 且 userDefaults有值，则返回此值；否则文件不存在 则返回默认值
    NO ：userDefaults有值，则返回；否则返回默认值
 */
@property(nonatomic, assign) BOOL zc_beSujectSettingFile;


/// 设置默认值
- (void)zc_setDefaultValue:(NSString *)value forKey:(NSString *)key;


/// 获取值
- (nullable id)zc_objectForKey:(NSString *)defaultName;

/// 获取值
- (NSInteger)zc_integerForKey:(NSString *)defaultName;

/// 获取值
- (double)zc_doubleForKey:(NSString *)defaultName;

/// 获取值
- (BOOL)zc_boolForKey:(NSString *)defaultName;

@end
