//
//  UIColor+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>



#define ZCColorTypeControl UIColorFromRGBAlpha(0x000000, 0.6)



@interface UIColor (ZCSupp)

@property(nonatomic, readonly) UIColor *(^zc_alpha)(double);

@end
