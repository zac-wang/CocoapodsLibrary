//
//  ZCCalendar.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/25.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    /// 星期日
    ZCCalendarSunday = 1,
    /// 星期一
    ZCCalendarMonday = 2,
    /// 星期二
    ZCCalendarTuesday = 3,
    /// 星期三
    ZCCalendarWednesday = 4,
    /// 星期四
    ZCCalendarThursday = 5,
    /// 星期五
    ZCCalendarFriday = 6,
    /// 星期六
    ZCCalendarSaturday = 7,
} ZCCalendarFirstWeekday;

@interface ZCCalendar : NSCalendar

+ (instancetype)shared;

@end
