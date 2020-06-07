//
//  CalendarDayCell.m
//  CocoapodsLibrary
//
//  Created by zac on 16/9/7.
//  Copyright © 2016年 love_iphone@qq.com. All rights reserved.
//

#import "CalendarDayCell.h"
#import "ZCCalendarView.h"
#import <ZCEasyLibrary/ZCEasyLibrary.h>

@interface CalendarDayCell (){
}

@end

@implementation CalendarDayCell
@synthesize titleLabel;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:21];
        [self addSubview:titleLabel];
    }
    return self;
}

- (void)updateDateComponents {
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
    
    titleLabel.text = [NSString stringWithFormat:@"%ld", (long)self.dateComponents.day];
}

@end
