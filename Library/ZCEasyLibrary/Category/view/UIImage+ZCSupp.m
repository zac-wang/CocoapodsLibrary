//
//  UIImage+ZCSupp.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/1.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UIImage+ZCSupp.h"

@implementation UIImage (ZCSupp)

+ (UIImage *)zc_imageWithImageStream:(CVImageBufferRef)imageBuffer {
    CIImage *ciImage = [CIImage imageWithCVPixelBuffer:imageBuffer];
    CIContext *temporaryContext = [CIContext contextWithOptions:nil];
    CGImageRef videoImage = [temporaryContext
                             createCGImage:ciImage
                             fromRect:CGRectMake(0, 0,
                                                 CVPixelBufferGetWidth(imageBuffer),
                                                 CVPixelBufferGetHeight(imageBuffer))];
    
    UIImage *image = [[UIImage alloc] initWithCGImage:videoImage];
    
    CGImageRelease(videoImage);
    return image;
}

- (UIImage*)zc_imageFromSize:(CGSize)size {
    if(size.width == 0 && size.height == 0) {
        return self;
    }
    if(size.width == 0) {
        size.width = size.height/self.size.height*self.size.width;
    }
    if(size.height == 0) {
        size.height = size.width/self.size.width*self.size.height;
    }
    
    UIGraphicsBeginImageContext(size);// 创建一个bitmap的context// 并把它设置成为当前正在使用的context
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];//按指定大小 绘制图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();// 从当前context中创建一个改变大小后的图片
    UIGraphicsEndImageContext();// 使当前的context出堆栈
    return scaledImage;// 返回新的改变大小后的图片
}

@end
