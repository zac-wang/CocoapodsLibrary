//
//  ZCCalendarDayCell.m
//  Calendar
//
//  Created by zac on 16/9/5.
//  Copyright © 2016年 love_iphone@qq.com. All rights reserved.
//

#import "ZCCalendarDayCell.h"
#import "ZCCalendarDate.h"

@interface ZCCalendarDayCell () {
}

@end

@implementation ZCCalendarDayCell
@synthesize lunarCalendar;
@synthesize dateComponents;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        dateComponents = [[NSDateComponents alloc] init];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        CGFloat titleWH = self.frame.size.height / 3 * 2;
        CGFloat titleX = (self.frame.size.width - titleWH)/2;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleX, 0, titleWH, titleWH)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if(!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 3 * 2, self.frame.size.width, self.frame.size.height / 3)];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.backgroundColor = [UIColor clearColor];
        _subTitleLabel.font = [UIFont systemFontOfSize:8];
        [self addSubview:_subTitleLabel];
    }
    return _subTitleLabel;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    self.titleLabel.clipsToBounds = YES;
    self.titleLabel.layer.cornerRadius = self.titleLabel.frame.size.height/2;
    if (selected) {
        self.titleLabel.backgroundColor = [UIColor redColor];
    } else {
        self.titleLabel.backgroundColor = [UIColor clearColor];
    }
}

- (void)updateDateComponents {
    if (self.type == ZCCalendarDayCellTypeNowMonth) {
        if (self.isNowDay) {
            // 今日
            self.titleLabel.textColor = UIColor.redColor;
        } else if (self.dateComponents.weekday == 1 || // 周日
                 self.dateComponents.weekday == 7) { // 周六
            // 周日
            self.titleLabel.textColor = [UIColor colorWithWhite:0x55/255.0 alpha:1];
        } else {
            // 普通
            self.titleLabel.textColor = [UIColor colorWithWhite:0x33/255.0 alpha:1];
        }
    }else{
        // 非本月日期
        self.titleLabel.textColor = [UIColor colorWithWhite:0x99/255.0 alpha:1];
    }
    self.subTitleLabel.textColor = [UIColor lightGrayColor];
    
    self.titleLabel.text = [NSString stringWithFormat:@"%ld", (long)self.dateComponents.day];
    lunarCalendar = [[ZCCalendarDate sharedCalendarDate] getLunarCalendar:self.dateComponents];
    self.subTitleLabel.text = lunarCalendar;
}

@end
