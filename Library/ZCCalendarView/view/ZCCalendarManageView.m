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
#import <ZCEasyLibrary/UIView+ZCScreenCapture.h>

@interface ZCCalendarManageView () {
    UIImageView *oldImageView;
}

@end

@implementation ZCCalendarManageView
@synthesize calendarView;
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
        
        calendarView = [[ZCCalendarView alloc] init];
        [dayView addSubview:calendarView];
        oldImageView = [[UIImageView alloc] init];
        [dayView addSubview:oldImageView];
        oldImageView.hidden = YES;
    }
    self.date = nil;
}

- (void)setMonthFrame:(CGRect)_monthFrame {
    monthFrame = _monthFrame;
    self.frame = monthFrame;
    calendarView.frame = oldImageView.frame = calendarView.superview.frame = self.bounds;
}

- (void)setDate:(NSDate *)_date {
    oldImageView.image = calendarView.zc_screenCapture;
    calendarView.date = _date;
    [self setNeedsDisplay];
}

- (void)reloadData {
    [calendarView reloadData];
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
    //calendarView.frame = ({CGRect rect = calendarView.bounds; rect.origin.x = -rect.size.width; rect;}); // 左右
    calendarView.frame = ({CGRect rect = calendarView.bounds; rect.origin.y = -rect.size.height; rect;}); // 上下
    
    self.date = self.calendarView.date.zc_previousMonthStartDate;
}

- (void)changeNextMonth {
    //calendarView.frame = ({CGRect rect = calendarView.bounds; rect.origin.x = rect.size.width; rect; }); // 左右
    calendarView.frame = ({ CGRect rect = calendarView.bounds; rect.origin.y = rect.size.height; rect; }); // 上下
    
    self.date = self.calendarView.date.zc_nextMonthStartDate;
}

#pragma mark - 动画
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    oldImageView.frame = calendarView.bounds;
    oldImageView.hidden = NO;
    
    CGRect imgViewRect = calendarView.frame;
    imgViewRect.origin.x = -imgViewRect.origin.x;
    imgViewRect.origin.y = -imgViewRect.origin.y;
    [UIView animateWithDuration:(0.35) animations:^{
        self->oldImageView.frame = imgViewRect;
        self->calendarView.frame = self->calendarView.bounds;
    } completion:^(BOOL finished) {
        self->oldImageView.hidden = YES;
    }];
}

@end
