//
//  NSDate+ZCSupp.h
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


@interface NSNumber (ZCDateSupp)
@property(nonatomic, readonly) NSDate *zc_toDate;
@end

@interface NSString (ZCDateSupp)
@property(nonatomic, readonly) NSDate *(^zc_toDate)(NSString *formartString);
@end

@interface NSDate (ZCSupp)

@property(nonatomic, readonly) NSDateComponents *zc_dateComponents;
- (NSDate *)zc_changDate:(void(^)(NSDateComponents *))block;

@property(nonatomic, readonly) BOOL zc_isToday;
- (BOOL)zc_isEqualDay:(NSDate *)date;
- (BOOL)zc_isEqualDate:(NSDate *)date;

@property(nonatomic, readonly) NSInteger zc_weekDay;
@property(nonatomic, readonly) NSInteger zc_year;
@property(nonatomic, readonly) ChangeDateWithInt zc_setYear;
@property(nonatomic, readonly) NSInteger zc_month;
@property(nonatomic, readonly) ChangeDateWithInt zc_setMonth;
@property(nonatomic, readonly) NSInteger zc_day;
@property(nonatomic, readonly) ChangeDateWithInt zc_setDay;
@property(nonatomic, readonly) NSInteger zc_hour;
@property(nonatomic, readonly) ChangeDateWithInt zc_setHour;
@property(nonatomic, readonly) NSInteger zc_minute;
@property(nonatomic, readonly) ChangeDateWithInt zc_setMinute;
@property(nonatomic, readonly) NSInteger zc_second;
@property(nonatomic, readonly) ChangeDateWithInt zc_setSecond;

///所在月天数
@property(nonatomic, readonly) NSUInteger zc_countOfDaysInCurrentMonth;
///所在月第一天凌晨0点
@property(nonatomic, readonly) NSDate *zc_firstDayOfCurrentMonth;
///所在月最后一天凌晨0点
@property(nonatomic, readonly) NSDate *zc_lastDayOfCurrentMonth;
///当天凌晨0点
@property(nonatomic, readonly) NSDate *zc_toDayStartDate;
///获取上个月1号时间
@property(nonatomic, readonly) NSDate *zc_previousMonthStartDate;
///获取下个月1号时间
@property(nonatomic, readonly) NSDate *zc_nextMonthStartDate;

@property(nonatomic, readonly) NSString *zc_description;
@property(nonatomic, readonly) NSString *(^zc_format)(NSString *formatString);
@property(nonatomic, readonly) NSString *(^zc_formatAndRemoveTimeZoneString)(NSString *formatString);

@end
