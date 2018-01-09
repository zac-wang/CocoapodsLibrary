//
//  CalendarVC.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/19.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "CalendarVC.h"
#import "ZCCalendarManageView.h"
#import "CalendarDayCell.h"
#import <ZCEasyLibrary/ZCCalendar.h>
#import <ZCEasyLibrary/NSDate+ZCSupp.h>

@interface CalendarVC ()<ZCCalendarViewDelegate>

@property (strong, nonatomic) UILabel *yearMonthLabel;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *gapLayoutConstraint;

@property (strong, nonatomic) ZCCalendarManageView *dayView;

@end

@implementation CalendarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    //显示年月Label
    {
        self.yearMonthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        self.yearMonthLabel.center = CGPointMake(self.view.center.x, 85);
        [self.view addSubview:self.yearMonthLabel];
    }
    //显示星期
    UIView *weekBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, self.yearMonthLabel.frame.origin.y+self.yearMonthLabel.frame.size.height, self.view.frame.size.width, 43)];
    weekBackGroundView.backgroundColor = [UIColor whiteColor];
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale currentLocale];
        NSArray *dayTitles = [dateFormatter shortStandaloneWeekdaySymbols];
        int width = self.view.frame.size.width/7;
        for (int i = 0; i < 7; i++) {
            UILabel *week = [[UILabel alloc] initWithFrame:CGRectMake(width*i, 0, width, weekBackGroundView.bounds.size.height)];
            week.textAlignment = NSTextAlignmentCenter;
            week.font = [UIFont systemFontOfSize:8];
            week.text = dayTitles[([ZCCalendar shared].firstWeekday-1+i)%7];
            [weekBackGroundView addSubview:week];
        }
    }
    [self.view addSubview:weekBackGroundView];
    
    
    
    //日历主体
    if(!self.dayView) {
        self.dayView = [[ZCCalendarManageView alloc] initWithFrame:CGRectMake(0, weekBackGroundView.frame.origin.y+weekBackGroundView.frame.size.height, self.view.frame.size.width, self.view.frame.size.width/7*6)];
        [self.view addSubview:self.dayView];
    }
    //日历设置
    __weak typeof(self)weakSelf = self;
    self.dayView.setCalendarView = ^(ZCCalendarView *calendarView) {
        //[calendarView registerClass:[CalendarDayCell class]];
        calendarView.backgroundColor = UIColorFromRGB(0xf1f1f1);
        calendarView.isMultipleSelection = YES;
        calendarView.date = [NSDate date];
        calendarView.delegate = weakSelf;
    };
}

//- (void)viewDidLayoutSubviews {
//    self.dayView.monthFrame = self.dayView.frame;
//}
//
//- (IBAction)changePreviousMonth {
//    [self.dayView changePreviousMonth];
//}
//
//- (IBAction)changeNextMonth {
//    [self.dayView changeNextMonth];
//}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.dayView.nowShowCalendarView reloadData];
}

#pragma mark - Delegate
-(void)calendarView:(ZCCalendarView *)collectionView updateSize:(CGSize)size {
    self.dayView.frame = ({CGRect r = self.dayView.monthFrame; r.size.height = size.height; r;});
    //self.gapLayoutConstraint.constant = height - self.dayView.frame.size.height;
    NSDateComponents *com = collectionView.date.zc_dateComponents;
    self.yearMonthLabel.text = [NSString stringWithFormat:@"%ld年%.2ld月", (long)com.year, (long)com.month];
}

- (void)calendarView:(ZCCalendarView *)collectionView cell:(ZCCalendarDayCell *)cell {
    if(cell.type == ZCCalendarDayCellTypeNowMonth && cell.dateComponents.day == 1) {
    }
}

- (BOOL)calendarView:(ZCCalendarView *)collectionView shouldSelectCell:(ZCCalendarDayCell *)cell {
    return cell.type == ZCCalendarDayCellTypeNowMonth && YES;
}

-(void)calendarView:(ZCCalendarView *)collectionView didSelectCell:(CalendarDayCell *)cell {
    //cell.titleLable.textColor = UIColor.whiteColor;
    NSLog(@"%lu-%lu-%lu--%@", (long)cell.dateComponents.year, (long)cell.dateComponents.month, (long)cell.dateComponents.day, cell.lunarCalendar);
    
    //NSLog(@"%@", self.dayView.nowShowCalendarView.selectDays);
}

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
