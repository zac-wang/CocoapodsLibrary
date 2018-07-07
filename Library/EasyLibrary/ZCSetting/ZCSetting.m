//
//  ZCSetting.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/7.
//  Copyright © 2018年 zac. All rights reserved.
//

#import "ZCSetting.h"

@interface ZCSetting()
@property(nonatomic, strong) NSMutableDictionary *defaultValueDictionary;
@end

@implementation ZCSetting

+ (instancetype)shared {
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.zc_userDefaults = [NSUserDefaults standardUserDefaults];
        self.zc_beSujectSettingFile = NO;
        self.defaultValueDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)zc_setDefaultValue:(NSString *)value forKey:(NSString *)key {
    id oldValue = [self.zc_userDefaults objectForKey:key];
    if(!oldValue) {
        [self.zc_userDefaults setValue:value forKey:key];
    }
    [self.defaultValueDictionary setValue:value forKey:key];
}

- (nullable id)zc_objectForKey:(NSString *)defaultName {
    id value = [self.zc_userDefaults objectForKey:defaultName];
    if(!value) {
        value = self.defaultValueDictionary[defaultName];
    }
    return value;
}

- (NSInteger)zc_integerForKey:(NSString *)defaultName {
    NSNumber *value = [self.zc_userDefaults objectForKey:defaultName];
    if(!value) {
        value = self.defaultValueDictionary[defaultName];
    }
    return [self.defaultValueDictionary[defaultName] integerValue];
}

- (double)zc_doubleForKey:(NSString *)defaultName {
    NSNumber *value = [self.zc_userDefaults objectForKey:defaultName];
    if(!value) {
        value = self.defaultValueDictionary[defaultName];
    }
    return [self.defaultValueDictionary[defaultName] doubleValue];
}

- (BOOL)zc_boolForKey:(NSString *)defaultName {
    NSNumber *value = [self.zc_userDefaults objectForKey:defaultName];
    if(!value) {
        value = self.defaultValueDictionary[defaultName];
    }
    return [self.defaultValueDictionary[defaultName] boolValue];
}

@end
