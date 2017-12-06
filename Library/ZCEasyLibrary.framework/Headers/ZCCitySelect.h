//
//  ZCCitySelect.h
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/5/4.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCCitySelect : UIControl

+ (instancetype)citySelect;
- (instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic, assign) int componentCount;

@property(nonatomic, strong) UIView *picBackgrounndView;

@property(nonatomic, copy) void(^eventClick)(NSString *province, NSString *city, NSString *district, NSNumber *code);

@end
