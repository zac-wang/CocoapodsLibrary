//
//  ZCPicturePreviewItem.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/13.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCPicturePreviewItem.h"

@interface ZCPicturePreviewItem() <UIScrollViewDelegate>
@property(nonatomic, strong) UIPanGestureRecognizer *pan;
@property(nonatomic, strong) UIPinchGestureRecognizer *pin;

/// 页码显示
//@property(nonatomic, readonly) UILabel *zc_pageLabel;
@end

@implementation ZCPicturePreviewItem
@synthesize zc_imgView;
@synthesize zc_index;
//@synthesize zc_pageLabel;

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.backgroundColor = [UIColor colorWithWhite:30/255.0 alpha:1];
        
        zc_imgView = [[UIImageView alloc] init];
        zc_imgView.userInteractionEnabled = YES;
        zc_imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:zc_imgView];
        
        self.delegate = self;
        self.maximumZoomScale = 2.0;
        self.minimumZoomScale = 1;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    self.zc_imgView.frame = self.bounds;
    self.contentSize = self.bounds.size;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return zc_imgView;
}

- (void)viewDidAppear {
    self.zc_loadding = NO;
}

- (void)viewDidDisappear {
    self.zc_loadding = NO;
    self.zoomScale = 1;
}

//        zc_pageLabel = [[UILabel alloc] init];
//        zc_pageLabel.textColor = [UIColor whiteColor];
//        [self addSubview:zc_pageLabel];

/*
 self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
 [self.imgView addGestureRecognizer:self.pan];
 
 self.pin = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pin:)];
 [self.imgView addGestureRecognizer:self.pin];
 */

/*
 //1.2.2拖动、平移
 -(void)pan:(UIPanGestureRecognizer *)pan {//平移
 CGPoint point = [pan translationInView:pan.view.superview];
 pan.view.center = CGPointMake(pan.view.center.x + point.x, pan.view.center.y + point.y);
 
 if(pan.state == UIGestureRecognizerStateBegan) {
 NSLog(@"%f - %f", point.x, point.y);
 if(point.y > 0 && point.y > fabs(point.x)) {
 self.imgView.userInteractionEnabled = YES;
 self.pan.enabled = YES;
 }else {
 self.imgView.userInteractionEnabled = NO;
 [self.imgView removeGestureRecognizer:self.pan];
 self.pan.enabled = NO;
 }
 }else if (pan.state == UIGestureRecognizerStateChanged) {
 self.imgView.userInteractionEnabled = YES;
 self.pan.enabled = YES;
 [self.imgView addGestureRecognizer:self.pan];
 }else {
 [pan setTranslation:CGPointZero inView:pan.view.superview];
 self.imgView.userInteractionEnabled = YES;
 self.pan.enabled = YES;
 [self.imgView addGestureRecognizer:self.pan];
 pan.view.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
 }
 [pan setTranslation:CGPointZero inView:pan.view.superview];
 }
 
 -(void)pin:(UIPinchGestureRecognizer *)pin{//缩放、捏合
 static CGSize _size;
 if(pin.state == UIGestureRecognizerStateBegan)//判断是否是触摸开始
 _size = pin.view.bounds.size;
 pin.view.bounds = CGRectMake(0, 0, _size.width * pin.scale, _size.height * pin.scale);
 
 //    NSLog(@"%f--%f", pin.view.bounds.size.width, self.bounds.size.width);
 UIGestureRecognizerState state = pin.state;
 if(pin.view.bounds.size.width < self.bounds.size.width) {
 if(state == UIGestureRecognizerStateEnded) {
 [UIView animateWithDuration:0.25 animations:^{
 pin.view.bounds = self.bounds;
 }];
 }
 self.contentSize = self.bounds.size;
 }else {
 self.contentSize = pin.view.bounds.size;
 }
 
 }
 */
/*
 - (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
 CGPoint point = [touches.anyObject previousLocationInView:self];
 
 if(point.y - self.frame.size.height/2 > 0) {
 //        [self.imgView addGestureRecognizer:self.pan];
 self.pan.enabled = YES;
 }
 }
 //
 - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
 if(self.imgView.center.y - self.frame.size.height/2 > 50) {
 NSLog(@"移除");
 }
 NSLog(@"一根或多根手指触摸结束离开屏幕时执行");
 self.imgView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
 //    [self.imgView removeGestureRecognizer:self.pan];
 self.pan.enabled = NO;
 }
 
 - (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
 self.imgView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
 NSLog(@"cancel");
 //    [self.imgView removeGestureRecognizer:self.pan];
 self.pan.enabled = NO;
 }
 */


@end
