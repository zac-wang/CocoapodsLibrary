//
//  ZCCalendarDate.m
//  Calendar
//
//  Created by wangzhichao on 16/8/30.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import "ZCCalendarDate.h"
#import "ZCCalendarDateLunarCalendar.h"
#import "ZCCalendar.h"
#import "NSDateComponents+ZCSupp.h"
#import "NSDate+ZCSupp.h"

#define ChDay @[@"*",@"初一",@"初二",@"初三",@"初四",@"初五",\
                @"初六",@"初七",@"初八",@"初九",@"初十",\
                @"十一",@"十二",@"十三",@"十四",@"十五",\
                @"十六",@"十七",@"十八",@"十九",@"二十",\
                @"廿一",@"廿二",@"廿三",@"廿四",@"廿五",\
                @"廿六",@"廿七",@"廿八",@"廿九",@"三十",@" "]
#define ChMonth @[@"*",@"正月",@"二月",@"三月",@"四月",@"五月",@"六月",\
                @"七月",@"八月",@"九月",@"十月",@"十一月",@"腊月"]

@implementation ZCCalendarShowMothArray
- (NSString *)description {
    return [NSString stringWithFormat:@"startDate:%@, count:%ld", self.startCom, (unsigned long)self.total];
}
@end

@interface ZCCalendarDate ()
@end

@implementation ZCCalendarDate

+ (instancetype)sharedCalendarDate {
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (ZCCalendarShowMothArray *)getCalendarShowMothArrayWithDate:(NSDate *)date{
    NSDate *nowMonthFirstDayDate = date.zc_firstDayOfCurrentMonth;

    int previousCount = (nowMonthFirstDayDate.zc_weekday - [ZCCalendar shared].firstWeekday + 7)%7;
    NSDate *previousDateLastDayDate = [nowMonthFirstDayDate dateByAddingTimeInterval:-24*60*60];
    NSUInteger previousMonthTotal = previousDateLastDayDate.zc_countOfDaysInCurrentMonth;

    ZCCalendarShowMothArray *array = [[ZCCalendarShowMothArray alloc] init];
    array.startCom = [[NSDateComponents alloc] init];
    array.startCom.year = date.zc_month == 1 ? (date.zc_year - 1) : date.zc_year;
    array.startCom.month = date.zc_month == 1 ? 12 : date.zc_month - 1;
    array.startCom.day = previousMonthTotal - previousCount + 1;
    array.total = previousCount + nowMonthFirstDayDate.zc_countOfDaysInCurrentMonth + (7*6 - (previousCount + nowMonthFirstDayDate.zc_countOfDaysInCurrentMonth))%7;
    return array;
}

- (NSString *)getLunarCalendar:(NSDateComponents *)dateComps {
    NSString *str = @"";
    unsigned int LunarCalendarDay;
    if (LunarCalendar((int)dateComps.year, (int)dateComps.month, (int)dateComps.day, &LunarCalendarDay))
        str = [str stringByAppendingString:@"闰"];
    int moth = (LunarCalendarDay & 0x3C0) >> 6;
    int day = LunarCalendarDay & 0x3F;
    if(moth >= ChMonth.count || day >= ChDay.count)
        return nil;
    str = [str stringByAppendingString:ChMonth[moth]];
    str = [str stringByAppendingString:ChDay[day]];
    return str;
}

@end
