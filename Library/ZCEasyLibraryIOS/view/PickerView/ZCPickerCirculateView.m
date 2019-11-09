//
//  ZCPickerCirculateView.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/27.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCPickerCirculateView.h"

@interface ZCPickerView() <UIPickerViewDelegate, UIPickerViewDataSource>
@end

@interface ZCPickerCirculateView()
///每一列 实际显示数据量 是 原数据数据量 的倍数
@property(nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *rowDataMultipleWithComponent;
@end

@implementation ZCPickerCirculateView

- (void)initView {
    [super initView];
    self.rowDataMultipleWithComponent = [[NSMutableDictionary alloc] init];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self zc_autoSelect];
}

#pragma mark - 重写 返回选中的位置
- (NSInteger(^)(NSInteger))zc_selectRow {
    return ^NSInteger(NSInteger component) {
        NSInteger originalRowCount = [self originalCount:component];
        return [self.zc_pickerView selectedRowInComponent:component] % originalRowCount;
    };
}

#pragma mark - 自动选择选项
- (void)zc_autoSelect {
    NSInteger componentCount = [super numberOfComponentsInPickerView:self.zc_pickerView];
    for (int i = 0; i < componentCount; i++) {
        [self autoSelect:i];
    }
}

- (void)autoSelect:(NSInteger)component {
    int multiple = [self.rowDataMultipleWithComponent[@(component)] intValue];
    NSInteger originalRowCount = [self originalCount:component];
    NSInteger selectRow = self.zc_selectRow(component);
    
    [self.zc_pickerView selectRow:(multiple/2 + 1) * originalRowCount + selectRow inComponent:component animated:NO];
}

//获取源数据长度
- (NSInteger)originalCount:(NSInteger)component {
    return [super pickerView:self.zc_pickerView numberOfRowsInComponent:component];
}

#pragma mark - 代理方法
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger row = [self originalCount:component];
    if(row == 0)
        return 0;
    
    int multiple = 150/row + 1;
    multiple = multiple * 2 + 1;
    self.rowDataMultipleWithComponent[@(component)] = @(multiple);
    
    return row * multiple;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSInteger originalRowCount = [self originalCount:component];
    return [super pickerView:pickerView titleForRow:row % originalRowCount forComponent:component];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    int multiple = [self.rowDataMultipleWithComponent[@(component)] intValue];
    if(row/[super pickerView:pickerView numberOfRowsInComponent:component] != (multiple/2 + 1)) {
        [self autoSelect:component];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
