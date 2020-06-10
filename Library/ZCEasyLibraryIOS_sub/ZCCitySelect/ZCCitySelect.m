//
//  ZCCitySelect.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/5/4.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCCitySelect.h"

@interface ZCCitySelect ()

/// view顶栏按钮
@property(nonatomic, strong) UIToolbar *topToolBar;

@end

@implementation ZCCitySelect

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self addTarget:self action:@selector(zc_hiddenView) forControlEvents:UIControlEventTouchUpInside];
        
        self.frame = frame;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    
    float citySelectViewH = 216;
    self.zc_citySelectView.frame = CGRectMake(0, self.frame.size.height - citySelectViewH, self.frame.size.width, citySelectViewH);
    float topToolBarH = 44;
    self.topToolBar.frame        = CGRectMake(0, self.zc_citySelectView.frame.origin.y - topToolBarH, frame.size.width, topToolBarH);
}

- (UIView *)topToolBar {
    if (!_topToolBar) {
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(zc_hiddenView)];
        cancelItem.tintColor = [UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1];
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *okItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(okClick:)];
        
        _topToolBar = [[UIToolbar alloc] init];
        _topToolBar.clipsToBounds = YES;
        _topToolBar.items = @[cancelItem, flexibleSpace, okItem];
        [self addSubview:_topToolBar];
    }
    return _topToolBar;
}

- (ZCCitySelectView *)zc_citySelectView {
    if (!_zc_citySelectView) {
        _zc_citySelectView = [[ZCCitySelectView alloc] initWithFrame:CGRectZero];
        [self addSubview:_zc_citySelectView];
    }
    return _zc_citySelectView;
}

- (void)okClick:(UIBarButtonItem *)okItem {
    if(self.zc_eventClick) {
        [self.zc_citySelectView zc_nowSelectCityInfo:self.zc_eventClick];
    }
    [self zc_hiddenView];
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
        self.alpha  = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
        self.alpha  = 1;
        if(completion) {
            completion(finished);
        }
    }];
}

@end
