//
//  ZCVerticalButton.h
//  DailyWage
//
//  Created by 王志超 on 2017/10/14.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCVerticalButton : UIButton

- (void)imageCent:(CGPoint)_imageCent
        imageSize:(CGSize)_imageSize
        titleCent:(CGPoint)_titleCent
        titleSize:(CGSize)_titleSize;

- (void)imageFrame:(CGRect)_imageFrame
        titleFrame:(CGRect)_titleFrame;

@end
