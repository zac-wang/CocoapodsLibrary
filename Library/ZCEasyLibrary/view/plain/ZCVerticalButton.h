//
//  ZCVerticalButton.h
//  DailyWage
//
//  Created by 王志超 on 2017/10/14.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCVerticalButton : UIButton

- (void)zc_imageCentY:(float)_imageCentY
            imageSize:(CGSize)_imageSize
           titleCentY:(float)_titleCentY
            titleSize:(CGSize)_titleSize;

- (void)zc_imageFrame:(CGRect)_imageFrame
           titleFrame:(CGRect)_titleFrame;

@end