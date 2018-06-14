//
//  ZCCalendarView.m
//  Calendar
//
//  Created by wangzhichao on 16/8/31.
//  Copyright © 2016年 wangzhichao. All rights reserved.
//

#import "ZCCalendarView.h"
#import <ZCEasyLibrary/NSDate+ZCSupp.h>
#import <ZCEasyLibrary/NSDateComponents+ZCSupp.h>

//实现三个协议：
@interface ZCCalendarView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    UICollectionView *m_collectionView;
    NSString *CellIdentifier;
    
    // 日期小格大小
    CGSize cellSize;

    ZCCalendarShowMothArray *showMothArray;
    NSDateComponents *nowDateComponents;
}

@end

@interface ZCCalendarDayCell ()
- (void)updateDateComponents;
@end

@implementation ZCCalendarView
@synthesize isMultipleSelection;
@synthesize sectionInset;
@synthesize date;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.sectionInset = UIEdgeInsetsZero;

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

- (void)setSectionInset:(UIEdgeInsets)ei {
    [self setFrame:self.frame sectionInset:ei];
}

- (void)setFrame:(CGRect)frame {
    [self setFrame:frame sectionInset:sectionInset];
}

- (void)setFrame:(CGRect)frame sectionInset:(UIEdgeInsets)ei {
    sectionInset = ei;
    if(!CGRectEqualToRect(CGRectZero, frame)) {
        cellSize = CGSizeMake(((int)(frame.size.width/7*10))/10.0, ((int)(frame.size.height/6*10))/10.0);
        frame.size = CGSizeMake(cellSize.width*7, cellSize.height*6);
        
        UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)m_collectionView.collectionViewLayout;
        layout.itemSize = CGSizeMake(cellSize.width-ei.left - ei.right, cellSize.height-ei.top-ei.bottom);
        m_collectionView.frame = self.bounds;
    }
    
    super.frame = frame;
}

- (void)registerClass:(Class)cellClass{
    CellIdentifier = NSStringFromClass(cellClass);
    [m_collectionView registerClass:cellClass forCellWithReuseIdentifier:CellIdentifier];
}

- (void)setDate:(NSDate *)_date {
    date = _date?:[NSDate date];

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
    nowDateComponents = [NSDate date].zc_dateComponents;
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count = showMothArray.total;
    if(count && self.delegate && [self.delegate respondsToSelector:@selector(calendarView:updateSize:)])
        [self.delegate calendarView:self updateSize:CGSizeMake(self.frame.size.width, cellSize.height * count/7)];
    return count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZCCalendarDayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.dateComponents = [(NSDate *)[showMothArray.startCom.zc_toDate dateByAddingTimeInterval:24*60*60*indexPath.row] zc_dateComponents];
    if(self.date.zc_month==cell.dateComponents.month) {
        cell.type = ZCCalendarDayCellTypeNowMonth;
    }else if(self.date.zc_month-1==cell.dateComponents.month || self.date.zc_month+11==cell.dateComponents.month) {
        cell.type = ZCCalendarDayCellTypePreviousMonth;
    }else if(self.date.zc_month+1==cell.dateComponents.month || self.date.zc_month-11==cell.dateComponents.month) {
        cell.type = ZCCalendarDayCellTypeNextMonth;
    }
    
    cell.lunarCalendar = [[ZCCalendarDate sharedCalendarDate] getLunarCalendar:cell.dateComponents];
    cell.isNowDay = nowDateComponents.year == cell.dateComponents.year &&
                    nowDateComponents.month == cell.dateComponents.month &&
                    nowDateComponents.day == cell.dateComponents.day;
    [cell updateDateComponents];
    if(self.delegate && [self.delegate respondsToSelector:@selector(calendarView:cell:)]){
        [self.delegate calendarView:self cell:cell];
    }
    return cell;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ZCCalendarDayCell *cell = (ZCCalendarDayCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if(self.delegate && [self.delegate respondsToSelector:@selector(calendarView:shouldSelectCell:)]){
        return [self.delegate calendarView:self shouldSelectCell:cell];
    }
    return cell.type == ZCCalendarDayCellTypeNowMonth;
}

#pragma mark 选中
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ZCCalendarDayCell *cell = (ZCCalendarDayCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if(self.delegate && [self.delegate respondsToSelector:@selector(calendarView:didSelectCell:)]){
        [self.delegate calendarView:self didSelectCell:cell];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    ZCCalendarDayCell *cell = (ZCCalendarDayCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if(self.delegate && [self.delegate respondsToSelector:@selector(calendarView:didDeselectCell:)]){
        [self.delegate calendarView:self didDeselectCell:cell];
    }
}

- (void)reloadData {
    [m_collectionView reloadData];
}

@end
