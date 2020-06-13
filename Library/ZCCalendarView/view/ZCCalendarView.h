//
//  ZCCalendarView.h
//  Calendar
//
//  Created by zac on 16/8/31.
//  Copyright © 2016年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCalendarDate.h"
#import "ZCCalendarDayCell.h"


@class ZCCalendarView;
@protocol ZCCalendarViewDelegate <NSObject>
@optional

/// 更新日历显示大小，以及当前月份日期行数linesNumber（可能4行、5行、6行）
- (void)calendarView:(ZCCalendarView *)collectionView updateSize:(CGSize)size linesNumber:(NSUInteger)linesNumber;

/// 设置subtitle、cell样式等
- (void)calendarView:(ZCCalendarView *)collectionView cell:(ZCCalendarDayCell *)cell;

/// 设置cell是否可以被选中
- (BOOL)calendarView:(ZCCalendarView *)collectionView shouldSelectCell:(ZCCalendarDayCell *)cell;

/// cell被选中回调
- (void)calendarView:(ZCCalendarView *)collectionView didSelectCell:(ZCCalendarDayCell *)cell;

/// cell取消选中回调
- (void)calendarView:(ZCCalendarView *)collectionView didDeselectCell:(ZCCalendarDayCell *)cell;

@end



@interface ZCCalendarView : UIView

///设置事件代理
@property(nonatomic, weak) id<ZCCalendarViewDelegate> delegate;
///间隔
@property (nonatomic) UIEdgeInsets sectionInset;
///注册cell
- (void)registerClass:(Class)cellClass;


/// 刷新界面数据
- (void)reloadData;
///是否可以多选
@property(nonatomic, assign)   BOOL isMultipleSelection;
///设置日历显示的日期
@property(nonatomic, strong)   NSDate *date;
///已选择的日期
@property(nonatomic, readonly) NSArray<NSDateComponents *> *selectDays;

@end
