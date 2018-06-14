//
//  ZCTagView.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2018/5/21.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "ZCTagView.h"
#import "UIColor+ZCSupp.h"
#import "UIView+ZCCornerRadius.h"

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
    [ZCTagView zc_tagViews:self.zc_tagButtons btnHorizontalGap:self.zc_btnHorizontalGap btnVerticalGap:self.zc_btnVerticalGap btnHeight:self.zc_btnHeight isDisperse:self.zc_tagStyle];
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    [ZCTagView zc_tagViews:self.zc_tagButtons btnHorizontalGap:self.zc_btnHorizontalGap btnVerticalGap:self.zc_btnVerticalGap btnHeight:self.zc_btnHeight isDisperse:self.zc_tagStyle];
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
    
    [ZCTagView zc_tagViews:self.zc_tagButtons btnHorizontalGap:self.zc_btnHorizontalGap btnVerticalGap:self.zc_btnVerticalGap btnHeight:self.zc_btnHeight isDisperse:self.zc_tagStyle];
}

- (UIButton *)zc_dequeueReusableView {
    UIButton *btn;
    if(self.dequeueReusableButtonArray.count) {
        btn = self.dequeueReusableButtonArray.firstObject;
        [self.dequeueReusableButtonArray removeObject:btn];
    }else {
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = UIColorFromRGB(0x50a6fa);
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn zc_drawCornerRadius:2 borderColor:nil];
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

+ (void)zc_tagViews:(NSArray<UIView *> *)tagViews btnHorizontalGap:(double)btnHorizontalGap btnVerticalGap:(double)btnVerticalGap btnHeight:(double)btnHeight {
    [self zc_tagViews:tagViews btnHorizontalGap:btnHorizontalGap btnVerticalGap:btnVerticalGap btnHeight:btnHeight isDisperse:ZCTagViewStyleDefault];
}

+ (void)zc_tagViews:(NSArray<UIView *> *)tagViews btnHorizontalGap:(double)btnHorizontalGap btnVerticalGap:(double)btnVerticalGap btnHeight:(double)btnHeight isDisperse:(ZCTagViewStyle)isDisperse {
    if(tagViews.count == 0) {
        return;
    }
        
    double leftGap = 0;
    double rightGap = 0;
    double topGap = 0;
    
    double superViewWidth = tagViews.firstObject.superview.frame.size.width;
    double maxWidth = superViewWidth - leftGap - rightGap;
    double btnX = leftGap, btnY = topGap;
    
    NSMutableArray *lineButtonArr = [NSMutableArray array];
    for (int i= 0; i < tagViews.count; i++) {
        UIView *tagView = tagViews[i];
        CGSize btnSize = [tagView sizeThatFits:CGSizeMake(maxWidth, btnHeight)];
        if((maxWidth + leftGap - btnX) < btnSize.width) {
            btnX = leftGap;
            btnY = btnY + btnHeight + btnVerticalGap;
            
            [self disperseButtons:lineButtonArr isDisperse:isDisperse];
            [lineButtonArr removeAllObjects];
        }
        double btnWidth = btnSize.width < maxWidth ? btnSize.width : maxWidth;
        tagView.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        btnX = btnX + tagView.frame.size.width + btnHorizontalGap;
        
        [lineButtonArr addObject:tagView];
    }
    
    [self disperseButtons:lineButtonArr isDisperse:isDisperse];
}

+ (void)disperseButtons:(NSArray<UIView *> *)btns isDisperse:(ZCTagViewStyle)isDisperse {
    if(btns.count == 0 || isDisperse == ZCTagViewStyleDefault) {
        return;
    }
    
    double gapSum = btns.firstObject.superview.frame.size.width;
    for (UIView *v in btns) {
        gapSum -= v.frame.size.width;
    }
    if(isDisperse == ZCTagViewStyleCenter && btns.count == 1) {
        double gap = gapSum/2;
        CGRect r = btns.firstObject.frame;
        r.origin.x = gap;
        btns.firstObject.frame = r;
    }else {
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
