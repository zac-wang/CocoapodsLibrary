//
//  ZCVerticalButton.m
//  DailyWage
//
//  Created by 王志超 on 2017/10/14.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCVerticalButton.h"

@interface ZCVerticalButton(){
    CGRect m_imageViewFrame;
    CGRect m_titleLabelFrame;
}

@end

#define CGRectFromCentAndSize(_cent_, _size_) CGRectMake(_cent_.x-_size_.width/2, _cent_.y-_size_.height/2, _size_.height, _size_.width)

@implementation ZCVerticalButton

- (void)imageCentY:(float)_imageCentY
        imageSize:(CGSize)_imageSize
        titleCentY:(float)_titleCentY
        titleSize:(CGSize)_titleSize {
    float centX = self.center.x;
    
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
    m_imageViewFrame = CGRectFromCentAndSize(CGPointMake(centX, _titleCentY), _titleSize);
    
    [self layoutSubviews];
}

- (void)imageFrame:(CGRect)_imageFrame
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
