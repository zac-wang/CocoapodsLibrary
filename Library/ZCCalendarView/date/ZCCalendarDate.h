//
//  ZCCalendarDate.h
//  Calendar
//
//  Created by zac on 16/8/30.
//  Copyright © 2016年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCCalendarShowMothArray : NSObject

@property(nonatomic, strong) NSDateComponents *startCom;
@property(nonatomic, assign) NSUInteger total;

@end


@interface ZCCalendarDate : NSObject

+ (instancetype)sharedCalendarDate;

///获取当月日历显示数据
- (ZCCalendarShowMothArray *)getCalendarShowMothArrayWithDate:(NSDate *)date;

///获取阴历
- (NSString *)getLunarCalendar:(NSDateComponents *)dateComps;

@end
