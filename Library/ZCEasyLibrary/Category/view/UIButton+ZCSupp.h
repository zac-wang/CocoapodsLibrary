//
//  UIButton+ZCSupp.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/4/13.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZCSupp)

@property(nonatomic, readonly) void(^zc_setText)(NSString *text, UIColor *color, UIControlState state);
@property(nonatomic, readonly) void(^zc_setBGColor)(UIColor *color, UIControlState state);
@property(nonatomic, readonly) void(^zc_setBGImage)(UIImage *img, UIControlState state);

@end
