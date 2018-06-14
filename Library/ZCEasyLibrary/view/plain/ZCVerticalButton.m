//
//  ZCVerticalButton.m
//  DailyWage
//
//  Created by 王志超 on 2017/10/14.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCVerticalButton.h"
#import "Macro.h"

@interface ZCVerticalButton(){
    CGRect m_imageViewFrame;
    CGRect m_titleLabelFrame;
}

@end

@implementation ZCVerticalButton

- (void)zc_imageCentY:(float)_imageCentY
            imageSize:(CGSize)_imageSize
           titleCentY:(float)_titleCentY
            titleSize:(CGSize)_titleSize {
    float centX = self.frame.size.width/2;
    
    if(!_imageCentY) {
        _imageCentY = self.frame.size.height/4;
    }
    if(CGSizeEqualToSize(CGSizeZero, _imageSize)) {
        _imageSize = CGSizeMake(self.frame.size.width, self.frame.size.height/2);
    }
    m_imageViewFrame = CGRectFromCentAndSize(CGPointMake(centX, _imageCentY), _imageSize);
    
    
    if(!_titleCentY) {
        _titleCentY = self.frame.size.height/4*3;
    }
    
    if(CGSizeEqualToSize(CGSizeZero, _titleSize)) {
        _titleSize = CGSizeMake(self.frame.size.width, self.frame.size.height/2);
    }
    m_titleLabelFrame = CGRectFromCentAndSize(CGPointMake(centX, _titleCentY), _titleSize);
    
    [self layoutSubviews];
}

- (void)zc_imageFrame:(CGRect)_imageFrame
           titleFrame:(CGRect)_titleFrame {
    m_imageViewFrame = _imageFrame;
    m_titleLabelFrame = _titleFrame;
    
    [self layoutSubviews];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    if(CGRectEqualToRect(CGRectZero, m_imageViewFrame)) {
        return;
    }
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.frame = m_titleLabelFrame;
    self.imageView.frame = m_imageViewFrame;
}

@end
