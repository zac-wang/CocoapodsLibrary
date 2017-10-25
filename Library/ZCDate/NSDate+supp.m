//
//  NSDate+supp.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "NSDate+supp.h"
#import "NSDateFormatter+supp.h"
#import "ZCCalendar.h"
#import "NSDateComponents+supp.h"

@implementation NSString (dataSupp)
- (NSDate *(^)(NSString *))toDate {
    return ^(NSString *formatString) {
        NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithFormatString:formatString];
        return [dateFormatter dateFromString:self];
    };
}
@end


@interface NSDate (supp1)
@end

@implementation NSDate (supp)

- (NSDateComponents *)dateComponents {
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *com = [[ZCCalendar shared] components:unitFlags fromDate:self];
    return com;
}

- (NSDate *)changDate:(void(^)(NSDateComponents *))block {
    NSDateComponents *com = self.dateComponents;
    block(com);
    return com.toDate;
}

- (BOOL)isTodayDate {
    return [self isEqualToDate:[NSDate date]];
}

- (BOOL)isEqualDayToDate:(NSDate *)date {
    return self.year == date.year && self.month == date.month && self.day == date.day;
}

- (BOOL)isEqualDayToTime:(NSDate *)date {
    return self.timeIntervalSince1970 == date.timeIntervalSince1970;
}

#pragma mark -
- (NSInteger)weekDay {
    return self.dateComponents.weekday;
}

- (NSInteger)year {
    return self.dateComponents.year;
}

- (ChangeDateWithInt)setYear {
    return ^(NSInteger year) {
        return [self changDate:^(NSDateComponents *com) {
            com.year = year;
        }];
    };
}

- (NSInteger)month {
    return self.dateComponents.month;
}

- (ChangeDateWithInt)setMonth {
    return ^(NSInteger month) {
        return [self changDate:^(NSDateComponents *com) {
            com.month = month;
        }];
    };
}

- (NSInteger)day {
    return self.dateComponents.month;
}

- (ChangeDateWithInt)setDay {
    return ^(NSInteger day) {
        return [self changDate:^(NSDateComponents *com) {
            com.day = day;
        }];
    };
}

- (NSInteger)hour {
    return self.dateComponents.month;
}

- (ChangeDateWithInt)setHour {
    return ^(NSInteger hour) {
        return [self changDate:^(NSDateComponents *com) {
            com.hour = hour;
        }];
    };
}

- (NSInteger)minute {
    return self.dateComponents.month;
}

- (ChangeDateWithInt)setMinute {
    return ^(NSInteger minute) {
        return [self changDate:^(NSDateComponents *com) {
            com.minute = minute;
        }];
    };
}

- (NSInteger)second {
    return self.dateComponents.month;
}

- (ChangeDateWithInt)setSecond {
    return ^(NSInteger second) {
        return [self changDate:^(NSDateComponents *com) {
            com.second = second;
        }];
    };
}

#pragma mark -
- (NSUInteger)countOfDaysInCurrentMonth {
    return [[ZCCalendar shared] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}

- (NSDate *)firstDayOfCurrentMonth {
    return self.setDay(1);
}

- (NSDate *)lastDayOfCurrentMonth {
    return self.setDay(self.countOfDaysInCurrentMonth);
}

- (NSDate *)toDayStartDate {
    return self.setHour(0).setMinute(0).setSecond(0);
}

- (NSDate *)previousMonthStartDate {
    return [self changDate:^(NSDateComponents *comps) {
        comps.day = 1;
        if(comps.month == 1){
            comps.year -= 1;
            comps.month = 12;
        }else{
            comps.month -= 1;
        }
    }].toDayStartDate;
}

- (NSDate *)nextMonthStartDate {
    return [self changDate:^(NSDateComponents *comps) {
        comps.day = 1;
        if(comps.month == 12){
            comps.year += 1;
            comps.month = 1;
        }else{
            comps.month += 1;
        }
    }].toDayStartDate;
}

#pragma mark -
- (NSString *(^)(NSString *))format {
    return ^(NSString *formatString) {
        NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithFormatString:formatString];
        return [dateFormatter stringFromDate:self];
    };
}

- (NSString *)timeDescription
{
    NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithFormatString:@"yyyy-MM-dd"];
    
    NSDate *nowDate = [NSDate date];
    NSTimeInterval time = [self timeIntervalSinceDate:nowDate.toDayStartDate];
    if ([self isTodayDate]) {
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
