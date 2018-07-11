//
//  ZCSetting.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/7.
//  Copyright © 2018年 love_iphone@qq.com. All rights reserved.
//

#import "ZCSetting.h"

@interface ZCSetting() {
    BOOL haveSetting;
}
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
        
        haveSetting = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
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
    if(!value) { // 本地无值
        return self.defaultValueDictionary[defaultName];
    }else if(self.zc_beSujectSettingFile && haveSetting) {
        return value;
    }else if(self.zc_beSujectSettingFile && !haveSetting) {
        return self.defaultValueDictionary[defaultName];
    }else {
        return value;
    }
}

- (NSInteger)zc_integerForKey:(NSString *)defaultName {
    NSNumber *value = [self zc_objectForKey:defaultName];
    return [value integerValue];
}

- (double)zc_doubleForKey:(NSString *)defaultName {
    NSNumber *value = [self zc_objectForKey:defaultName];
    return [value doubleValue];
}

- (BOOL)zc_boolForKey:(NSString *)defaultName {
    NSNumber *value = [self zc_objectForKey:defaultName];
    return [value boolValue];
}

@end
