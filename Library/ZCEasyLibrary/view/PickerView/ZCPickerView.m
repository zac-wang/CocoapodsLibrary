//
//  ZCPickerView.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/1.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCPickerView.h"
#import "Macro.h"
#import "UIColor+ZCSupp.h"
#import <ZCEasyLibraryPrivate/UIView+ZCCornerRadius.h>


@interface ZCPickerView()<UIPickerViewDelegate, UIPickerViewDataSource> {
    UIButton *zc_okButton;
    UIButton *zc_cancelButton;
    UIView *lineView;
//    UIView *zc_datePicBackground;
}
@property(nonatomic, assign) NSInteger zc_sectionCount;
@property(nonatomic, copy)   int (^zc_rowCount)(UIPickerView *, NSInteger component);
@end

#define OK_BUTTON_HEIGHT 35

@implementation ZCPickerView
@synthesize zc_pickerView;
@synthesize zc_dataSource;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if(!zc_pickerView) {
            [self.zc_backView zc_drawCornerRadius:0];
            
            zc_cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [zc_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
            [zc_cancelButton setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
            [zc_cancelButton addTarget:self action:@selector(zc_hiddenView) forControlEvents:UIControlEventTouchUpInside];
            [self.zc_backView addSubview:zc_cancelButton];
            
            zc_okButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [zc_okButton setTitle:@"确定" forState:UIControlStateNormal];
            [zc_okButton setTitleColor:UIColorFromRGB(0x4996fe) forState:UIControlStateNormal];
            [zc_okButton addTarget:self action:@selector(okClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.zc_backView addSubview:zc_okButton];
            
            lineView = [[UIView alloc] init];
            lineView.backgroundColor = UIColorFromRGB(0xd8d8d8);
            [self.zc_backView addSubview:lineView];
            
            zc_pickerView = [[UIPickerView alloc] init];
            zc_pickerView.delegate = self;
            zc_pickerView.dataSource = self;
            [self.zc_backView addSubview:zc_pickerView];
            
            self.frame = frame;
        }
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    
    if(zc_pickerView) {
        zc_cancelButton.frame = CGRectMake(0, 0, 80, OK_BUTTON_HEIGHT);
        zc_okButton.frame = CGRectMake(self.frame.size.width-80, 0, 80, OK_BUTTON_HEIGHT);
        lineView.frame = CGRectMake(10, zc_okButton.frame.size.height, self.frame.size.width-10*2, 0.5);
        
        float height = zc_pickerView.frame.size.height + OK_BUTTON_HEIGHT;
        self.zc_bodyFrame = CGRectMake(0, self.frame.size.height - height, self.frame.size.width, height);
        
        zc_pickerView.frame = CGRectMake(0, zc_okButton.frame.size.height, self.frame.size.width, zc_pickerView.frame.size.height);
    }
}

- (NSInteger(^)(NSInteger))zc_selectRow {
    return ^NSInteger(NSInteger component) {
        return [self->zc_pickerView selectedRowInComponent:component];
    };
}

- (void)okClick:(UIDatePicker *)sender {
    NSMutableArray<NSNumber *> *selectRowArray = [NSMutableArray array];
    NSMutableArray<NSString *> *selectTitleArray = [NSMutableArray array];
    for (int i = 0; i < self.zc_sectionCount; i++) {
        NSInteger row = self.zc_selectRow(i);
        if(row < self.zc_rowCount(zc_pickerView, i)) {//以防 空数据
            [selectRowArray addObject:@(row)];
            if(self.zc_cell)
                [selectTitleArray addObject:self.zc_cell(zc_pickerView, i, row)];
        }
    }
    if(self.zc_selectPicker)
        self.zc_selectPicker(zc_pickerView, selectRowArray, selectTitleArray);
    [self zc_hiddenView];
}

#pragma mark - 设置源数据
- (void)setZc_dataSource:(NSArray *)_dataSource {
    zc_dataSource = _dataSource;
    __weak typeof(self)weakSelf = self;
    [self zc_componentCount:1 rowCount:^NSInteger(UIPickerView *pic, NSInteger component) {
        return self->zc_dataSource.count;
    }];
    self.zc_cell = ^NSString *(UIPickerView *pic, NSInteger component, NSInteger row) {
        return weakSelf.zc_dataSource[row];
    };
}

- (void)zc_componentCount:(NSInteger)count rowCount:(NSInteger (^)(UIPickerView *, NSInteger))_block {
    [self.zc_pickerView reloadAllComponents];
    self.zc_sectionCount = count;
    self.zc_rowCount = [_block copy];
}

#pragma mark - Delegate And DataSource
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return self.zc_sectionCount;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.zc_rowCount(pickerView, component);
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(self.zc_cellAttributedText) {
        return self.zc_cellAttributedText(pickerView, component, row);
    }else if(self.zc_cell) {
        NSString *string = self.zc_cell(pickerView, component, row);
        return [[NSAttributedString alloc] initWithString:string];
    }
    return nil;
}

@end
