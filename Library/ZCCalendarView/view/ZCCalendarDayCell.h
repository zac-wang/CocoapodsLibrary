//
//  ZCCalendarDayCell.h
//  Calendar
//
//  Created by wangzhichao on 16/9/5.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+ZCSupp.h"

typedef enum : NSUInteger {
    /// 上月
    ZCCalendarDayCellTypeNowMonth      = 0,
    /// 本月
    ZCCalendarDayCellTypePreviousMonth = 1,
    /// 下月
    ZCCalendarDayCellTypeNextMonth     = 2,
} ZCCalendarDayCellType;


@interface ZCCalendarDayCell : UICollectionViewCell

/// 当前日期显示类型
@property(nonatomic, assign) ZCCalendarDayCellType type;
/// 当前日期
@property(nonatomic, strong) NSDateComponents *dateComponents;
/// 阴历
@property(nonatomic, strong) NSString *lunarCalendar;
/// dateComponents对应的 是否是 当前日期
@property(nonatomic, assign) BOOL isNowDay;

/// 选中时的背景
- (UIView *)getSelectedBackgroundView;

@end
