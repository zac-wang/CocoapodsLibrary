//
//  ZCCalendarManageView.h
//  Calendar
//
//  Created by zac on 2017/10/20.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCalendarView.h"

@interface ZCCalendarManageView : UIView

- (instancetype)initWithMaxFrame:(CGRect)frame;

@property(nonatomic, readonly) ZCCalendarView *calendarView;


/// 展示上个月
- (void)changePreviousMonth;
/// 展示下个月
- (void)changeNextMonth;

@end
