//
//  UIViewController+emptyData.m
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/6/15.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import "UIViewController+emptyData.h"
#import <objc/runtime.h>

@interface UIViewController ()

@property(nonatomic, strong) UIView      *emptyDataView;
@property(nonatomic, strong) UIImageView *emptyDataIconView;
@property(nonatomic, strong) UILabel     *emptyDataLabel;
@property(nonatomic, strong) UIButton    *emptyDataButton;

@end

@implementation UIViewController (emptyData)

- (UIView *)emptyDataView {
    return objc_getAssociatedObject(self, @"emptyDataView");
}

- (void)setEmptyDataView:(UIView *)emptyDataView {
    objc_setAssociatedObject(self, @"emptyDataView", emptyDataView, OBJC_ASSOCIATION_RETAIN);
}

- (UIImageView *)emptyDataIconView {
    return objc_getAssociatedObject(self, @"emptyDataIconView");
}

- (void)setEmptyDataIconView:(UIImageView *)emptyDataIconView {
    objc_setAssociatedObject(self, @"emptyDataIconView", emptyDataIconView, OBJC_ASSOCIATION_RETAIN);
}

- (UILabel *)emptyDataLabel {
    return objc_getAssociatedObject(self, @"emptyDataLabel");
}

- (void)setEmptyDataLabel:(UILabel *)emptyDataLabel {
    objc_setAssociatedObject(self, @"emptyDataLabel", emptyDataLabel, OBJC_ASSOCIATION_RETAIN);
}

- (UIButton *)emptyDataButton {
    return objc_getAssociatedObject(self, @"emptyDataButton");
}

- (void)setEmptyDataButton:(UIButton *)emptyDataButton {
    objc_setAssociatedObject(self, @"emptyDataButton", emptyDataButton, OBJC_ASSOCIATION_RETAIN);
}

- (CGRect)emptyDataFrame {
    NSString *rect = objc_getAssociatedObject(self, @"emptyDataFrame");
    return rect?CGRectFromString(rect):CGRectZero;
}

- (void)setEmptyDataFrame:(CGRect)emptyDataFrame {
    if(self.emptyDataView) {
        self.emptyDataView.frame = emptyDataFrame;
    }
    objc_setAssociatedObject(self, @"emptyDataFrame", NSStringFromCGRect(emptyDataFrame), OBJC_ASSOCIATION_RETAIN);
}

- (void)initialEmptyDataViewWithView:(UIView *)view {
    NSLog(@"%@", NSStringFromCGRect(self.emptyDataFrame));
    if(self.emptyDataFrame.size.width==0 &&
       self.navigationController &&
       [self isKindOfClass:NSClassFromString(@"BaseTableViewController")] &&
       self.automaticallyAdjustsScrollViewInsets == YES) {
        self.emptyDataFrame = CGRectMake(0, 0, view.size.width, view.size.height - 64);
    }
    self.emptyDataView = [[UIView alloc] initWithFrame:self.emptyDataFrame.size.width==0?view.bounds:self.emptyDataFrame];
    self.emptyDataView.backgroundColor = [UIColor whiteColor];
    self.emptyDataView.hidden = YES;
    [view addSubview:self.emptyDataView];
    
    self.emptyDataIconView = [[UIImageView alloc] initWithFrame:CGRectMake((self.emptyDataView.bounds.size.width-110)/2, self.emptyDataView.bounds.size.height/2-105, 120, 80)];
    self.emptyDataIconView.image = [UIImage imageNamed:@"empty_data_icon"];
    [self.emptyDataView addSubview:self.emptyDataIconView];
    
    self.emptyDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.emptyDataIconView.frame.origin.y + self.emptyDataIconView.frame.size.height + 10, self.emptyDataView.bounds.size.width-30, 50*kScaling375)];
    self.emptyDataLabel.numberOfLines = 0;
    self.emptyDataLabel.font = [UIFont systemFontOfSize:15*kScaling375];
    self.emptyDataLabel.textAlignment = NSTextAlignmentCenter;
    self.emptyDataLabel.textColor = [UIColor colorWithRed:0.84 green:0.84 blue:0.84 alpha:1.00];
    [self.emptyDataView addSubview:self.emptyDataLabel];
    
    self.emptyDataButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.emptyDataButton.frame = CGRectMake(15, self.emptyDataLabel.frame.origin.y + self.emptyDataLabel.frame.size.height + 10, self.emptyDataView.bounds.size.width-30, 20);
    self.emptyDataButton.titleLabel.font = [UIFont boldSystemFontOfSize:15*kScaling375];
    [self setEmptyDataTitle:@"什么都没有哦~" buttonTitle:nil];
    [self.emptyDataButton setTitleColor:ColorBlueMain forState:UIControlStateNormal];
    [self.emptyDataButton addTarget:self action:@selector(emptyDataEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.emptyDataView addSubview:self.emptyDataButton];
}

- (BOOL)showEmptyData {
    return !self.emptyDataView.hidden;
}

- (void)setShowEmptyData:(BOOL)showEmptyData {
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        self.emptyDataView.hidden = !showEmptyData;
    });
}

- (void)setEmptyDataTitle:(NSString *)title buttonTitle:(NSString *)buttonTitle {
    self.emptyDataLabel.text = title;
    [self.emptyDataButton setTitle:buttonTitle forState:UIControlStateNormal];
    self.emptyDataButton.frame = CGRectMake(15, self.emptyDataLabel.frame.origin.y + self.emptyDataLabel.frame.size.height + 10, self.emptyDataView.bounds.size.width-30, 20);

    self.emptyDataButton.hidden = !buttonTitle;
    
}

- (void)emptyDataEvent:(UIButton *)btn {
    
}

@end
