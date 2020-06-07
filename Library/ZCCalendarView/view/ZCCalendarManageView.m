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

- (instancetype)initWithMaxFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialVariable];
        [self initialView];
        
        oldImageView.frame = self.bounds;
        calendarView.frame = self.bounds;
        calendarView.superview.frame = self.bounds;
        
        self.frame = frame;
    }
    return self;
}

#pragma mark - initial
/// 初始化数据
- (void)initialVariable {
    self.date = [NSDate date];
    [ZCCalendar shared].firstWeekday = ZCCalendarSunday;
}

- (void)initialView {
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    
    [self addSwipeGesture];
    
    calendarView = [[ZCCalendarView alloc] init];
    [self addSubview:calendarView];
    oldImageView = [[UIImageView alloc] init];
    [self addSubview:oldImageView];
    oldImageView.hidden = YES;
}

- (void)setDate:(NSDate *)_date {
    oldImageView.image = calendarView.zc_screenCapture;
    calendarView.date = _date;
    [self setNeedsDisplay];
}

- (void)reloadData {
    [calendarView reloadData];
}

#pragma mark - 手势切换月份
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
