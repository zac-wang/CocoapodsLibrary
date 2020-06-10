//
//  ZCTagView.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/21.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCTagView.h"

@interface ZCTagView()
@property(nonatomic, strong) NSMutableArray<UIButton *> *dequeueReusableButtonArray;
@end

@implementation ZCTagView
@synthesize zc_tagTitles;
@synthesize zc_tagButtons;

- (void)initData {
    if(self.zc_btnHorizontalGap <= 0)
        self.zc_btnHorizontalGap = 5;
    if(self.zc_btnVerticalGap <= 0)
        self.zc_btnVerticalGap = 2;
    if(self.zc_btnHeight <= 0)
        self.zc_btnHeight = 15;
}

- (void)cleanButton {
    if(!self.dequeueReusableButtonArray) {
        self.dequeueReusableButtonArray = [NSMutableArray array];
    }
    for (UIButton *btn in self.subviews) {
        if([btn isKindOfClass:[UIButton class]]) {
            [btn removeFromSuperview];
            [self.dequeueReusableButtonArray addObject:btn];
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self zc_updateViewFrame];
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    [self zc_updateViewFrame];
}

- (void)prepareForInterfaceBuilder {
    self.zc_tagTitles = @[@"San Jose", @"Sunnyvale", @"Cupertino", @"Saratoga", @"Los Gatos", @"Santa Clara", @"Los Altos", @"Milpitas", @"Mountain View", @"Other Location"];
}

- (void)setZc_tagTitles:(NSArray<NSString *> *)tagTitles {
    zc_tagTitles = tagTitles;
    
    [self initData];
    
    [self cleanButton];
    
    NSMutableArray *btnArr = [NSMutableArray array];
    for (int i = 0; i < self.zc_tagTitles.count; i++) {
        UIButton *btn = [self zc_dequeueReusableView];//[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:self.zc_tagTitles[i] forState:UIControlStateNormal];
        btn.tag = i;
        [self addSubview:btn];
        [btnArr addObject:btn];
    }
    zc_tagButtons = btnArr;
    
    [self zc_updateViewFrame];
}

- (UIButton *)zc_dequeueReusableView {
    UIButton *btn;
    if(self.dequeueReusableButtonArray.count) {
        btn = self.dequeueReusableButtonArray.firstObject;
        [self.dequeueReusableButtonArray removeObject:btn];
    }else {
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor colorWithRed:0x50/255.0 green:0xa6/255.0 blue:0xfa/255.0 alpha:1];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        btn.layer.cornerRadius = 2;
        btn.layer.masksToBounds = YES;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(zc_btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

- (void)zc_btnClick:(UIButton *)btn {
    if(self.zc_btnClickBlock)
        self.zc_btnClickBlock(btn);
}

- (double)zc_viewHeight {
    double maxHeight = 0;
    for (UIButton *btn in self.zc_tagButtons) {
        if([btn isKindOfClass:[UIButton class]]) {
            double height = btn.frame.origin.y + btn.frame.size.height;
            maxHeight = maxHeight > height ? maxHeight : height;
        }
    }
    return maxHeight;
}

- (void)zc_updateViewFrame {
    if(self.zc_tagButtons.count == 0) {
        return;
    }
        
    double leftGap = 0;
    double rightGap = 0;
    double topGap = 0;
    
    double superViewWidth = self.zc_tagButtons.firstObject.superview.frame.size.width;
    double maxWidth = superViewWidth - leftGap - rightGap;
    double btnX = leftGap, btnY = topGap;
    
    NSMutableArray *lineButtonArr = [NSMutableArray array];
    for (int i= 0; i < self.zc_tagButtons.count; i++) {
        UIView *tagView = self.zc_tagButtons[i];
        CGSize btnSize = [tagView sizeThatFits:CGSizeMake(maxWidth, self.zc_btnHeight)];
        if((maxWidth + leftGap - btnX) < btnSize.width) {
            btnX = leftGap;
            btnY = btnY + self.zc_btnHeight + self.zc_btnVerticalGap;
            
            [self disperseButtons:lineButtonArr];
            [lineButtonArr removeAllObjects];
        }
        double btnWidth = btnSize.width < maxWidth ? btnSize.width : maxWidth;
        tagView.frame = CGRectMake(btnX, btnY, btnWidth, self.zc_btnHeight);
        btnX = btnX + tagView.frame.size.width + self.zc_btnHorizontalGap;
        
        [lineButtonArr addObject:tagView];
    }
    
    [self disperseButtons:lineButtonArr];
}

- (void)disperseButtons:(NSArray<UIView *> *)btns {
    if(btns.count == 0 || self.zc_tagStyle == ZCTagViewStyleDefault) {
        return;
    }
    
    double gapSum = btns.firstObject.superview.frame.size.width;
    for (UIView *v in btns) {
        gapSum -= v.frame.size.width;
    }
    if(self.zc_tagStyle == ZCTagViewStyleCenter && btns.count == 1) {
        double gap = gapSum/2;
        CGRect r = btns.firstObject.frame;
        r.origin.x = gap;
        btns.firstObject.frame = r;
    } else {
        double gap = gapSum/(btns.count - 1);
        double x = 0;
        for (UIView *v in btns) {
            CGRect r = v.frame;
            r.origin.x = x;
            v.frame = r;
            x = r.origin.x + r.size.width + gap;
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
