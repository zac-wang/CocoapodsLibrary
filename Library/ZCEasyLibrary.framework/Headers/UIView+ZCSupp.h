//
//  UIView+ZCSupp.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/22.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZCSupp)

- (void)zc_addFrameSizeChangeEvent:(void (^)(UIView *))zc_addFrameSizeChangeEvent;
- (void)zc_removeFrameSizeChangeEvent;

- (CAGradientLayer *)zc_setBackgroundColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint locations:(NSArray *)locations;

@end
