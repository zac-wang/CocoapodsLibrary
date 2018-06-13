//
//  UITableView+ZCPaging.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/10.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ZCPaging)

/**
 分页请求数据的 每页数据个数，不作任何处理，仅用于存储
 */
@property(nonatomic, assign) int zc_dataSourcePageSize;

/**
 分页请求数据的 当前页标示，不作任何处理，仅用于存储
 */
@property(nonatomic, assign) int zc_dataSourcePageOffset;

@end
