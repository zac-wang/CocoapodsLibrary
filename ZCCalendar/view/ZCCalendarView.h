//
//  ZCCalendarView.h
//  Calendar
//
//  Created by wangzhichao on 16/8/31.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCalendarDate.h"
#import "ZCCalendarDayCell.h"


@class ZCCalendarView;
@protocol ZCCalendarViewFrameDelegate <NSObject>
@optional
/// 更新日历显示大小（一般用不到）
- (void)calendarView:(ZCCalendarView *)collectionView updateSize:(CGSize)size;
@end

@protocol ZCCalendarViewDelegate <NSObject>
@optional
/// 设置cell显示的内容
- (void)calendarView:(ZCCalendarView *)collectionView cell:(ZCCalendarDayCell *)cell;

/// 设置cell是否可以被选中
- (BOOL)calendarView:(ZCCalendarView *)collectionView shouldSelectCell:(ZCCalendarDayCell *)cell;

/// cell被选中回调
- (void)calendarView:(ZCCalendarView *)collectionView didSelectCell:(ZCCalendarDayCell *)cell;

/// cell取消选中回调
- (void)calendarView:(ZCCalendarView *)collectionView didDeselectCell:(ZCCalendarDayCell *)cell;

@end



@interface ZCCalendarView : UIView{
    ZCCalendarShowMothArray *showMothArray;
}

///设置事件代理
@property(nonatomic, weak) id<ZCCalendarViewDelegate> delagate;
///设置事件代理
@property(nonatomic, weak) id<ZCCalendarViewFrameDelegate> frameDelagate;

- (void)reloadData;

///注册cell
- (void)registerClass:(Class)cellClass;
///是否可以多选
@property(nonatomic, assign)   BOOL isMultipleSelection;
///设置日历显示的日期
@property(nonatomic, strong)   NSDate *date;
///已选择的日期
@property(nonatomic, readonly) NSArray<NSDateComponents *> *selectDays;

@end
