//
//  UIImageView+ZCGif.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/12/4.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "UIImageView+ZCGif.h"
#import <ImageIO/ImageIO.h>

#define GifAnimationKey @"gifAnimation"

@implementation UIImageView (ZCGif)

- (void)zc_gifImage:(NSString *)gifPath repeatCount:(float)repeatCount {
    [self.layer removeAnimationForKey:GifAnimationKey];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:gifPath]) {
        NSLog(@"ZCGif gi文件不存在");
        return;
    }
    if(repeatCount == 0) {
        repeatCount = CGFLOAT_MAX;
    }
    
    CGImageSourceRef  cImageSource = CGImageSourceCreateWithURL((__bridge CFURLRef)[NSURL fileURLWithPath:gifPath], NULL);
    size_t imageCount = CGImageSourceGetCount(cImageSource);
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:imageCount];
    NSMutableArray *times = [[NSMutableArray alloc] initWithCapacity:imageCount];
    
    float totalTime = 0;
    for (size_t i = 0; i < imageCount; i++) {
        CGImageRef cgimage= CGImageSourceCreateImageAtIndex(cImageSource, i, NULL);
        [images addObject:(__bridge id)cgimage];
        CGImageRelease(cgimage);
        
        NSDictionary *properties = (__bridge NSDictionary *)CGImageSourceCopyPropertiesAtIndex(cImageSource, i, NULL);
        NSDictionary *gifProperties = [properties valueForKey:(__bridge NSString *)kCGImagePropertyGIFDictionary];
        NSString *gifDelayTime = [gifProperties valueForKey:(__bridge NSString* )kCGImagePropertyGIFDelayTime];
        if(!gifDelayTime) {
            gifDelayTime = @"0.1";
        }
        [times addObject:gifDelayTime];
        totalTime += [gifDelayTime floatValue];
        
        CGSize _size;
        _size.width = [[properties valueForKey:(NSString*)kCGImagePropertyPixelWidth] floatValue];
        _size.height = [[properties valueForKey:(NSString*)kCGImagePropertyPixelHeight] floatValue];
    }
    
    NSMutableArray *keyTimes = [[NSMutableArray alloc] initWithCapacity:imageCount];
    float currentTime = 0;
    for (NSNumber *time in times) {
        float keyTime = currentTime / totalTime;
        [keyTimes addObject:[NSNumber numberWithFloat:keyTime]];
        currentTime += [time floatValue];
    }
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animation setValues:images];
    [animation setKeyTimes:keyTimes];
    animation.duration = totalTime;
    animation.repeatCount = repeatCount;
    animation.delegate = self;
    [self.layer addAnimation:animation forKey:GifAnimationKey];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    //NSLog(@"%s 播放结束", __FUNCTION__);
}

@end