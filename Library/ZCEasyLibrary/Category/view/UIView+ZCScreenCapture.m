//
//  UIView+ZCScreenCapture.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/23.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "UIView+ZCScreenCapture.h"

@implementation UIView (ZCScreenCapture)

- (UIImage *)zc_screenCapture {
    //size大小，opaque不透明（YES）,若完全不用透明 YES可以优化位图的存储，scale比例缩放
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.layer.contentsScale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];//当前层渲染到上下文
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();//上下文形成图片
    UIGraphicsEndImageContext();//结束并删除当前基于位图的图形上下文。
    return image;
}

@end
