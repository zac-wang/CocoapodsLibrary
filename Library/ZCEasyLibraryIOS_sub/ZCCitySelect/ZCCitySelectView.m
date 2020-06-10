//
//  ZCCitySelectView.m
//  AFNetworking
//
//  Created by wzc on 2020/6/10.
//

#import "ZCCitySelectView.h"

@interface ZCCitySelectView ()<UIPickerViewDelegate, UIPickerViewDataSource>

/// 数据源
@property(nonatomic, copy)   NSArray * dataArr;

@end

#define buttonWidth     60
#define buttonHeight    35

#define aearList @"aearList"
#define areaId   @"areaId"
#define areaName @"areaName"

#define CitySelectPlistPath [[NSBundle bundleForClass:[self class]] pathForResource:@"ZCCitySelectAddressData" ofType:@"plist"]

@implementation ZCCitySelectView
@synthesize zc_componentCount;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.showsSelectionIndicator = YES;
        self.delegate = self;
    }
    return self;
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSArray arrayWithContentsOfFile:CitySelectPlistPath];
    }
    return _dataArr;
}

#pragma mark -
- (void)setZc_componentCount:(int)comp {
    zc_componentCount = comp;
    [self reloadAllComponents];
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
        return [(NSArray *)self.dataArr[one][aearList] count];
    }
    if(component == 2) {
        NSInteger one = [pickerView selectedRowInComponent:0];
        NSInteger two = [pickerView selectedRowInComponent:1];
        return [(NSArray *)self.dataArr[one][aearList][two][aearList] count];
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0) {
        return self.dataArr[row][areaName];
    }
    NSInteger one = [pickerView selectedRowInComponent:0];
    NSArray *oneArray = self.dataArr[one][aearList];
    if(component == 1) {
        return row < oneArray.count ? oneArray[row][areaName] : @"";
    }
    NSInteger two = [pickerView selectedRowInComponent:1];
    NSArray *twoArray = oneArray[two][aearList];
    if(component == 2) {
        return row < twoArray.count ? twoArray[row][areaName] : @"";
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(component == 0) {
        if(self.numberOfComponents >= 2) {
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:YES];
        }
        if(self.numberOfComponents >= 3) {
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:2 animated:YES];
        }
    }
    if(component == 1) {
        if(self.numberOfComponents >= 3) {
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:2 animated:YES];
        }
    }
}

- (void)zc_nowSelectCityInfo:(void (^)(NSString *, NSNumber *, NSString *, NSNumber *, NSString *, NSNumber *))cityInfoBlock {
    NSString *province;
    NSNumber *provinceCode;
    NSString *city;
    NSNumber *cityCode;
    NSString *district;
    NSNumber *districtCode;
    
    NSInteger one = [self selectedRowInComponent:0];
    NSDictionary *oneDictionary = self.dataArr[one];
    
    province = oneDictionary[areaName];
    provinceCode = oneDictionary[areaId];
    

    if(self.numberOfComponents >= 2) {
        NSInteger two = [self selectedRowInComponent:1];
        NSArray *oneArray = oneDictionary[aearList];
        NSDictionary *twoDictionary = oneArray[two];
        
        city = twoDictionary[areaName];
        cityCode = twoDictionary[areaId];
        
        
        
        if(self.numberOfComponents >= 3) {
            NSInteger three = [self selectedRowInComponent:2];
            NSArray *twoArray = twoDictionary[aearList];
            NSDictionary *threeDictionary = twoArray[three];
            
            district = threeDictionary[areaName];
            districtCode = threeDictionary[areaId];
        }
    }
    
    if (cityInfoBlock)
        cityInfoBlock(province, provinceCode, city, cityCode, district, districtCode);
}

@end
