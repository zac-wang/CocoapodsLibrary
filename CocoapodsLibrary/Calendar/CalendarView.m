//
//  CalendarView.m
//  Calendar
//
//  Created by wangzhichao on 16/8/30.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import "CalendarView.h"

@interface CalendarView () {
    ZCCalendarView *oldView;
    ZCCalendarView *newView;
    BOOL isAnimat;
}

@end

@implementation CalendarView
@synthesize date;
@synthesize monthFrame;
@synthesize delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.monthFrame = frame;
        [self initialView];
    }
    return self;
}

- (void)initialView {
    isAnimat = NO;
    self.date = [NSDate date];
    [ZCCalendarDate sharedCalendarDate].weekStart = ZCCalendarFirstWeekday_Monday;
    
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    
    [self addSwipeGesture];
    
    
    
    {
        CGRect mothRect = ({CGRect r = self.bounds; r.size.height-=0.5; r;});
        UIView *dayView = [[UIView alloc] initWithFrame:mothRect];
        dayView.backgroundColor = [UIColor clearColor];
        dayView.layer.masksToBounds = YES;
        [self addSubview:dayView];
        
        newView = [[ZCCalendarView alloc] initWithFrame:mothRect];
        oldView = [[ZCCalendarView alloc] initWithFrame:mothRect];
        [newView registerClass:[CalendarDayCell class]];
        [oldView registerClass:[CalendarDayCell class]];
        self.backgroundColor = newView.backgroundColor = oldView.backgroundColor = UIColorFromRGB(0xf1f1f1);
        newView.isMultipleSelection = oldView.isMultipleSelection = YES;
        [dayView addSubview:newView];
        [dayView addSubview:oldView];
    }
    self.date = nil;
}

- (void)setMothFrame:(CGRect)_frame {
    monthFrame = _frame;
    self.frame = monthFrame;
    newView.frame = oldView.frame = self.bounds;
}

- (void)setDelegate:(id<ZCCalendarViewDelegate,ZCCalendarViewFrameDelegate>)_delegate {
    delegate = _delegate;
    newView.delagate = oldView.delagate = delegate;
    newView.frameDelagate = oldView.frameDelagate = delegate;
}

- (void)setDate:(NSDate *)_date {
    date = _date?:[NSDate date];
    
    oldView.date = date;
    [self setNeedsDisplay];
}

- (NSArray<NSDateComponents *> *)selectDays {
    return newView.selectDays;
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
//    oldView.frame = ({CGRect rect = oldView.frame; rect.origin.x = -rect.size.width; rect;}); // 左右
    oldView.frame = ({CGRect rect = oldView.frame; rect.origin.y = -rect.size.height; rect;}); // 上下
    self.date = [[ZCCalendarDate sharedCalendarDate] previousMonthWithDate:self.date];
}

- (void)changeNextMonth {
    isAnimat = YES;
//    oldView.frame = ({CGRect rect = oldView.frame; rect.origin.x = rect.size.width; rect;}); // 左右
    oldView.frame = ({CGRect rect = oldView.frame; rect.origin.y = rect.size.height; rect;}); // 上下
    self.date = [[ZCCalendarDate sharedCalendarDate] nextMonthWithDate:self.date];
}

#pragma mark - 动画
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    oldView.hidden = NO;

    [UIView animateWithDuration:(isAnimat ? 0.35 : 0) animations:^{
        CGRect tmp = oldView.frame;
        oldView.frame = ({ CGRect rect = oldView.frame; rect.origin.y = 0; rect.origin.x = 0; rect; });
        newView.frame = ({ CGRect rect = newView.frame; rect.origin.y = -tmp.origin.y; rect.origin.x = -tmp.origin.x; rect; });
    } completion:^(BOOL finished) {
        id tmp = oldView;
        oldView = newView;
        newView = tmp;
        
        oldView.hidden = YES;
    }];
    isAnimat = NO;
}

@end
