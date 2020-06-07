//
//  ZCCalendarDayCell.h
//  Calendar
//
//  Created by zac on 16/9/5.
//  Copyright © 2016年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    /// 上月
    ZCCalendarDayCellTypeNowMonth      = 0,
    /// 本月
    ZCCalendarDayCellTypePreviousMonth = 1,
    /// 下月
    ZCCalendarDayCellTypeNextMonth     = 2,
} ZCCalendarDayCellType;


@interface ZCCalendarDayCell : UICollectionViewCell

/// 日期
@property(nonatomic, strong) UILabel *titleLabel;
/// 阴历 / 标记
@property(nonatomic, strong) UILabel *subTitleLabel;


/// 当前日期显示类型
@property(nonatomic, assign) ZCCalendarDayCellType type;
/// 当前日期
@property(nonatomic, strong) NSDateComponents *dateComponents;
/// 阴历
@property(nonatomic, readonly) NSString *lunarCalendar;
/// dateComponents对应的 是否是 当前日期
@property(nonatomic, assign) BOOL isNowDay;


/// 重写方法，设置day展示样式
- (void)updateDateComponents;

@end
