//
//  CalendarVC.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/19.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "CalendarVC.h"
#import "ZCCalendarManageView.h"
#import "CalendarDayCell.h"
#import <ZCEasyLibrary/ZCEasyLibrary.h>

@interface CalendarVC ()<ZCCalendarViewDelegate>

@property (strong, nonatomic) UILabel *yearMonthLabel;
@property (strong, nonatomic) UIView *weekBackGroundView;
@property (strong, nonatomic) ZCCalendarManageView *dayView;

@end

@implementation CalendarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.9];

    self.dayView.calendarView.delegate = self;
}

//显示年月Label
- (UILabel *)yearMonthLabel {
    if (!_yearMonthLabel) {
        CGFloat yearX = 30;
        CGFloat yearW = self.view.frame.size.width - yearX * 2;
        _yearMonthLabel = [[UILabel alloc] initWithFrame:CGRectMake(yearX, 164, yearW, 30)];
        _yearMonthLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_yearMonthLabel];
    }
    return _yearMonthLabel;
}

/// 星期view
- (UIView *)weekBackGroundView {
    if (!_weekBackGroundView) {
        //显示星期
        CGFloat weekX = self.yearMonthLabel.frame.origin.x;
        CGFloat weekY = CGRectGetMaxY(self.yearMonthLabel.frame);
        CGFloat weekW = self.yearMonthLabel.frame.size.width;
        _weekBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(weekX, weekY, weekW, 30)];
        _weekBackGroundView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_weekBackGroundView];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale currentLocale];
        NSArray *dayTitles = [dateFormatter shortStandaloneWeekdaySymbols];
        int width = self.weekBackGroundView.frame.size.width/7;
        for (int i = 0; i < 7; i++) {
            UILabel *week = [[UILabel alloc] initWithFrame:CGRectMake(width*i, 0, width, _weekBackGroundView.bounds.size.height)];
            week.textAlignment = NSTextAlignmentCenter;
            week.font = [UIFont systemFontOfSize:8];
            week.text = dayTitles[([ZCCalendar shared].firstWeekday-1+i)%7];
            [_weekBackGroundView addSubview:week];
        }
    }
    return _weekBackGroundView;
}

//日历主体view
- (ZCCalendarManageView *)dayView {
    if(!_dayView) {
        CGFloat dayX = self.weekBackGroundView.frame.origin.x;
        CGFloat dayY = CGRectGetMaxY(self.weekBackGroundView.frame);
        CGFloat dayW = self.weekBackGroundView.frame.size.width;
        _dayView = [[ZCCalendarManageView alloc] initWithMaxFrame:CGRectMake(dayX, dayY, dayW, dayW/7*6)];
        [self.view addSubview:_dayView];
        
        //日历设置
        //[_dayView.calendarView registerClass:[CalendarDayCell class]];
        _dayView.calendarView.backgroundColor = UIColorFromRGB(0xf1f1f1);
        _dayView.calendarView.isMultipleSelection = YES;
        _dayView.calendarView.date = [NSDate date];
    }
    return _dayView;
}

//- (void)viewDidLayoutSubviews {
//    self.dayView.monthFrame = self.dayView.frame;
//}
//
// 切换上个月
//- (IBAction)changePreviousMonth {
//    [self.dayView changePreviousMonth];
//}
//
// 切换下个月
//- (IBAction)changeNextMonth {
//    [self.dayView changeNextMonth];
//}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.dayView.calendarView reloadData];
}

#pragma mark - Delegate
/// 日历大小变化
-(void)calendarView:(ZCCalendarView *)collectionView updateSize:(CGSize)size linesNumber:(NSUInteger)linesNumber {
    self.dayView.frame = ({CGRect r = self.dayView.frame; r.size.height = size.height; r;});
    NSDateComponents *com = collectionView.date.zc_dateComponents;
    self.yearMonthLabel.text = [NSString stringWithFormat:@"%ld年%.2ld月", (long)com.year, (long)com.month];
}

/// 设置subtitle、cell样式等
- (void)calendarView:(ZCCalendarView *)collectionView cell:(ZCCalendarDayCell *)cell {
    if(cell.type == ZCCalendarDayCellTypeNowMonth && cell.dateComponents.day == 1) {
    }
}

/// 即将被选中，返回是否可以被选中，默认只能选中本月日期
//- (BOOL)calendarView:(ZCCalendarView *)collectionView shouldSelectCell:(ZCCalendarDayCell *)cell {
//    return cell.type == ZCCalendarDayCellTypeNowMonth;
//}

/// 被选中
-(void)calendarView:(ZCCalendarView *)collectionView didSelectCell:(CalendarDayCell *)cell {
    //cell.titleLable.textColor = UIColor.whiteColor;
    NSLog(@"%lu-%lu-%lu--%@", (long)cell.dateComponents.year, (long)cell.dateComponents.month, (long)cell.dateComponents.day, cell.lunarCalendar);
    
    //NSLog(@"%@", self.dayView.nowShowCalendarView.selectDays);
}

/// 取消选中
- (void)calendarView:(ZCCalendarView *)collectionView didDeselectCell:(CalendarDayCell *)cell {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
