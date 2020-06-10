//
//  ZCCitySelectView.h
//  AFNetworking
//
//  Created by wzc on 2020/6/10.
//

#import <UIKit/UIKit.h>

typedef void(^SelectCityInfoBlock)(NSString *province, NSNumber *provinceCode, NSString *city, NSNumber *cityCode, NSString *district, NSNumber *districtCode);

@interface ZCCitySelectView : UIPickerView

/// 展示几级，默认3级 省、市、区
@property(nonatomic, assign) int zc_componentCount;

- (void)zc_nowSelectCityInfo:(SelectCityInfoBlock)cityInfoBlock;

@end

