//
//  ZCBannerView.m
//  ZCBannerViewDemo
//
//  Created by 王志超 on 2017/10/10.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCBannerView.h"

@interface ZCBannerView ()

@property(nonatomic, strong) NSArray *imgViewArray;
@property(nonatomic, strong) UIPageControl *pageControl;

@property(nonatomic, strong) NSTimer *timer;

@end

#define RelativeLocation 17

@implementation ZCBannerView

- (void)initBanner:(NSArray *)urlArray {
    [self initBannerWithCount:urlArray.count imageViewBlock:^(UIImageView *imageView, int num) {
        imageView.image = [UIImage imageWithContentsOfFile:urlArray[num]];
    }];
}

- (void)initBannerWithCount:(NSInteger)count imageViewBlock:(void (^)(UIImageView *, int))imageViewBlock {
    [self stop];
    
    if(count <= 0) {
        NSLog(@"滚动栏文件为空");
        return;
    }
    
    if(!self.pageControl) {
        self.showsHorizontalScrollIndicator = NO;
        //self.scrollEnabled = NO;
        self.pagingEnabled = YES;
        
        self.pageControl = [[UIPageControl alloc] init];
        [self.superview addSubview:self.pageControl];
        [self.pageControl addTarget:self action:@selector(pageControlTap:) forControlEvents:UIControlEventValueChanged];
        //self.pageControl.enabled = NO;
    }
    for (UIView *imgView in self.imgViewArray) {
        [imgView removeFromSuperview];
    }
    
    
    NSMutableArray *imgViewArray = [NSMutableArray array];
    
//    NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:urlArray];
//    [tmpArray addObject:[urlArray firstObject]];
    NSInteger pageCount = count + 1;
    
    for (int i = 0; i < pageCount; i++) {
        UIImageView *imgView;
        if(i < self.imgViewArray.count) {
            imgView = self.imgViewArray[i];
        }else {
            imgView = [[UIImageView alloc] init];
        }
        imgView.frame = CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        imgView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:imgView];
        [imgViewArray addObject:imgView];
        
        imageViewBlock(imgView, i%count);
    }
    self.contentSize = CGSizeMake(pageCount*self.frame.size.width, self.frame.size.height);
    self.pageControl.frame = CGRectMake(0, self.frame.origin.y + self.frame.size.height - RelativeLocation, self.frame.size.width, 17);
    self.pageControl.numberOfPages = pageCount;
    self.pageControl.currentPage = 0;
}

//开启计时器
- (void)start {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
}

- (void)stop {
    if(self.timer.isValid) {
        [self.timer invalidate];
    }
}

- (void)pageControlTap:(UIPageControl *)page {
    [self scrollToPage:(int)page.currentPage];
}

- (void)scrollToNextPage {
    __block int page = self.contentOffset.x/self.frame.size.width+1;
    [self scrollToPage:page];
}

- (void)scrollToPage:(int)page {
    [UIView animateWithDuration:0.25 animations:^{
        self.contentOffset = CGPointMake(page*self.frame.size.width, 0);
    } completion:^(BOOL finished) {
        if(page >= self.contentSize.width/self.frame.size.width) {
            self.contentOffset = CGPointMake(0, 0);
        }
        self.pageControl.currentPage = self.contentOffset.x/self.frame.size.width;
    }];
}

#pragma mark - delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = self.contentOffset.x/self.frame.size.width;
}

@end
