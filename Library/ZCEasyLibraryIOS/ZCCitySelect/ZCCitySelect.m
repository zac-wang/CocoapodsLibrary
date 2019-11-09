//
//  ZCCitySelect.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/5/4.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCCitySelect.h"
#import "UIColor+ZCSupp.h"
#import "UIView+ZCCornerRadius.h"
#import "NSData+ZCJson.h"
#import "NSString+ZCSupp.h"

@interface ZCCitySelect ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic, strong) UIPickerView * pic;

@property(nonatomic, copy)   NSArray * dataArr;

@end

#define buttonWidth     60
#define buttonHeight    35

#define GetRowForComponent(component) [self.pic selectedRowInComponent:component]

@implementation ZCCitySelect
@synthesize zc_componentCount;

- (void)initView {
    [super initView];
    
    zc_topToolBarStyle = ZCElasticControlTopToolBarStyleOkAndCancel;
    
    NSBundle *easyLibrary = [NSBundle bundleWithIdentifier:@"org.cocoapods.ZCEasyLibrary"];
    NSString *addressPath = [easyLibrary pathForResource:@"ZCCitySelectAddressData" ofType:@"plist"];
    self.dataArr = [NSArray arrayWithContentsOfFile:addressPath];
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    
    float height = CGRectGetHeight(self.pic.frame);
    self.zc_contentView.frame = CGRectMake(0, self.frame.size.height - height, self.frame.size.width, height);

    self.pic.frame = self.zc_contentView.bounds;
}

- (UIPickerView *)pic {
    if (!_pic) {
        _pic = [[UIPickerView alloc] initWithFrame:CGRectZero];
        _pic.showsSelectionIndicator = YES;
        _pic.delegate = self;
        [self.zc_contentView addSubview:_pic];
    }
    return _pic;
}

#pragma mark -
- (void)setZc_componentCount:(int)comp {
    zc_componentCount = comp;
    [self.pic reloadAllComponents];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.zc_componentCount > 0 && self.zc_componentCount <= 3 ? self.zc_componentCount : 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0) {
        return self.dataArr.count;
    }
    if(component == 1) {
        NSInteger one = [pickerView selectedRowInComponent:0];
        return [(NSArray *)self.dataArr[one][@"aearList"] count];
    }
    if(component == 2) {
        NSInteger one = [pickerView selectedRowInComponent:0];
        NSInteger two = [pickerView selectedRowInComponent:1];
        return [(NSArray *)self.dataArr[one][@"aearList"][two][@"aearList"] count];
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0) {
        return self.dataArr[row][@"areaName"];
    }
    NSInteger one = [pickerView selectedRowInComponent:0];
    NSArray *oneArray = self.dataArr[one][@"aearList"];
    if(component == 1) {
        return row < oneArray.count ? oneArray[row][@"areaName"] : @"";
    }
    NSInteger two = [pickerView selectedRowInComponent:1];
    NSArray *twoArray = oneArray[two][@"aearList"];
    if(component == 2) {
        return row < twoArray.count ? twoArray[row][@"areaName"] : @"";
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(component == 0) {
        if(self.pic.numberOfComponents >= 2) {
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:YES];
        }
        if(self.pic.numberOfComponents >= 3) {
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:2 animated:YES];
        }
    }
    if(component == 1) {
        if(self.pic.numberOfComponents >= 3) {
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:2 animated:YES];
        }
    }
}

- (void)okClick:(UIBarButtonItem *)okItem {
    if(self.zc_eventClick) {
        NSNumber *code;
        
        NSInteger one = GetRowForComponent(0);
        NSDictionary *oneDictionary = self.dataArr[one];
        NSArray *oneArray = oneDictionary[@"aearList"];
        code = oneDictionary[@"areaId"];
        
        NSDictionary *twoDictionary;
        if(self.pic.numberOfComponents >= 2) {
            NSInteger two = GetRowForComponent(1);
            twoDictionary = oneArray[two];
            code = twoDictionary[@"areaId"];
        }
        NSArray *twoArray = twoDictionary[@"aearList"];
        
        NSDictionary *threeDictionary;
        if(self.pic.numberOfComponents >= 3) {
            NSInteger three = GetRowForComponent(2);
            threeDictionary = twoArray[three];
            code = threeDictionary[@"areaId"];
        }
        
        self.zc_eventClick(oneDictionary[@"areaName"], twoDictionary[@"areaName"], threeDictionary[@"areaName"], code);
    }
    
    [self zc_hiddenView];
}

@end
