//
//  UIView+ZCScreenCapture.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/23.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "UIView+ZCScreenCapture.h"

@implementation UIView (ZCScreenCapture)

- (UIImage *)zc_screenCapture {
    //size大小，opaque不透明（YES）,若完全不用透明 YES可以优化位图的存储，scale比例缩放
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];//当前层渲染到上下文
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();//上下文形成图片
    UIGraphicsEndImageContext();//结束并删除当前基于位图的图形上下文。
    return image;
}

@end
