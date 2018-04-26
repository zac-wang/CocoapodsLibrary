//
//  ZCCitySelect.h
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/5/4.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import "ZCElasticControl.h"

@interface ZCCitySelect : ZCElasticControl

- (instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic, assign) int zc_componentCount;

@property(nonatomic, copy) void(^zc_eventClick)(NSString *province, NSString *city, NSString *district, NSNumber *code);

@end
