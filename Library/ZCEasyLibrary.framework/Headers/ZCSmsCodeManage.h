//
//  ZCSmsCodeManage.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/12/9.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCSmsCodeManage : NSObject

+ (instancetype)shared;

/// 短信发送时间间隔(秒)
@property (nonatomic, assign) int zc_timeInterval;
/// 是否可以重新发送短信验证码
@property (nonatomic, readonly) BOOL zc_isCanPostSmsCode;
/// 开始计数
- (void)zc_start;
/// 更新剩余秒数
- (void)zc_updateSecond:(void(^)(int second))updateBlock completionHandler:(void(^)(void))completionHandler;

@end
