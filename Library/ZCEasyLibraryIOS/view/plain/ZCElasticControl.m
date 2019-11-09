//
//  ZCElasticControl.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/12.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCElasticControl.h"
#import "UIColor+ZCSupp.h"
#import "UIView+ZCCornerRadius.h"

#define OK_BUTTON_HEIGHT 35

#define BackgroundViewColor [UIColor blackColor].zc_alpha(0.5)

@interface ZCElasticControl ()

/// view顶栏按钮
@property(nonatomic, strong) UIToolbar *topToolBar;
/// view顶栏按钮样式，仅自定义控件调用
@property(nonatomic, assign) ZCElasticControlTopToolBarStyle topToolBarStyle;

@end

@implementation ZCElasticControl
@synthesize zc_contentView;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    zc_topToolBarStyle = ZCElasticControlTopToolBarStyleNone;
    
    self.backgroundColor = self.backgroundColor ?: BackgroundViewColor;
    [self addTarget:self action:@selector(zc_hiddenView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    self.topToolBarStyle = zc_topToolBarStyle;
}

- (void)prepareForInterfaceBuilder {
    self.backgroundColor = self.backgroundColor ?: BackgroundViewColor;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (self.zc_contentView == object && [keyPath isEqualToString:@"frame"]) {
        self.topToolBar.frame = CGRectMake(0, CGRectGetMinY(self.zc_contentView.frame) - OK_BUTTON_HEIGHT, self.frame.size.width, OK_BUTTON_HEIGHT);
    }
}

- (UIView *)zc_contentView {
    if (!zc_contentView) {
        zc_contentView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width/4, self.frame.size.height/4, self.frame.size.height/2, self.frame.size.width/2)];
        zc_contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:zc_contentView];
        
        [self.zc_contentView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    }
    return zc_contentView;
}

- (UIView *)topToolBar {
    if (!_topToolBar) {
        _topToolBar = [[UIToolbar alloc] init];
        _topToolBar.clipsToBounds = YES;
        _topToolBar.hidden = YES;
        [self addSubview:_topToolBar];
    }
    return _topToolBar;
}

- (void)setTopToolBarStyle:(ZCElasticControlTopToolBarStyle)style {
    if (_topToolBarStyle == style)
        return;
    
    _topToolBarStyle = style;
    
    if (_topToolBarStyle == ZCElasticControlTopToolBarStyleOkAndCancel) {
        self.topToolBar.hidden = NO;
        
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(zc_hiddenView)];
        cancelItem.tintColor = UIColorFromRGB(0x666666);
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *okItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(okClick:)];
        self.topToolBar.items = @[cancelItem, flexibleSpace, okItem];
    } else if (_topToolBarStyle == ZCElasticControlTopToolBarStyleNone) {
        self.topToolBar.hidden = YES;
    }
}

- (void)okClick:(UIBarButtonItem *)okItem {
}

- (void)zc_showView {
    [self zc_showView:0];
}

- (void)zc_showView:(double)duration {
    [self.superview endEditing:YES];

    self.topToolBarStyle = zc_topToolBarStyle;
    
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
