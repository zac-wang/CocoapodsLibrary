//
//  ZCCalendarManageView.m
//  Calendar
//
//  Created by zac on 2017/10/20.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCCalendarManageView.h"
#import <ZCEasyLibrary/NSDate+ZCSupp.h>
#import <ZCEasyLibrary/ZCCalendar.h>

@interface ZCCalendarManageView () {
    ZCCalendarView *oldView;
    ZCCalendarView *newView;
    BOOL isAnimat;
}

@end

@implementation ZCCalendarManageView
@synthesize nowShowCalendarView = newView;
@synthesize monthFrame;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialView];
        self.monthFrame = frame;
    }
    return self;
}

#pragma mark - init view
- (void)initialView {
    isAnimat = NO;
    self.date = [NSDate date];
    [ZCCalendar shared].firstWeekday = ZCCalendarSunday;
    
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    
    [self addSwipeGesture];
    
    {
        UIView *dayView = [[UIView alloc] init];
        dayView.backgroundColor = [UIColor clearColor];
        dayView.layer.masksToBounds = YES;
        [self addSubview:dayView];
        
        newView = [[ZCCalendarView alloc] init];
        oldView = [[ZCCalendarView alloc] init];
        [dayView addSubview:newView];
        [dayView addSubview:oldView];
    }
    self.date = nil;
}

- (void)setMonthFrame:(CGRect)_monthFrame {
    monthFrame = _monthFrame;
    self.frame = monthFrame;
    newView.frame = oldView.frame = newView.superview.frame = self.bounds;
}

- (void)setSetCalendarView:(void (^)(ZCCalendarView *))block {
    if(block) {
        block(newView);
        block(oldView);
    }
}

- (void)setDate:(NSDate *)_date {
    oldView.date = _date;
    [self setNeedsDisplay];
}

- (void)reloadData {
    [newView reloadData];
}

#pragma mark - 切换月份
- (void)addSwipeGesture{
    UISwipeGestureRecognizer *previousSGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changePreviousMonth)];
    [previousSGR setDirection:UISwipeGestureRecognizerDirectionDown];
    [self addGestureRecognizer:previousSGR];
    
    UISwipeGestureRecognizer *nextSGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeNextMonth)];
    [nextSGR setDirection:UISwipeGestureRecognizerDirectionUp];
    [self addGestureRecognizer:nextSGR];
}

- (void)changePreviousMonth {
    isAnimat = YES;
    //oldView.frame = ({CGRect rect = oldView.frame; rect.origin.x = -rect.size.width; rect;}); // 左右
    oldView.frame = ({CGRect rect = oldView.frame; rect.origin.y = -rect.size.height; rect;}); // 上下
    self.date = self.nowShowCalendarView.date.zc_previousMonthStartDate;
}

- (void)changeNextMonth {
    isAnimat = YES;
    //oldView.frame = ({CGRect rect = oldView.frame; rect.origin.x = rect.size.width; rect;}); // 左右
    oldView.frame = ({CGRect rect = oldView.frame; rect.origin.y = rect.size.height; rect;}); // 上下
    self.date = self.nowShowCalendarView.date.zc_nextMonthStartDate;
}

#pragma mark - 动画
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    oldView.hidden = NO;
    
    [UIView animateWithDuration:(isAnimat ? 0.35 : 0) animations:^{
        CGRect tmp = self->oldView.frame;
        self->oldView.frame = ({ CGRect rect = self->oldView.frame; rect.origin.y = 0; rect.origin.x = 0; rect; });
        self->newView.frame = ({ CGRect rect = self->newView.frame; rect.origin.y = -tmp.origin.y; rect.origin.x = -tmp.origin.x; rect; });
    } completion:^(BOOL finished) {
        id tmp = self->oldView;
        self->oldView = self->newView;
        self->newView = tmp;
        
        self->oldView.hidden = YES;
    }];
    isAnimat = NO;
}

@end
