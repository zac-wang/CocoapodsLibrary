//
//  ZCCalendarManageView.h
//  Calendar
//
//  Created by zac on 2017/10/20.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCalendarView.h"

@interface ZCCalendarManageView : UIView

- (void)initialView;
@property(nonatomic, readwrite) CGRect monthFrame;

@property(nonatomic, readonly) ZCCalendarView *calendarView;



- (void)changePreviousMonth;
- (void)changeNextMonth;

@end
