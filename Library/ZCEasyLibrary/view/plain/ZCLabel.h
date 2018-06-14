//
//  ZCLabel.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCLabel : UILabel

///最大高度,默认0不限制
@property(nonatomic, assign)   float zc_maxHeight;
///计算最合适高度
@property(nonatomic, readonly) float zc_height;
///更新高度
- (void)zc_updateHeight;

@end
