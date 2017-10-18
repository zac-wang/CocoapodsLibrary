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
    [self stop];
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
    
    NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:urlArray];
    [tmpArray addObject:[urlArray firstObject]];
    
    for (int i = 0; i < tmpArray.count; i++) {
        NSString *path = tmpArray[i];
        UIImageView *imgView;
        if(i < self.imgViewArray.count) {
            imgView = self.imgViewArray[i];
        }else {
            imgView = [[UIImageView alloc] init];
        }
        imgView.frame = CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        
        imgView.image = [UIImage imageWithContentsOfFile:path];
        imgView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:imgView];
        
        [imgViewArray addObject:imgView];
    }
    self.contentSize = CGSizeMake(urlArray.count*self.frame.size.width, self.frame.size.height);
    self.pageControl.frame = CGRectMake(0, self.frame.origin.y + self.frame.size.height - RelativeLocation, self.frame.size.width, 17);
    self.pageControl.numberOfPages = urlArray.count;
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
