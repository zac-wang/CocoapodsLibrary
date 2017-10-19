//
//  ZCCalendarView.m
//  Calendar
//
//  Created by wangzhichao on 16/8/31.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import "ZCCalendarView.h"

//实现三个协议：
@interface ZCCalendarView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    UICollectionView *m_collectionView;
    NSString *CellIdentifier;
    
    // 日期小格大小
    CGSize cellSize;

    NSDateComponents *nowDateComponents;
}

@end

@interface ZCCalendarDayCell ()
- (void)updateDateComponents;
@end

@implementation ZCCalendarView
@synthesize isMultipleSelection;
@synthesize date;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 1;
        layout.sectionInset = UIEdgeInsetsMake(1, 0.5, 1, 0.5);

        m_collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        m_collectionView.delegate = self;
        m_collectionView.dataSource = self;
        m_collectionView.scrollEnabled = NO;
        m_collectionView.pagingEnabled = YES;
        m_collectionView.backgroundColor = UIColor.clearColor;
        [self addSubview:m_collectionView];
        
        self.frame = frame;
        
        [self registerClass:[ZCCalendarDayCell class]];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    cellSize = CGSizeMake(((int)(frame.size.width/7*10))/10.0, ((int)(frame.size.height/6*10))/10.0);
    frame.size = CGSizeMake(cellSize.width*7, cellSize.height*6);
    
    ((UICollectionViewFlowLayout *)m_collectionView.collectionViewLayout).itemSize = CGSizeMake(cellSize.width-1, cellSize.height-1);
    m_collectionView.frame = self.bounds;
    
    super.frame = frame;
}

- (void)registerClass:(Class)cellClass{
    CellIdentifier = NSStringFromClass(cellClass);
    [m_collectionView registerClass:cellClass forCellWithReuseIdentifier:CellIdentifier];
}

- (void)setDate:(NSDate *)_date {
    date = _date;

    showMothArray = [[ZCCalendarDate sharedCalendarDate] getCalendarShowMothArrayWithDate:date];
    [m_collectionView reloadData];
}

- (void)setIsMultipleSelection:(BOOL)_isMultipleSelection{
    isMultipleSelection = _isMultipleSelection;
    m_collectionView.allowsMultipleSelection = isMultipleSelection;
}

- (NSArray<NSDateComponents *> *)selectDays {
    NSArray *array = m_collectionView.indexPathsForSelectedItems;
    NSMutableArray *dateArray = [[NSMutableArray alloc] init];
    for (NSIndexPath *indexPath in array) {
        ZCCalendarDayCell *cell = (ZCCalendarDayCell *)[m_collectionView cellForItemAtIndexPath:indexPath];
        [dateArray addObject:cell.dateComponents];
    }
    return dateArray;
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    nowDateComponents = [[ZCCalendarDate sharedCalendarDate] dateComponentsWithDate:[NSDate date]];
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count = showMothArray.previousMonthTotal + showMothArray.nowMonthTotal + showMothArray.nextMonthTotal;
    if(count && self.frameDelagate && [self.frameDelagate respondsToSelector:@selector(calendarView:updateSize:)])
        [self.frameDelagate calendarView:self updateSize:CGSizeMake(self.frame.size.width, cellSize.height * count/7)];
    return count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZCCalendarDayCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if(showMothArray.previousMonthTotal > indexPath.row){
        cell.type = ZCCalendarDayCellTypePreviousMonth;
        cell.dateComponents.year = showMothArray.previousMonthOfYear;
        cell.dateComponents.month = showMothArray.previousMonth;
        cell.dateComponents.day = showMothArray.previousMonthStartDay + indexPath.row;
    }else if (showMothArray.previousMonthTotal + showMothArray.nowMonthTotal > indexPath.row){
        cell.type = ZCCalendarDayCellTypeNowMonth;
        cell.dateComponents.year = showMothArray.nowMonthOfYear;
        cell.dateComponents.month = showMothArray.nowMonth;
        cell.dateComponents.day = showMothArray.nowMonthStartDay + indexPath.row - showMothArray.previousMonthTotal;
    }else{
        cell.type = ZCCalendarDayCellTypeNextMonth;
        cell.dateComponents.year = showMothArray.nextMonthOfYear;
        cell.dateComponents.month = showMothArray.nextMonth;
        cell.dateComponents.day = showMothArray.nextMonthStartDay + indexPath.row - showMothArray.previousMonthTotal - showMothArray.nowMonthTotal;
    }
    cell.lunarCalendar = [[ZCCalendarDate sharedCalendarDate] getLunarCalendar:cell.dateComponents];
    cell.isNowDay = nowDateComponents.year == cell.dateComponents.year &&
                    nowDateComponents.month == cell.dateComponents.month &&
                    nowDateComponents.day == cell.dateComponents.day;
    [cell updateDateComponents];
    if(self.delagate && [self.delagate respondsToSelector:@selector(calendarView:cell:)]){
        [self.delagate calendarView:self cell:cell];
    }
    return cell;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ZCCalendarDayCell *cell = (ZCCalendarDayCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if(self.delagate && [self.delagate respondsToSelector:@selector(calendarView:shouldSelectCell:)]){
        return [self.delagate calendarView:self shouldSelectCell:cell];
    }
    return cell.type == ZCCalendarDayCellTypeNowMonth;
}

#pragma mark 选中
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ZCCalendarDayCell * cell = (ZCCalendarDayCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if(self.delagate && [self.delagate respondsToSelector:@selector(calendarView:didSelectCell:)]){
        [self.delagate calendarView:self didSelectCell:cell];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    ZCCalendarDayCell * cell = (ZCCalendarDayCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if(self.delagate && [self.delagate respondsToSelector:@selector(calendarView:didDeselectCell:)]){
        [self.delagate calendarView:self didDeselectCell:cell];
    }
}

- (void)reloadData {
    [m_collectionView reloadData];
}

@end
