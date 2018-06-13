//
//  ZCSelectDatePicker.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/29.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCSelectDatePicker.h"
#import <ZCEasyLibraryPrivate/UIView+ZCCornerRadius.h>

@interface ZCSelectDatePicker() {
    UIButton *zc_cancelButton;
    UIButton *zc_okButton;
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
            [self.zc_backView zc_drawCornerRadius:0];
            
            zc_cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [zc_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
            [zc_cancelButton setTitleColor:[UIColor colorWithRed:0.08 green:0.49 blue:0.98 alpha:1.00] forState:UIControlStateNormal];
            [zc_cancelButton addTarget:self action:@selector(zc_hiddenView) forControlEvents:UIControlEventTouchUpInside];
            [self.zc_backView addSubview:zc_cancelButton];
            
            zc_okButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [zc_okButton setTitle:@"确定" forState:UIControlStateNormal];
            [zc_okButton setTitleColor:[UIColor colorWithRed:0.08 green:0.49 blue:0.98 alpha:1.00] forState:UIControlStateNormal];
            [zc_okButton addTarget:self action:@selector(okClick) forControlEvents:UIControlEventTouchUpInside];
            [self.zc_backView addSubview:zc_okButton];
            
            zc_datePicker = [[UIDatePicker alloc] init];
            zc_datePicker.locale = [NSLocale currentLocale];
            zc_datePicker.datePickerMode = UIDatePickerModeDateAndTime;
            //zc_datePicker.minimumDate = [NSDate date];
            zc_datePicker.date = [NSDate date];
            [zc_datePicker addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
            [self.zc_backView addSubview:zc_datePicker];
            
            self.frame = self.frame;
        }
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    
    float height = zc_datePicker.frame.size.height + OK_BUTTON_HEIGHT;
    self.zc_bodyFrame = CGRectMake(0, self.frame.size.height - height, self.frame.size.width, height);
}

- (void)setZc_bodyFrame:(CGRect)bodyFrame {
    super.zc_bodyFrame = bodyFrame;
    
    if(zc_datePicker) {
        zc_cancelButton.frame = CGRectMake(0, 0, 80, OK_BUTTON_HEIGHT);
        zc_okButton.frame = CGRectMake(self.frame.size.width-80, 0, 80, OK_BUTTON_HEIGHT);
        zc_datePicker.frame = CGRectMake(0, zc_okButton.frame.size.height, self.frame.size.width, zc_datePicker.frame.size.height);
    }
}

- (void)okClick {
    [self dateChanged];
    [self zc_hiddenView];
}

- (void)zc_hiddenView {
    if(self.zc_selectEndRemoveFromSuperview) {
        [self removeFromSuperview];
    }else{
        [super zc_hiddenView];
    }
}

- (void)dateChanged {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    if(self.zc_dateFormat) {
        formatter.dateFormat = self.zc_dateFormat;
    }else if(zc_datePicker.datePickerMode == UIDatePickerModeDateAndTime) {
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }else {
        formatter.dateFormat = @"yyyy-MM-dd";
    }
    if(self.zc_selectDatePicker)
        self.zc_selectDatePicker(zc_datePicker, zc_datePicker.date, [formatter stringFromDate:zc_datePicker.date]);
}

@end
