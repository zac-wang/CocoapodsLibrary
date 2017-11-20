//
//  UITableView+xiaoaiStyle.h
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/5/3.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (xiaoaiStyle)

/**
 分页请求数据的 每页数据个数，不作任何处理，仅用于存储
 */
@property(nonatomic, assign) int zc_dataSourcePageSize;

/**
 分页请求数据的 当前页标示，不作任何处理，仅用于存储
 */
@property(nonatomic, assign) int zc_dataSourcePageOffset;

- (void)zc_setXiaoAiStyle;
- (void)zc_setXiaoAiStyleWithSeparatorLeft:(float)separatorLeft;
- (void)zc_setXiaoAiStyleWithSeparatorHexColor:(long)hex;
- (void)zc_setXiaoAiStyleWithSeparatorLeft:(float)separatorLeft separatorHexColor:(long)hex;

@end
