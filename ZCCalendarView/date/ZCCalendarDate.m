//
//  ZCCalendarDate.m
//  Calendar
//
//  Created by wangzhichao on 16/8/30.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import "ZCCalendarDate.h"

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
    return [NSString stringWithFormat:@"%ld-%ld, %ld-%ld, %ld-%ld", self.previousMonthStartDay, self.previousMonthTotal, self.nowMonthStartDay, self.nowMonthTotal, self.nextMonthStartDay, self.nextMonthTotal];
}
@end

@interface ZCCalendarDate (){
    NSCalendar *calendar;
}
@end

@implementation ZCCalendarDate
@synthesize weekStart;

+ (instancetype)sharedCalendarDate {
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
        calendar = [NSCalendar currentCalendar];
        self.weekStart = ZCCalendarFirstWeekday_Sunday;
    }
    return self;
}

- (void)setWeekStart:(ZCCalendarFirstWeekday)_weekStart {
    weekStart = _weekStart;
    calendar.firstWeekday = _weekStart;
}

- (NSDateComponents *)dateComponentsWithDate:(NSDate *)date {
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *com = [calendar components:unitFlags fromDate:date];
    return com;
}

- (NSDate *)dateWithDateComponents:(NSDateComponents *)dateComps {
    NSDate *date = [calendar dateFromComponents:dateComps];
    return date;
}

- (NSDate *)previousMonthWithDate:(NSDate *)date{
    NSDateComponents *comps = [self dateComponentsWithDate:date];
    comps.day = 1;
    if(comps.month == 1){
        comps.year -= 1;
        comps.month = 12;
    }else{
        comps.month -= 1;
    }
    return [calendar dateFromComponents:comps];
}

- (NSDate *)nextMonthWithDate:(NSDate *)date{
    NSDateComponents *comps = [self dateComponentsWithDate:date];
    comps.day = 1;
    if(comps.month == 12){
        comps.year += 1;
        comps.month = 1;
    }else{
        comps.month += 1;
    }
    return [calendar dateFromComponents:comps];
}

- (ZCCalendarShowMothArray *)getCalendarShowMothArrayWithDate:(NSDate *)date{
    NSDateComponents *currentCom = [self dateComponentsWithDate:date];
    currentCom.day = 1;

    NSDate *nowMonthFirstDayDate = [self dateWithDateComponents:currentCom];
    NSUInteger nowMonthTotal = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:nowMonthFirstDayDate].length;

    int previousCount = ([self dateComponentsWithDate:nowMonthFirstDayDate].weekday - self.weekStart + 7)%7;
    NSDate *previousDateLastDayDate = [nowMonthFirstDayDate dateByAddingTimeInterval:-24*60*60];
    NSUInteger previousMonthTotal = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:previousDateLastDayDate].length;

    ZCCalendarShowMothArray *array = [[ZCCalendarShowMothArray alloc] init];
    array.previousMonthOfYear = currentCom.month == 1 ? (currentCom.year - 1) : currentCom.year;
    array.previousMonth = currentCom.month == 1 ? 12 : currentCom.month - 1;
    array.previousMonthStartDay = previousMonthTotal - previousCount + 1;
    array.previousMonthTotal = previousCount;
    
    array.nowMonthOfYear = currentCom.year;
    array.nowMonth = currentCom.month;
    array.nowMonthStartDay = 1;
    array.nowMonthTotal = nowMonthTotal;
    
    array.nextMonthOfYear = currentCom.month == 12 ? (currentCom.year + 1) : currentCom.year;
    array.nextMonth = currentCom.month == 12 ? 1 : currentCom.month + 1;
    array.nextMonthStartDay = 1;
    array.nextMonthTotal = (7*6 - (array.previousMonthTotal + array.nowMonthTotal))%7;
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
