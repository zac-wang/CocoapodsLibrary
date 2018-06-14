//
//  UIImage+ZCSupp.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/1.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZCSupp)

/// 根据图片流数据创建图片
+ (UIImage *)zc_imageWithImageStream:(CVImageBufferRef)imageBuffer;

/// 放大或缩小图片
- (UIImage *)zc_imageFromSize:(CGSize)size;

@end
