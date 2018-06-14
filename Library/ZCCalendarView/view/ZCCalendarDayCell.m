//
//  ZCCalendarDayCell.m
//  Calendar
//
//  Created by wangzhichao on 16/9/5.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import "ZCCalendarDayCell.h"
#import "ZCCalendar.h"
#import "ZCCalendarDate.h"

@interface ZCCalendarDayCell () {
    CAShapeLayer *layer;
    UILabel *titleLabel;
    UILabel *subTitleLabel;
}

@end

@implementation ZCCalendarDayCell
@synthesize dateComponents;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        dateComponents = [[NSDateComponents alloc] init];
        self.backgroundColor = UIColor.clearColor;
        
        self.selectedBackgroundView = self.getSelectedBackgroundView;
    }
    return self;
}

- (void)updateDateComponents {
    if(!titleLabel) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height/4, self.frame.size.width, self.frame.size.height/4)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:21];
        [self addSubview:titleLabel];
        
        subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/4)];
        subTitleLabel.textAlignment = NSTextAlignmentCenter;
        subTitleLabel.backgroundColor = [UIColor clearColor];
        subTitleLabel.font = [UIFont systemFontOfSize:8];
        [self addSubview:subTitleLabel];
    }
    if(self.type == ZCCalendarDayCellTypePreviousMonth){
        titleLabel.textColor = UIColorFromRGB(0x818181);
    }else if (self.type == ZCCalendarDayCellTypeNowMonth){
        if(self.isNowDay){
            titleLabel.textColor = UIColor.redColor;
        }else if(self.dateComponents.weekday == ZCCalendarSunday ||
                 self.dateComponents.weekday == ZCCalendarSaturday)
            titleLabel.textColor = UIColorFromRGB(0xff5249);
        else
            titleLabel.textColor = UIColorFromRGB(0x3c3c3c);
    }else{
        titleLabel.textColor = UIColorFromRGB(0x818181);
    }
    subTitleLabel.textColor = UIColor.lightGrayColor;
    
    titleLabel.text = [NSString stringWithFormat:@"%ld", (long)self.dateComponents.day];
    subTitleLabel.text = self.lunarCalendar;
    
    
    
}

- (UIView *)getSelectedBackgroundView {
    UIView *view;
    
    if(!view) {
        UIBezierPath *beizPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.bounds.size.width/2];
        layer=[CAShapeLayer layer];
        layer.path = beizPath.CGPath;
        layer.lineWidth = 0.0f;
        layer.lineCap = kCALineCapRound;
        
        layer.fillColor = UIColor.redColor.CGColor;
        layer.strokeColor = UIColor.redColor.CGColor;
        
        view = [[UIView alloc] initWithFrame:self.bounds];
        [view.layer insertSublayer:layer atIndex:0];
    }
    
    return view;
}

@end
