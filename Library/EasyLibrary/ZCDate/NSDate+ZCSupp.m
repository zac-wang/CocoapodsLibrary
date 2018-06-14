//
//  NSDate+ZCSupp.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/23.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSDate+ZCSupp.h"
#import "NSDateFormatter+ZCSupp.h"
#import "ZCCalendar.h"
#import "NSDateComponents+ZCSupp.h"

@implementation NSNumber (ZCDateSupp)
- (NSDate *)zc_toDate {
    NSTimeInterval time = [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return date;
}
@end

@implementation NSString (ZCDateSupp)
- (NSDate *)zc_dateFromString:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [NSDateFormatter zc_formatWithFormat:formatString];
    return [dateFormatter dateFromString:self];
}
- (NSDate *(^)(NSString *))zc_toDate {
    return ^(NSString *formatString) {
        return [self zc_dateFromString:formatString];
    };
}
@end

@implementation NSDate (ZCSupp)

- (NSDateComponents *)zc_dateComponents {
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *com = [[ZCCalendar shared] components:unitFlags fromDate:self];
    return com;
}

- (NSDate *)zc_changDate:(void (^)(NSDateComponents *))block {
    NSDateComponents *com = self.zc_dateComponents;
    block(com);
    return com.zc_toDate;
}

- (BOOL)zc_isToday {
    return [self zc_isEqualDay:[NSDate date]];
}

- (BOOL)zc_isEqualDay:(NSDate *)date {
    return self.zc_year == date.zc_year && self.zc_month == date.zc_month && self.zc_day == date.zc_day;
}

- (BOOL)zc_isEqualDate:(NSDate *)date {
    return self.timeIntervalSince1970 == date.timeIntervalSince1970;
}

#pragma mark -
- (NSInteger)zc_weekday {
    return self.zc_dateComponents.weekday;
}

- (ChangeDateWithInt)zc_setWeekday {
    return ^(NSInteger weekday) {
        return [self zc_changDate:^(NSDateComponents *com) {
            com.weekday = weekday;
        }];
    };
}

- (NSInteger)zc_year {
    return self.zc_dateComponents.year;
}

- (ChangeDateWithInt)zc_setYear {
    return ^(NSInteger year) {
        return [self zc_changDate:^(NSDateComponents *com) {
            com.year = year;
        }];
    };
}

- (NSInteger)zc_month {
    return self.zc_dateComponents.month;
}

- (ChangeDateWithInt)zc_setMonth {
    return ^(NSInteger month) {
        return [self zc_changDate:^(NSDateComponents *com) {
            com.month = month;
        }];
    };
}

- (NSInteger)zc_day {
    return self.zc_dateComponents.day;
}

- (ChangeDateWithInt)zc_setDay {
    return ^(NSInteger day) {
        return [self zc_changDate:^(NSDateComponents *com) {
            com.day = day;
        }];
    };
}

- (NSInteger)zc_hour {
    return self.zc_dateComponents.hour;
}

- (ChangeDateWithInt)zc_setHour {
    return ^(NSInteger hour) {
        return [self zc_changDate:^(NSDateComponents *com) {
            com.hour = hour;
        }];
    };
}

- (NSInteger)zc_minute {
    return self.zc_dateComponents.minute;
}

- (ChangeDateWithInt)zc_setMinute {
    return ^(NSInteger minute) {
        return [self zc_changDate:^(NSDateComponents *com) {
            com.minute = minute;
        }];
    };
}

- (NSInteger)zc_second {
    return self.zc_dateComponents.second;
}

- (ChangeDateWithInt)zc_setSecond {
    return ^(NSInteger second) {
        return [self zc_changDate:^(NSDateComponents *com) {
            com.second = second;
        }];
    };
}

#pragma mark -
- (NSUInteger)zc_countOfDaysInCurrentMonth {
    return [[ZCCalendar shared] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}

- (NSDate *)zc_firstDayOfCurrentMonth {
    return self.zc_setDay(1);
}

- (NSDate *)zc_lastDayOfCurrentMonth {
    return self.zc_setDay(self.zc_countOfDaysInCurrentMonth);
}

- (NSDate *)zc_toDayStartDate {
    return self.zc_setHour(0).zc_setMinute(0).zc_setSecond(0);
}

- (NSDate *)zc_previousMonthStartDate {
    return [self zc_changDate:^(NSDateComponents *comps) {
        comps.day = 1;
        if(comps.month == 1){
            comps.year -= 1;
            comps.month = 12;
        }else{
            comps.month -= 1;
        }
    }].zc_toDayStartDate;
}

- (NSDate *)zc_nextMonthStartDate {
    return [self zc_changDate:^(NSDateComponents *comps) {
        comps.day = 1;
        if(comps.month == 12){
            comps.year += 1;
            comps.month = 1;
        }else{
            comps.month += 1;
        }
    }].zc_toDayStartDate;
}

#pragma mark -
- (NSString *)zc_format:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [NSDateFormatter zc_formatWithFormat:formatString];
    return [dateFormatter stringFromDate:self];
}

- (NSString *(^)(NSString *))zc_format {
    return ^(NSString *formatString) {
        return [self zc_format:formatString];
    };
}

- (NSString *(^)(NSString *))zc_formatAndRemoveTimeZoneString {
    return ^(NSString *formatString) {
        NSString *string = self.zc_format(formatString);
        return [string stringByReplacingOccurrencesOfString:@"GMT" withString:@""];
    };
}

- (NSString *)zc_description
{
    NSDateFormatter *dateFormatter = [NSDateFormatter zc_formatWithFormat:@"yyyy-MM-dd"];
    
    NSDate *nowDate = [NSDate date];
    NSTimeInterval time = [self timeIntervalSinceDate:nowDate.zc_toDayStartDate];
    if ([self zc_isToday]) {
        [dateFormatter setDateFormat:@"ah:mm"];
        return [dateFormatter stringFromDate:self];
    } else if (time > 0) {//one day later
    } else if (time > -24*60*60) {//one day ago
        [dateFormatter setDateFormat:@"ah:mm"];
        return [dateFormatter stringFromDate:self];
    } else if (time > -24*60*60 * 7) {//within a week
        [dateFormatter setDateFormat:@"EEEE ah:mm"];
        return [dateFormatter stringFromDate:self];
    }
    [dateFormatter setDateFormat:@"yyyy-MM-dd ah:mm"];
    return [dateFormatter stringFromDate:self];
}

@end
