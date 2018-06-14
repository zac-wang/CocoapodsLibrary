//
//  ZCBannerView.m
//  ZCBannerViewDemo
//
//  Created by zac on 2017/10/10.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCBannerView.h"
#import "ZCBannerImageView.h"

@interface ZCBannerView () <UIScrollViewDelegate>

/// 复用池
@property(nonatomic, strong) NSMutableArray<ZCBannerImageView *> *imgViewArray;

@property(nonatomic, strong) NSTimer *timer;

@end

#define RelativeLocation 17

@implementation ZCBannerView
@synthesize zc_pageControl;

#pragma mark - 
- (void)zc_initBanner:(NSArray *)fileUrlArray {
    [self zc_initBannerWithCount:fileUrlArray.count imageViewBlock:^(UIImageView *imageView, int num) {
        //NSLog(@"%@", fileUrlArray[num]);
        imageView.image = [UIImage imageWithContentsOfFile:fileUrlArray[num]];
    }];
}

- (void)zc_initBannerWithCount:(NSInteger)count imageViewBlock:(void (^)(UIImageView *, int))block {
    [self zc_stop];
    
    if(count <= 0) {
        NSLog(@"滚动栏文件为空");
        return;
    }
    
    self.delegate = self;
    //self.scrollEnabled = NO;
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    
    for (ZCBannerImageView *imgView in self.subviews) {
        if([imgView isKindOfClass:[ZCBannerImageView class]]) {
            [self.imgViewArray addObject:imgView];
            [imgView removeFromSuperview];
        }
    }
    
    
    
    NSInteger pageCount = count + 2;
    float imgWidth = self.frame.size.width;
    for (int i = 0; i < pageCount; i++) {
        ZCBannerImageView *imgView = [self dequeueReusableImageView];
        imgView.frame = CGRectMake(i*imgWidth, 0, imgWidth, self.frame.size.height);
        imgView.zc_index = (i+count-1)%count;
        [self addSubview:imgView];
        
        block(imgView, (int)imgView.zc_index);
    }
    self.contentSize = CGSizeMake(pageCount*imgWidth, 0);
    
    self.zc_pageControl.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height - RelativeLocation, imgWidth, RelativeLocation);
    // 图片数量
    self.zc_pageControl.numberOfPages = count;
    
    [self scrollToPage:0 animateDuration:0.25];
}

- (UIPageControl *)zc_pageControl {
    if(!zc_pageControl) {
        self.imgViewArray = [NSMutableArray array];
        
        zc_pageControl = [[UIPageControl alloc] init];
        [zc_pageControl addTarget:self action:@selector(pageControlTap:) forControlEvents:UIControlEventValueChanged];
        zc_pageControl.enabled = NO;
        [self.superview addSubview:zc_pageControl];
    }
    return zc_pageControl;
}

- (ZCBannerImageView *)dequeueReusableImageView {
    ZCBannerImageView *imgView;
    if(self.imgViewArray.count) {
        imgView = self.imgViewArray.firstObject;
        [self.imgViewArray removeObject:imgView];
    }else {
        imgView = [[ZCBannerImageView alloc] init];
        imgView.userInteractionEnabled = YES;
        imgView.contentMode = UIViewContentModeScaleToFill;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zc_imageClick:)];
        [imgView addGestureRecognizer:tapGesture];
    }
    return imgView;
}

- (int)nowPage {
    int page = roundf(self.contentOffset.x/self.frame.size.width);//四舍五入
    return page - 1;
}

- (void)zc_imageClick:(UITapGestureRecognizer *)tap {
    if(self.zc_selectImageView) {
        ZCBannerImageView *imgView = (ZCBannerImageView *)tap.view;
        self.zc_selectImageView(imgView, imgView.zc_index);
    }
}

#pragma mark - 计时器
- (void)zc_start {
    if(self.zc_oneImageNotRolling && self.contentSize.width == self.frame.size.width) {
        return;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.zc_timeInterval?:3 target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)zc_stop {
    if(self.timer.isValid) {
        [self.timer invalidate];
    }
}

#pragma mark -
- (void)pageControlTap:(UIPageControl *)page {
    [self scrollToPage:(int)page.currentPage animateDuration:0.25];
}

#pragma mark - 切换到下一页
- (void)scrollToNextPage {
    [self scrollToPage:self.nowPage+1 animateDuration:0.25];
}

#pragma mark 切换到指定页
- (void)scrollToPage:(int)page animateDuration:(double)duration {
    [UIView animateWithDuration:duration animations:^{
        [self scrollToPage:page];
    } completion:^(BOOL finished) {
        [self check];
    }];
}

- (void)scrollToPage:(int)page {
    //NSLog(@"切换到页面-%d", page);
    self.contentOffset = CGPointMake((page+1)*self.frame.size.width, 0);
    self.zc_pageControl.currentPage = page;
}

#pragma mark 校验是否是最后一张
- (void)check {
    if(self.contentOffset.x >= self.contentSize.width - self.frame.size.width) {
        [self scrollToPage:0];
    }else if(self.contentOffset.x < self.frame.size.width) {
        int totalScrollPage = self.contentSize.width/self.frame.size.width;
        [self scrollToPage:totalScrollPage-3];
    }
}

#pragma mark -
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self check];
}

@end
