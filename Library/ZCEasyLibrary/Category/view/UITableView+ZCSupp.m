//
//  UITableView+xiaoaiStyle.m
//  XAEmpAssistant
//
//  Created by zac on 2017/5/3.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import "UITableView+ZCSupp.h"

@implementation UITableView (ZCSupp)
@dynamic zc_autoCellHeight;

- (void)setZc_autoCellHeight:(int)zc_autoCellHeight {
    self.rowHeight = UITableViewAutomaticDimension;
    self.estimatedRowHeight = zc_autoCellHeight;
}

- (void)zc_updateTableViewConstraint:(void(^)(UITableView *tableView))block {
    [self beginUpdates];
    if(block) {
        block(self);
    }
    [self endUpdates];
}

@end
