//
//  ZCCalendar.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/25.
//  Copyright © 2017年 王志超. All rights reserved.
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
