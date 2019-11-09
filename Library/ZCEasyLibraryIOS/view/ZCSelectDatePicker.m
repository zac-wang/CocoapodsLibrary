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
//    UIView *zc_datePicBackground;
}
@end

#define OK_BUTTON_HEIGHT 30

@implementation ZCSelectDatePicker
@synthesize zc_datePicker;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if(!zc_datePicker) {
            [self.zc_contentView zc_drawCornerRadius:0];
            
            toolBar = [[UIToolbar alloc] init];
            UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(zc_hiddenView)];
            UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
            UIBarButtonItem *okItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(okClick)];
            toolBar.items = @[cancelItem, flexibleSpace, okItem];
            [self.zc_contentView addSubview:toolBar];
            
            zc_datePicker = [[UIDatePicker alloc] init];
            zc_datePicker.locale = [NSLocale currentLocale];
            zc_datePicker.datePickerMode = UIDatePickerModeDateAndTime;
            //zc_datePicker.minimumDate = [NSDate date];
            zc_datePicker.date = [NSDate date];
            [zc_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
            [self.zc_contentView addSubview:zc_datePicker];
            
            self.frame = self.frame;
        }
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    
    if(zc_datePicker) {
        toolBar.frame = CGRectMake(0, 0, self.frame.size.width, OK_BUTTON_HEIGHT);
        zc_datePicker.frame = CGRectMake(0, OK_BUTTON_HEIGHT, self.frame.size.width, zc_datePicker.frame.size.height);
        
        float height = CGRectGetMaxY(zc_datePicker.frame);
        self.zc_contentView.frame = CGRectMake(0, self.frame.size.height - height, self.frame.size.width, height);
    }
}

- (void)okClick {
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
