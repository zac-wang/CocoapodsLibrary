//
//  CalendarVC.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/19.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "CalendarVC.h"
#import "CalendarView.h"

@interface CalendarVC ()<ZCCalendarViewDelegate, ZCCalendarViewFrameDelegate>

@property (strong, nonatomic) UILabel *yearMonthLabel;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *gapLayoutConstraint;

@property (strong, nonatomic) CalendarView *dayView;

@end

@implementation CalendarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    {
        self.yearMonthLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        self.yearMonthLabel.center = CGPointMake(self.view.center.x, 85);
        [self.view addSubview:self.yearMonthLabel];
    }
    
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
            week.text = dayTitles[([ZCCalendarDate sharedCalendarDate].weekStart-1+i)%7];
            [weekBackGroundView addSubview:week];
        }
    }
    [self.view addSubview:weekBackGroundView];
    
    
    
    
    if(!self.dayView) {
        self.dayView = [[CalendarView alloc] initWithFrame:CGRectMake(0, weekBackGroundView.frame.origin.y+weekBackGroundView.frame.size.height, self.view.frame.size.width, 43+self.view.frame.size.width/7*6)];
        [self.view addSubview:self.dayView];
    }
    self.dayView.date = [NSDate date];
    self.dayView.delegate = self;
}

//- (void)viewDidLayoutSubviews {
//    self.dayView.frame = self.dayView.frame;
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
    
    [self.dayView reloadData];
}

#pragma mark - Delegate
-(void)calendarView:(ZCCalendarView *)collectionView updateSize:(CGSize)size {
    self.dayView.frame = ({CGRect r = self.dayView.monthFrame; r.size.height = size.height; r;});
    //self.gapLayoutConstraint.constant = height - self.dayView.frame.size.height;
}

- (void)calendarView:(ZCCalendarView *)collectionView cell:(ZCCalendarDayCell *)cell {
    if(cell.type == ZCCalendarDayCellTypeNowMonth && cell.dateComponents.day == 1) {
        self.yearMonthLabel.text = [NSString stringWithFormat:@"%ld年%.2ld月", cell.dateComponents.year, cell.dateComponents.month];
    }
}

- (BOOL)calendarView:(ZCCalendarView *)collectionView shouldSelectCell:(ZCCalendarDayCell *)cell {
    return cell.type == ZCCalendarDayCellTypeNowMonth && YES;
}

-(void)calendarView:(ZCCalendarView *)collectionView didSelectCell:(CalendarDayCell *)cell {
    //cell.titleLable.textColor = UIColor.whiteColor;
    NSLog(@"%lu-%lu-%lu--%@", cell.dateComponents.year, cell.dateComponents.month, cell.dateComponents.day, cell.lunarCalendar);
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
