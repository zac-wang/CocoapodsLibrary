//
//  ZCAlertView.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2018/5/17.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "ZCAlertView.h"
#import "UIColor+ZCSupp.h"
#import "UIView+ZCCornerRadius.h"

@interface ZCAlertView()
@property(nonatomic, strong) UIView *headBackView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *msgLabel;

@property(nonatomic, strong) UIView *btnBackView;
@property(nonatomic, strong) UIButton *cancelButton;
@property(nonatomic, strong) NSMutableArray<UIButton *> *buttonArray;
@property(nonatomic, strong) NSMutableDictionary<UIButton *, ZCAlertActionHandle> *buttonHandleMap;
@end

#define BackViewWidth 270.5
#define BtnHeight 44
#define BtnTopLineHeight 0.5

@implementation ZCAlertView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidden = YES;
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor blackColor].zc_alpha(0.5);
        [self removeTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
        
        [self.zc_backView zc_drawCornerRadius:10];
        
        self.headBackView = [[UIView alloc] init];
        [self.zc_backView addSubview:self.headBackView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.headBackView addSubview:self.titleLabel];
        
        self.msgLabel = [[UILabel alloc] init];
        self.msgLabel.font = [UIFont systemFontOfSize:12];
        self.msgLabel.textColor = [UIColor blackColor];
        self.msgLabel.textAlignment = NSTextAlignmentCenter;
        [self.headBackView addSubview:self.msgLabel];
        
        self.btnBackView = [[UIView alloc] init];
        [self.zc_backView addSubview:self.btnBackView];
        
        self.buttonArray = [NSMutableArray array];
        self.buttonHandleMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)updateButtons {
    NSUInteger btnLineNum = (self.cancelButton ? 1 : 0) + self.buttonArray.count;
    if (btnLineNum == 2) {
        UIView *lineView = self.zc_newLineView(CGRectMake(0, 0, BackViewWidth, BtnTopLineHeight));
        lineView.backgroundColor = UIColorFromRGB(0xdbdbdf);
        [self.btnBackView addSubview:lineView];
        
        double width = (BackViewWidth-BtnTopLineHeight)/2;
        UIButton *leftBtn = self.cancelButton ?: self.buttonArray.firstObject;
        UIButton *rightBtn = self.cancelButton ? self.buttonArray.firstObject : self.buttonArray.lastObject;
        leftBtn.frame = CGRectMake(0, BtnTopLineHeight, width, BtnHeight);
        rightBtn.frame = CGRectMake(width+0.5, BtnTopLineHeight, width, BtnHeight);
        
        UIView *verticalView = self.zc_newLineView(CGRectMake(width, 0, 0.5, BtnHeight));
        verticalView.backgroundColor = UIColorFromRGB(0xdbdbdf);
        [self.btnBackView addSubview:verticalView];
    }else {
        NSMutableArray<UIButton *> *btnArray = [self.buttonArray mutableCopy];
        if(self.cancelButton) {
            [btnArray addObject:self.cancelButton];
        }
        for (int i = 0; i < btnLineNum; i++) {
            UIView *lineView = self.zc_newLineView(CGRectMake(0, i*(BtnHeight + BtnTopLineHeight), BackViewWidth, BtnTopLineHeight));
            lineView.backgroundColor = UIColorFromRGB(0xdbdbdf);
            [self.btnBackView addSubview:lineView];
            
            UIButton *btn = btnArray[i];
            btn.frame = CGRectMake(0, i*(BtnHeight + BtnTopLineHeight) + BtnTopLineHeight, BackViewWidth, BtnHeight);
        }
    }
    btnLineNum = btnLineNum <= 2 ? 1 : btnLineNum;
    self.btnBackView.frame = CGRectMake(0, self.headBackView.frame.size.height, BackViewWidth, btnLineNum*(BtnHeight + BtnTopLineHeight));
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    ZCAlertView *alertView = [self init];
    // title和message 只有一个则给title
    alertView.titleLabel.text = title ?: message;
    alertView.msgLabel.text = title ? message : nil;
    return alertView;
}

- (UIButton *)buttonWithTitle:(NSString *)title handler:(ZCAlertActionHandle)handler {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.08 green:0.49 blue:0.98 alpha:1.00] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(zc_hiddenView) forControlEvents:UIControlEventTouchUpInside];
    [self.btnBackView addSubview:btn];
    
    self.buttonHandleMap[(id)btn] = handler;
    return btn;
}

/// 添加默认按钮
- (UIButton *)zc_addDefaultAction:(NSString *)title handler:(ZCAlertActionHandle)handler {
    UIButton *btn = [self buttonWithTitle:title handler:handler];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.buttonArray addObject:btn];
    return btn;
}

/// 添加取消按钮，无事件，传nil则显示“取消”
- (UIButton *)zc_addCancelAction:(NSString *)title {
    return [self zc_addCancelAction:title?:@"取消" handler:nil];
}

/// 添加取消按钮
- (UIButton *)zc_addCancelAction:(NSString *)title handler:(ZCAlertActionHandle)handler {
    self.cancelButton = [self buttonWithTitle:title handler:handler];
    self.cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    return self.cancelButton;
}

- (void)buttonClick:(UIButton *)btn {
    [self zc_hiddenView:0.25 completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)zc_show {
    if(self.titleLabel.text.length && self.msgLabel.text.length) {
        self.titleLabel.frame = CGRectMake(0, 17, BackViewWidth, 26);
        self.msgLabel.frame = CGRectMake(0, 40, BackViewWidth, 22);
        self.headBackView.frame = CGRectMake(0, 0, BackViewWidth, 80);
    }else if(self.titleLabel.text.length || self.msgLabel.text.length) {
        self.titleLabel.frame = CGRectMake(0, 0, BackViewWidth, 60);
        self.msgLabel.frame = CGRectZero;
        self.headBackView.frame = CGRectMake(0, 0, BackViewWidth, 60);
    }else{
        self.titleLabel.frame = CGRectZero;
        self.msgLabel.frame = CGRectZero;
        self.headBackView.frame = CGRectZero;
    }
    
    [self updateButtons];
    
    self.zc_backView.frame = CGRectMake(0, 0, BackViewWidth, self.btnBackView.frame.origin.y + self.btnBackView.frame.size.height);
    self.zc_backView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);

    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self zc_showView];
}

- (void)zc_showView {
    [self.superview endEditing:YES];
    
    self.alpha = 0;
    self.hidden = NO;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
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
