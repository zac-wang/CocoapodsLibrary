//
//  ZCCalendarDayCell.h
//  Calendar
//
//  Created by wangzhichao on 16/9/5.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZCCalendarDayCellTypeNowMonth,/**> 上月 */
    ZCCalendarDayCellTypePreviousMonth,/**> 本月 */
    ZCCalendarDayCellTypeNextMonth,/**> 下月 */
} ZCCalendarDayCellType;


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]


@interface ZCCalendarDayCell : UICollectionViewCell

/// 当前日期显示类型
@property(nonatomic, assign) ZCCalendarDayCellType type;
/// 当前日期
@property(nonatomic, readonly) NSDateComponents *dateComponents;
/// 阴历
@property(nonatomic, strong) NSString *lunarCalendar;
/// dateComponents对应的 是否是 当前日期
@property(nonatomic, assign) BOOL isNowDay;

/// 选中时的背景
- (UIView *)getSelectedBackgroundView;

@end
