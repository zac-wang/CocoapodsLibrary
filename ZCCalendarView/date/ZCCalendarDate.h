//
//  ZCCalendarDate.h
//  Calendar
//
//  Created by wangzhichao on 16/8/30.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ZCCalendarFirstWeekday_Sunday = 1,
    ZCCalendarFirstWeekday_Monday = 2,
    ZCCalendarFirstWeekday_Tuesday = 3,
    ZCCalendarFirstWeekday_Wednesday = 4,
    ZCCalendarFirstWeekday_Thursday = 5,
    ZCCalendarFirstWeekday_Friday = 6,
    ZCCalendarFirstWeekday_Saturday = 7,
} ZCCalendarFirstWeekday;

@interface ZCCalendarShowMothArray : NSObject

@property(nonatomic, assign) NSUInteger previousMonthOfYear;
@property(nonatomic, assign) NSUInteger previousMonth;
@property(nonatomic, assign) NSUInteger previousMonthStartDay;
@property(nonatomic, assign) NSUInteger previousMonthTotal;

@property(nonatomic, assign) NSUInteger nowMonthOfYear;
@property(nonatomic, assign) NSUInteger nowMonth;
@property(nonatomic, assign) NSUInteger nowMonthStartDay;
@property(nonatomic, assign) NSUInteger nowMonthTotal;

@property(nonatomic, assign) NSUInteger nextMonthOfYear;
@property(nonatomic, assign) NSUInteger nextMonth;
@property(nonatomic, assign) NSUInteger nextMonthStartDay;
@property(nonatomic, assign) NSUInteger nextMonthTotal;

@end


@interface ZCCalendarDate : NSObject

+ (instancetype)sharedCalendarDate;

///设置日历的第一列为周几
@property(nonatomic, assign) ZCCalendarFirstWeekday weekStart;

- (NSDateComponents *)dateComponentsWithDate:(NSDate *)date;
- (NSDate *)dateWithDateComponents:(NSDateComponents *)dateComps;

///获取上个月日期
- (NSDate *)previousMonthWithDate:(NSDate *)date;
///获取下个月日期
- (NSDate *)nextMonthWithDate:(NSDate *)date;

///获取当月日历显示数据
- (ZCCalendarShowMothArray *)getCalendarShowMothArrayWithDate:(NSDate *)date;

///获取阴历
- (NSString *)getLunarCalendar:(NSDateComponents *)dateComps;

@end
