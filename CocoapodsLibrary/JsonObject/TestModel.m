//
//  TestModel.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/11/4.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

- (NSString *)zc_customJsonKeyWithPropertyName:(NSString *)propertyName {
    return @{@"属性名":@"对应的json key名", @"m_age" : @"_age"}[propertyName];
}

- (NSString *)zc_customClassNameWithPropertyName:(NSString *)propertyName {
    return @{@"属性名":@"对应的类Class", @"m_array" : @"TestModel1"}[propertyName];
}

@end
