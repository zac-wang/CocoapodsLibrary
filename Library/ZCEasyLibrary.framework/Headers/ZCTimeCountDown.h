//
//  ZCTimeCountDown.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/12/9.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCTimeCountDown : NSObject

+ (instancetype)shared;

/// 触发时间间隔
@property (nonatomic, assign) int zc_timeInterval;
/// 开始倒计时
- (void)zc_start;
/// 倒计时是否正在进行中
@property (nonatomic, readonly) BOOL zc_isStarting;
/// 更新剩余秒数
- (void)zc_updateSecond:(void(^)(int second))updateBlock completionHandler:(void(^)(void))completionHandler;

@end
