//
//  ZCTimeCountDown.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/12/9.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCTimeCountDown.h"

@interface ZCTimeCountDown()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSDate *countDownStopDate;
@property (nonatomic, copy  ) void(^zc_updateSecond)(int second);
@property (nonatomic, copy  ) void(^zc_completionHandler)(void);
@end

@implementation ZCTimeCountDown

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
        self.zc_timeInterval = 60;
    }
    return self;
}

- (void)zc_start {
    if(self.zc_isStarting) {
        NSLog(@"还不可以重新倒计时");
        return;
    }
    self.countDownStopDate = [NSDate dateWithTimeIntervalSinceNow:self.zc_timeInterval];
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(eachSecondUpdateConfirmationCode:) userInfo:@{} repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self eachSecondUpdateConfirmationCode:self.timer];
}

- (void)zc_stop {
    if(self.timer) {
        [self.timer invalidate];
        self.timer = nil;
        if(self.zc_completionHandler) {
            self.zc_completionHandler();
        }
    }
}

- (BOOL)zc_isStarting {
    BOOL isEnd = self.countDownStopDate.timeIntervalSinceNow < 1;
    if(isEnd)
        [self zc_stop];
    return !isEnd;
}

- (void)zc_updateSecond:(void (^)(int))updateBlock completionHandler:(void (^)(void))completionHandler {
    self.zc_updateSecond = updateBlock;
    self.zc_completionHandler = completionHandler;
}

- (void)eachSecondUpdateConfirmationCode:(NSTimer *)time {
    int second = self.countDownStopDate.timeIntervalSinceNow;
    if(second < 1) {
        [self zc_stop];
    }else if(self.zc_updateSecond) {
        self.zc_updateSecond(second);
    }
}

@end
