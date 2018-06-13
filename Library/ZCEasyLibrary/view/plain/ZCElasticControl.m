//
//  ZCElasticControl.m
//  Shopkeeper
//
//  Created by 王志超 on 2018/4/12.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "ZCElasticControl.h"
#import "UIColor+ZCSupp.h"
#import <ZCEasyLibraryPrivate/UIView+ZCCornerRadius.h>

@implementation ZCElasticControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor].zc_alpha(0.5);
        [self addTarget:self action:@selector(zc_hiddenView) forControlEvents:UIControlEventTouchUpInside];
        
        self.zc_backView = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width/4, frame.size.height/4, frame.size.height/2, frame.size.width/2)];
        self.zc_backView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.zc_backView];
        
        [self.zc_backView zc_drawCornerRadius:2];
    }
    return self;
}

- (UIView *(^)(CGRect))zc_newLineView {
    return ^UIView *(CGRect frame) {
        UIView *lineView = [[UIView alloc] initWithFrame:frame];
        lineView.backgroundColor = UIColorFromRGB(0xf2f2f2);
        return lineView;
    };
}

//- (void)setBodyFrame:(CGRect)bodyFrame {
//    super.bodyFrame = bodyFrame;
//
//}
//
//- (void)showView {
//    [super showView];
//}
//
//- (void)hiddenView {
//    [super hiddenView];
//}

- (void)setZc_bodyFrame:(CGRect)bodyFrame {
    self.zc_backView.frame = bodyFrame;
}

- (void)zc_showView {
    [self zc_showView:0];
}

- (void)zc_showView:(double)duration {
    [self.superview endEditing:YES];
    
    self.alpha = 0;
    self.hidden = NO;
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 1;
    }];
}

- (void)zc_hiddenView {
    [self zc_hiddenView:0 completion:nil];
}

- (void)zc_hiddenView:(double)duration completion:(void (^)(BOOL))completion {
    self.alpha = 1;
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
        self.alpha = 1;
        if(completion) {
            completion(finished);
        }
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
