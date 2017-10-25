//
//  NSDate+supp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZCDateFormatTime @"HH:mm"
#define ZCDateFormatDate @"yyyy-MM-dd"
#define ZCDateFormatDateTime @"yyyy-MM-dd HH:mm:ss"
#define ZCDateFormatTimeZone @"yyyy-MM-dd'T'HH:mm:ssZZZZ"

typedef NSDate *(^ChangeDateWithInt)(NSInteger);


@interface NSString (dataSupp)
@property(nonatomic, readonly) NSDate *(^toDate)(NSString *formartString);
@end

@interface NSDate (supp)

@property(nonatomic, readonly) NSDateComponents *dateComponents;
- (NSDate *)changDate:(void(^)(NSDateComponents *))block;

@property(nonatomic, readonly) BOOL isTodayDate;
- (BOOL)isEqualDayToDate:(NSDate *)date;
- (BOOL)isEqualDayToTime:(NSDate *)date;

@property(nonatomic, readonly) NSInteger weekDay;
@property(nonatomic, readonly) NSInteger year;
@property(nonatomic, readonly) ChangeDateWithInt setYear;
@property(nonatomic, readonly) NSInteger month;
@property(nonatomic, readonly) ChangeDateWithInt setMonth;
@property(nonatomic, readonly) NSInteger day;
@property(nonatomic, readonly) ChangeDateWithInt setDay;
@property(nonatomic, readonly) NSInteger hour;
@property(nonatomic, readonly) ChangeDateWithInt setHour;
@property(nonatomic, readonly) NSInteger minute;
@property(nonatomic, readonly) ChangeDateWithInt setMinute;
@property(nonatomic, readonly) NSInteger second;
@property(nonatomic, readonly) ChangeDateWithInt setSecond;

@property(nonatomic, readonly) NSUInteger countOfDaysInCurrentMonth;
@property(nonatomic, readonly) NSDate *firstDayOfCurrentMonth;
@property(nonatomic, readonly) NSDate *lastDayOfCurrentMonth;
@property(nonatomic, readonly) NSDate *toDayStartDate;
///获取上个月1号时间
@property(nonatomic, readonly) NSDate *previousMonthStartDate;
///获取下个月1号时间
@property(nonatomic, readonly) NSDate *nextMonthStartDate;

@property(nonatomic, readonly) NSString *timeDescription;
@property(nonatomic, readonly) NSString *(^format)(NSString *formatString);

@end
