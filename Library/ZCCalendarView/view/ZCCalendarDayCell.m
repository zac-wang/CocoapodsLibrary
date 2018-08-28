//
//  ZCCalendarDayCell.m
//  Calendar
//
//  Created by zac on 16/9/5.
//  Copyright © 2016年 love_iphone@qq.com. All rights reserved.
//

#import "ZCCalendarDayCell.h"
#import <ZCEasyLibrary/ZCCalendar.h>
#import "ZCCalendarDate.h"

@interface ZCCalendarDayCell () {
    CAShapeLayer *layer;
    UILabel *titleLabel;
    UILabel *subTitleLabel;
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
        
        self.selectedBackgroundView = self.getSelectedBackgroundView;
    }
    return self;
}

- (void)updateDateComponents {
    if(!titleLabel) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height/6, self.frame.size.width, self.frame.size.height/3)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:21];
        [self addSubview:titleLabel];
        
        subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/3)];
        subTitleLabel.textAlignment = NSTextAlignmentCenter;
        subTitleLabel.backgroundColor = [UIColor clearColor];
        subTitleLabel.font = [UIFont systemFontOfSize:8];
        [self addSubview:subTitleLabel];
    }
    if(self.type == ZCCalendarDayCellTypePreviousMonth){
        titleLabel.textColor = [UIColor colorWithWhite:0x81/255 alpha:1];
    }else if (self.type == ZCCalendarDayCellTypeNowMonth){
        if(self.isNowDay){
            titleLabel.textColor = UIColor.redColor;
        }else if(self.dateComponents.weekday == ZCCalendarSunday ||
                 self.dateComponents.weekday == ZCCalendarSaturday)
            titleLabel.textColor = [UIColor colorWithRed:0xff/255 green:0x52/255 blue:0x49/255 alpha:1];
        else
            titleLabel.textColor = [UIColor colorWithWhite:0x3c/255 alpha:1];
    }else{
        titleLabel.textColor = [UIColor colorWithWhite:0x81/255 alpha:1];
    }
    subTitleLabel.textColor = [UIColor lightGrayColor];
    
    titleLabel.text = [NSString stringWithFormat:@"%ld", (long)self.dateComponents.day];
    lunarCalendar = [[ZCCalendarDate sharedCalendarDate] getLunarCalendar:self.dateComponents];
    subTitleLabel.text = lunarCalendar;
}

- (UIView *)getSelectedBackgroundView {
    UIView *view;
    
    if(!view) {
        UIBezierPath *beizPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.bounds.size.width/2];
        layer=[CAShapeLayer layer];
        layer.path = beizPath.CGPath;
        layer.lineWidth = 0.0f;
        layer.lineCap = kCALineCapRound;
        
        layer.fillColor = [UIColor redColor].CGColor;
        layer.strokeColor = [UIColor redColor].CGColor;
        
        view = [[UIView alloc] initWithFrame:self.bounds];
        [view.layer insertSublayer:layer atIndex:0];
    }
    
    return view;
}

@end
