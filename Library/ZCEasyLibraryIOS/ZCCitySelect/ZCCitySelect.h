//
//  ZCCitySelect.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/5/4.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCElasticControl.h"

@interface ZCCitySelect : ZCElasticControl

@property(nonatomic, assign) int zc_componentCount;

@property(nonatomic, copy) void(^zc_eventClick)(NSString *province, NSString *city, NSString *district, NSNumber *code);

@end
