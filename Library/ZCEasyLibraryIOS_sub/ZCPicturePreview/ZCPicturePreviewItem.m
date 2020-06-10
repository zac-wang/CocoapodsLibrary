//
//  ZCPicturePreviewItem.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/13.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCPicturePreviewItem.h"

@interface ZCPicturePreviewItem() <UIScrollViewDelegate>
/// 图片是否已设置加载，防止scrollf滚动过程中多次调用
@property(nonatomic, assign)   BOOL zc_loadding;
@end

@implementation ZCPicturePreviewItem
@synthesize zc_imgView;
@synthesize zc_index;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
        self.maximumZoomScale = 10.0;
        self.minimumZoomScale = 1;
        self.backgroundColor = [UIColor colorWithWhite:30/255.0 alpha:1];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    self.zc_imgView.frame = self.bounds;
    self.contentSize = self.bounds.size;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.zc_imgView;
}

- (void)zc_viewDidDisappear {
    self.zoomScale = 1;
}

- (UIImageView *)zc_imgView {
    if (!zc_imgView) {
    zc_imgView = [[UIImageView alloc] init];
    zc_imgView.userInteractionEnabled = YES;
    zc_imgView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:zc_imgView];
    }
    return zc_imgView;
}

- (void)setZc_index:(NSUInteger)index {
    zc_index = index;
}

@end
