//
//  ZCCitySelect.m
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/5/4.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import "ZCCitySelect.h"
#import "UIColor+ZCSupp.h"
#import "UIView+ZCCornerRadius.h"

#define ZCEasyLibraryBundle [NSBundle mainBundle]

@interface ZCCitySelect ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic, strong) UIPickerView * pic;
@property(nonatomic, strong) UIButton * button;
@property(nonatomic, strong) UIView *lineView;

@property(nonatomic, copy)   NSArray * dataArr;

@end

#define buttonWidth     60
#define buttonHeight    35

#define GetRowForComponent(component) [self.pic selectedRowInComponent:0]

@implementation ZCCitySelect
@synthesize zc_componentCount;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialAndCreateSubView];
        self.frame = self.frame;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initialAndCreateSubView];
    }
    return self;
}

- (void)initialAndCreateSubView
{
    [self.zc_backView zc_drawCornerRadius:0];
    
    NSString *dicPath = [ZCEasyLibraryBundle pathForResource:@"ZCCitySelectAddressFile" ofType:@"plist"];
    self.dataArr = [NSArray arrayWithContentsOfFile:dicPath];
    
    self.pic = [[UIPickerView alloc] initWithFrame:CGRectZero];
    self.pic.showsSelectionIndicator = YES;
    self.pic.delegate = self;
    [self.zc_backView addSubview:self.pic];
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"确定" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.zc_backView addSubview:self.button];
    
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = UIColorFromRGB(0xd8d8d8);
    [self.zc_backView addSubview:self.lineView];
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    
    self.zc_bodyFrame = CGRectMake(0,
                                frame.size.height - self.pic.frame.size.height - buttonHeight,
                                frame.size.width,
                                self.pic.frame.size.height + buttonHeight);
}

- (void)setZc_bodyFrame:(CGRect)bodyFrame {
    super.zc_bodyFrame = bodyFrame;
    
    self.button.frame = CGRectMake(bodyFrame.size.width - buttonWidth,
                                   0,
                                   buttonWidth,
                                   buttonHeight);
    
    self.lineView.frame = CGRectMake(10, self.button.frame.size.height, self.frame.size.width-10*2, 0.5);
    
    self.pic.frame = CGRectMake(0,
                                buttonHeight,
                                bodyFrame.size.width,
                                self.pic.frame.size.height);
}

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

-(IBAction)btnClick:(id)sender{
    if(self.zc_eventClick) {
        NSNumber *code;
        
        NSInteger one = [self.pic selectedRowInComponent:0];
        NSDictionary *oneDictionary = self.dataArr[one];
        NSArray *oneArray = oneDictionary[@"aearList"];
        code = oneDictionary[@"areaId"];
        
        NSDictionary *twoDictionary;
        if(self.pic.numberOfComponents >= 2) {
            NSInteger two = [self.pic selectedRowInComponent:1];
            twoDictionary = oneArray[two];
            code = twoDictionary[@"areaId"];
        }
        NSArray *twoArray = twoDictionary[@"aearList"];
        
        NSDictionary *threeDictionary;
        if(self.pic.numberOfComponents >= 3) {
            NSInteger three = [self.pic selectedRowInComponent:2];
            threeDictionary = twoArray[three];
            code = threeDictionary[@"areaId"];
        }
        
        self.zc_eventClick(oneDictionary[@"areaName"], twoDictionary[@"areaName"], threeDictionary[@"areaName"], code);

        [self zc_hiddenView];
    }
}

@end
