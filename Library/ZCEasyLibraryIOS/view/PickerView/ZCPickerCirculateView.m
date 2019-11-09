//
//  ZCPickerCirculateView.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/27.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCPickerCirculateView.h"

/// 获取源数据长度
#define OriginalCountForComponent(component) ([super pickerView:self.zc_pickerView numberOfRowsInComponent:component])

/// 源数据扩充倍数
#define ExpansionMultipleForComponent(component) ({\
    NSInteger originalCount = OriginalCountForComponent(component);\
    if(originalCount == 0)\
        originalCount = 151;\
    int multiple = MAX(150/originalCount, 1);\
    multiple = multiple * 2 + 1;\
})

@interface ZCPickerView() <UIPickerViewDelegate, UIPickerViewDataSource>
@end

@interface ZCPickerCirculateView()
@end

@implementation ZCPickerCirculateView

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self zc_autoSelect];
}

#pragma mark - 重写 返回选中的位置
- (NSInteger(^)(NSInteger))zc_selectRow {
    return ^NSInteger(NSInteger component) {
        NSInteger originalRowCount = OriginalCountForComponent(component);
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
    int multiple = ExpansionMultipleForComponent(component);
    NSInteger originalRowCount = OriginalCountForComponent(component);
    NSInteger selectRow = self.zc_selectRow(component);
    
    [self.zc_pickerView selectRow:(multiple/2 + 1) * originalRowCount + selectRow inComponent:component animated:NO];
}

#pragma mark - 代理方法
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger originalCount = OriginalCountForComponent(component);
    if(originalCount == 0)
        return 0;
    
    return originalCount * ExpansionMultipleForComponent(component);
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSInteger originalRowCount = OriginalCountForComponent(component);
    return [super pickerView:pickerView attributedTitleForRow:row % originalRowCount forComponent:component];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    int multiple = ExpansionMultipleForComponent(component);
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
