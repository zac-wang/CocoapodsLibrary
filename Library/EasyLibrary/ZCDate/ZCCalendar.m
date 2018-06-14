//
//  ZCCalendar.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/25.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCCalendar.h"

@implementation ZCCalendar

+ (instancetype)shared {
    static ZCCalendar *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = (ZCCalendar *)[self currentCalendar];
        _sharedInstance.firstWeekday = ZCCalendarSunday;
    });
    return _sharedInstance;
}

@end
