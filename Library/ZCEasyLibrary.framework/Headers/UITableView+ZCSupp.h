//
//  UITableView+xiaoaiStyle.h
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/5/3.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ZCSupp)

/**
 分页请求数据的 每页数据个数，不作任何处理，仅用于存储
 */
@property(nonatomic, assign) int zc_dataSourcePageSize;

/**
 分页请求数据的 当前页标示，不作任何处理，仅用于存储
 */
@property(nonatomic, assign) int zc_dataSourcePageOffset;

/// 自动调整cell高度，并设置cell的估算高度
@property(nonatomic, readwrite) int zc_autoCellHeight;

/// 刷新UITableView高度（约束）
- (void)zc_updateTableViewConstraint:(void(^)(UITableView *tableView))block;

@end
