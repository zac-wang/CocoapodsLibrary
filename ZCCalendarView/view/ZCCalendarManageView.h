//
//  ZCCalendarManageView.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/20.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCalendarView.h"

@interface ZCCalendarManageView : UIView

- (void)initialView;
@property(nonatomic, readwrite) CGRect monthFrame;

@property(nonatomic, assign) void (^setCalendarView)(ZCCalendarView *calendarView);
@property(nonatomic, readonly) ZCCalendarView *nowShowCalendarView;



- (void)changePreviousMonth;
- (void)changeNextMonth;

@end
