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

@implementation ZCVerticalButton

- (void)imageCent:(CGPoint)_imageCent
        imageSize:(CGSize)_imageSize
        titleCent:(CGPoint)_titleCent
        titleSize:(CGSize)_titleSize {
    if(CGPointEqualToPoint(CGPointZero, _imageCent)) {
        if(CGSizeEqualToSize(CGSizeZero, _imageSize)) {
            m_imageViewFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2);
        }else {
            m_imageViewFrame = CGRectMake((self.frame.size.width-_imageSize.width)/2, 0, _imageSize.width, _imageSize.height);
        }
    }else {
        if(CGSizeEqualToSize(CGSizeZero, _imageSize)) {
            m_imageViewFrame = CGRectMake(0, 0, self.frame.size.width, _imageCent.y*2);
        }else {
            m_imageViewFrame = CGRectMake(_imageCent.x-_imageSize.width/2, _imageCent.y-_imageSize.height/2, _imageSize.width, _imageSize.height);
        }
    }
    if(CGPointEqualToPoint(CGPointZero, _titleCent)) {
        if(CGSizeEqualToSize(CGSizeZero, _titleSize)) {
            m_titleLabelFrame = CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2);
        }else {
            m_titleLabelFrame = CGRectMake((self.frame.size.width-_titleSize.width)/2, self.frame.size.height-_titleSize.height, _titleSize.width, _titleSize.height);
        }
    }else {
        if(CGSizeEqualToSize(CGSizeZero, _titleSize)) {
            m_titleLabelFrame = CGRectMake(0, self.frame.size.height-(self.frame.size.height-_titleCent.y)*2, self.frame.size.width, (self.frame.size.height-_imageCent.y)*2);
        }else {
            m_titleLabelFrame = CGRectMake(_titleCent.x-_titleSize.width/2, _titleCent.y-_titleSize.height/2, _titleSize.width, _titleSize.height);
        }
    }
    
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
