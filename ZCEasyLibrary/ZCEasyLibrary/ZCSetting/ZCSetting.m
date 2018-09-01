//
//  ZCSetting.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/7.
//  Copyright © 2018年 love_iphone@qq.com. All rights reserved.
//

#import "ZCSetting.h"

@interface ZCSetting()
@property(nonatomic, strong) NSDictionary *settigBundleInfo;
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
        
        NSString *setBundlePath = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
        NSString *settingInfoPath = [setBundlePath stringByAppendingPathComponent:@"Root.plist"];
        self.settigBundleInfo = [NSDictionary dictionaryWithContentsOfFile:settingInfoPath];
    }
    return self;
}

- (void)zc_setDefaultValue:(id)value forKey:(NSString *)key {
    [self.zc_userDefaults setValue:value forKey:key];
    [self.zc_userDefaults synchronize];
}

- (nullable id)zc_objectForKey:(NSString *)defaultName {
    id value = [self.zc_userDefaults objectForKey:defaultName];
    if(value) { // 本地有值
        return value;
    }else if(self.settigBundleInfo) {
        NSArray *arr = self.settigBundleInfo[@"PreferenceSpecifiers"];
        for (NSDictionary *dic in arr) {
            if([defaultName isEqualToString:dic[@"Key"]]) {
                return dic[@"DefaultValue"];
            }
        }
    }
    return nil;
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
