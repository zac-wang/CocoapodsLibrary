//
//  UITableView+xiaoaiStyle.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/5/3.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ZCSupp)

/// 自动调整cell高度，并设置cell的估算高度
@property(nonatomic, readwrite) int zc_autoCellHeight;

/// 刷新UITableView高度（约束）
- (void)zc_updateTableViewConstraint:(void(^)(UITableView *tableView))block;

@end
