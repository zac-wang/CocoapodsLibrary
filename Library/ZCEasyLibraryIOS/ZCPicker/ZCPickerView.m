//
//  ZCPickerView.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/1.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCPickerView.h"
#import "UIColor+ZCSupp.h"
#import "UIView+ZCCornerRadius.h"


@interface ZCPickerView()<UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic, assign) NSInteger zc_sectionCount;
@property(nonatomic, copy)   int (^zc_rowCount)(UIPickerView *, NSInteger component);

@end

#define OK_BUTTON_HEIGHT 35

@implementation ZCPickerView
@synthesize zc_pickerView;
@synthesize zc_dataSource;

- (void)initView {
    [super initView];
    zc_topToolBarStyle = ZCElasticControlTopToolBarStyleOkAndCancel;
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    
    float height = CGRectGetHeight(self.zc_pickerView.frame);
    self.zc_contentView.frame = CGRectMake(0, self.frame.size.height - height, self.frame.size.width, height);
    
    self.zc_pickerView.frame = self.zc_contentView.bounds;
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    
    self.zc_dataSource = @[@"Mouuntain View", @"Sunnyvale", @"Cupertino", @"Santa Clara", @"San Jose"];
    [self.zc_pickerView selectRow:2 inComponent:0 animated:YES];
}

- (UIPickerView *)zc_pickerView {
    if (!zc_pickerView) {
        zc_pickerView = [[UIPickerView alloc] init];
        zc_pickerView.delegate = self;
        zc_pickerView.dataSource = self;
        [self.zc_contentView addSubview:zc_pickerView];
    }
    return zc_pickerView;
}

- (NSInteger(^)(NSInteger))zc_selectRow {
    return ^NSInteger(NSInteger component) {
        return [self->zc_pickerView selectedRowInComponent:component];
    };
}

- (void)okClick:(UIBarButtonItem *)okItem {
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
