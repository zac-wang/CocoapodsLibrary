//
//  UIImageView+ZCGif.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/12/4.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ZCGif) <CAAnimationDelegate>

- (void)zc_gifImage:(NSString *)gifPath repeatCount:(float)repeatCount;

@end
