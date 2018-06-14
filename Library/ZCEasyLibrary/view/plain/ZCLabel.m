//
//  ZCLabel.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCLabel.h"
#import "NSAttributedString+ZCSupp.h"
#import "NSString+ZCSize.h"

@implementation ZCLabel

- (float)zc_height {
    CGSize maxSize = CGSizeMake(self.frame.size.width, self.zc_maxHeight?:CGFLOAT_MAX);
    float attributedTextHeight = [self.attributedText zc_sizeWithMaxSize:maxSize].height;
    float textHeight = [self.text zc_sizeWithMaxSize:maxSize font:self.font].height;
    return attributedTextHeight > textHeight ? attributedTextHeight : textHeight;
}

- (void)zc_updateHeight {
    self.numberOfLines = 0;
    self.frame = ({ CGRect r = self.frame; r.size.height = self.zc_height; r; });
}

@end
