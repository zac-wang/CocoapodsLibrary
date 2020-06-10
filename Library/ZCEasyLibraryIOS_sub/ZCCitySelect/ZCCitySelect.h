//
//  ZCCitySelect.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/5/4.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCCitySelectView.h"

@interface ZCCitySelect : UIControl

/// 地图选择展示view
@property(nonatomic, strong) ZCCitySelectView   *zc_citySelectView;

/// 最后选择的地区信息
@property(nonatomic, copy)   SelectCityInfoBlock zc_eventClick;

/// 显示
- (void)zc_showView;
/// 隐藏
- (void)zc_hiddenView;

@end
