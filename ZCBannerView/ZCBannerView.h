//
//  ZCBannerView.h
//  ZCBannerViewDemo
//
//  Created by 王志超 on 2017/10/10.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCBannerView : UIScrollView

//ZCBannerView *banerScrollView = [[ZCBannerView alloc] initWithFrame:CGRectMake(0, 240, self.view.frame.size.width, 200)];
//banerScrollView.center = self.view.center;
//[self.view addSubview:banerScrollView];
//[banerScrollView initBanner:[[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:@"main_banner"]];

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.banerScrollView start];
//}
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self.banerScrollView stop];
//}



- (void)initBanner:(NSArray *)urlArray;
- (void)initBannerWithCount:(NSInteger)count imageViewBlock:(void(^)(UIImageView *imageView, int num))block;

@property(nonatomic, assign) BOOL oneImageNotRolling;//YES:单个页面不滚动，默认NO

- (void)start;
- (void)stop;

@end
