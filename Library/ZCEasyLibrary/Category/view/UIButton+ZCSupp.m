//
//  UIButton+ZCSupp.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/4/13.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "UIButton+ZCSupp.h"
#import "UIImage+ZCColor.h"
#import "UIColor+ZCSupp.h"

@implementation UIButton (ZCSupp)

- (void (^)(NSString *, UIColor *, UIControlState))zc_setText {
    return ^(NSString *text, UIColor *color, UIControlState state) {
        [self setTitle:text forState:state];
        if(color) {
            [self setTitleColor:color forState:state];
        }
    };
}

- (void (^)(UIColor *, UIControlState))zc_setBGColor {
    return ^(UIColor *color, UIControlState state) {
        UIImage *img = color ? [UIImage zc_imageWithColor:color] : nil;
        self.zc_setBGImage(img, state);
    };
}

- (void (^)(UIImage *, UIControlState))zc_setBGImage {
    return ^(UIImage *img, UIControlState state) {
        [self setBackgroundImage:img forState:state];
    };
}

@end
