//
//  ZCSpinnerView.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/18.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCSpinnerView : UIControl

- (instancetype)initWithMaxFrame:(CGRect)maxFrame;
- (instancetype)initWithMaxFrame:(CGRect)maxFrame cellHeight:(int)cellHeight cellObject:(NSObject *)cellObject;

@property(nonatomic, strong) NSArray *dataSource;
@property(nonatomic, strong) void(^cell)(UITableViewCell *cell, NSIndexPath *indexPath);
@property(nonatomic, strong) void(^selectEvent)(UITableViewCell *, NSIndexPath *indexPath);

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, assign) BOOL isShow;

- (void)show;
- (void)hidden;

@end
