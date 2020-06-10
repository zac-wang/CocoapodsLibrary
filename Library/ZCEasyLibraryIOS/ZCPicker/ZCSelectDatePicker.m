//
//  ZCSelectDatePicker.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/29.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCSelectDatePicker.h"
#import "UIView+ZCCornerRadius.h"

@interface ZCSelectDatePicker() {
    UIToolbar *toolBar;
}
@end

#define OK_BUTTON_HEIGHT 30

@implementation ZCSelectDatePicker
@synthesize zc_datePicker;

- (void)initView {
    [super initView];
    zc_topToolBarStyle = ZCElasticControlTopToolBarStyleOkAndCancel;
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    
    float height = CGRectGetHeight(self.zc_datePicker.frame);
    self.zc_contentView.frame = CGRectMake(0, self.frame.size.height - height, self.frame.size.width, height);
    
    self.zc_datePicker.frame = self.zc_contentView.bounds;
}

- (UIDatePicker *)zc_datePicker {
    if (!zc_datePicker) {
        zc_datePicker = [[UIDatePicker alloc] init];
        zc_datePicker.locale = [NSLocale currentLocale];
        zc_datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        //zc_datePicker.minimumDate = [NSDate date];
        zc_datePicker.date = [NSDate date];
        [zc_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
        [self.zc_contentView addSubview:zc_datePicker];
    }
    return zc_datePicker;
}

- (void)okClick:(UIBarButtonItem *)okItem {
    [self dateChanged:self.zc_datePicker];
    
    [self zc_hiddenView];
}

- (void)zc_hiddenView {
    [super zc_hiddenView];
    
    if (self.zc_cancelSelectDatePicker) {
        self.zc_cancelSelectDatePicker(self.zc_datePicker);
    }
}

- (void)dateChanged:(UIDatePicker *)datePic {
    if(self.zc_selectDatePicker) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        if(self.zc_dateFormat) {
            formatter.dateFormat = self.zc_dateFormat;
        }else if(datePic.datePickerMode == UIDatePickerModeDateAndTime) {
            formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        }else {
            formatter.dateFormat = @"yyyy-MM-dd";
        }
        NSString *dateStr = [formatter stringFromDate:datePic.date];
        
        self.zc_selectDatePicker(datePic, datePic.date, dateStr);
    }
}

@end
