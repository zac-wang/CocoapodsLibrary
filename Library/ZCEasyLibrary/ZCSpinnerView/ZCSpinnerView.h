//
//  ZCSpinnerView.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/18.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCSpinnerView : UIControl

- (instancetype)initWithMaxFrame:(CGRect)maxFrame;
- (instancetype)initWithMaxFrame:(CGRect)maxFrame cellHeight:(int)cellHeight cellObject:(NSObject *)cellObject;

@property(nonatomic, strong) NSArray *zc_dataSource;
@property(nonatomic, strong) void(^zc_cell)(UITableViewCell *cell, NSIndexPath *indexPath);
@property(nonatomic, strong) void(^zc_selectEvent)(UITableViewCell *cell, NSIndexPath *indexPath, NSString *title);

@property(nonatomic, strong) UITableView *zc_tableView;
@property(nonatomic, assign) BOOL zc_isShow;

- (void)zc_show;
- (void)zc_hidden;

@end
