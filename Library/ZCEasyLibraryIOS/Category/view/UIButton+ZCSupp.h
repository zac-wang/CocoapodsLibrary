//
//  UIButton+ZCSupp.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/13.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZCSupp)

@property(nonatomic, readonly) void(^zc_setText)(NSString *text, UIColor *color, UIControlState state);
@property(nonatomic, readonly) void(^zc_setBGColor)(UIColor *color, UIControlState state);
@property(nonatomic, readonly) void(^zc_setBGImage)(UIImage *img, UIControlState state);

@end
