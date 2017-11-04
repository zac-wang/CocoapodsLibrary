//
//  ZCBaseJsonModel.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/11/4.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCBaseJsonModel : NSObject

+ (instancetype)zc_objectWithJson:(NSDictionary *)json;
- (void)zc_objectWithJson:(NSDictionary *)json;

- (NSDictionary *)zc_toDictionary;




#pragma mark - 重写
/// 设置属性公共头（例：m_）
- (NSString *)customPrefix;
/// 设置【 属性名：对应json key关系 】特殊情况
- (NSString *)zc_customJsonKeyWithPropertyName:(NSString *)propertyName;
/// 如属性中有数组类型，必须声明对应关系【 属性名：元素Class 】
- (NSString *)zc_customClassNameWithPropertyName:(NSString *)propertyName;

@end
