//
//  CalendarView.h
//  Calendar
//
//  Created by wangzhichao on 16/8/30.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCalendarView.h"
#import "CalendarDayCell.h"

@interface CalendarView : UIView

- (void)initialView;

@property(nonatomic, strong) NSDate *date;
@property(nonatomic, assign) CGRect monthFrame;
@property(nonatomic, weak)   id<ZCCalendarViewDelegate, ZCCalendarViewFrameDelegate> delegate;

///已选择的日期
@property(nonatomic, readonly) NSArray<NSDateComponents *> *selectDays;

- (void)reloadData;

- (void)changePreviousMonth;
- (void)changeNextMonth;


@end
