//
//  UITableView+xiaoaiStyle.m
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/5/3.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import "UITableView+xiaoaiStyle.h"
#import "UIColor+PY.h"


@implementation UITableView (xiaoaiStyle)

- (void)setXiaoAiStyle {
    [self setXiaoAiStyleWithSeparatorLeft:15];
}

- (void)setXiaoAiStyleWithSeparatorLeft:(float)separatorLeft {
    [self setXiaoAiStyleWithSeparatorLeft:separatorLeft separatorHexColor:@"#E3E4E5"];
}

- (void)setXiaoAiStyleWithSeparatorHexColor:(NSString *)hex {
    [self setXiaoAiStyleWithSeparatorLeft:15 separatorHexColor:@"#E3E4E5"];
}

- (void)setXiaoAiStyleWithSeparatorLeft:(float)separatorLeft separatorHexColor:(NSString *)hex {
    self.separatorInset = UIEdgeInsetsMake(0, separatorLeft, 0, 0);
    self.separatorColor = [UIColor colorWithHexString:hex];
    self.tableFooterView = [[UIView alloc] init];
}



@end
