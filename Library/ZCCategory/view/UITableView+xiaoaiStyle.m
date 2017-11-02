//
//  UITableView+xiaoaiStyle.m
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/5/3.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import "UITableView+xiaoaiStyle.h"
#import <ZCEasyLibrary/UIColor+ZCSupp.h>

@implementation UITableView (xiaoaiStyle)

- (void)zc_setXiaoAiStyle {
    [self zc_setXiaoAiStyleWithSeparatorLeft:15];
}

- (void)zc_setXiaoAiStyleWithSeparatorLeft:(float)separatorLeft {
    [self zc_setXiaoAiStyleWithSeparatorLeft:separatorLeft separatorHexColor:0xe3e4e5];
}

- (void)zc_setXiaoAiStyleWithSeparatorHexColor:(long)hex {
    [self zc_setXiaoAiStyleWithSeparatorLeft:15 separatorHexColor:0xe3e4e5];
}

- (void)zc_setXiaoAiStyleWithSeparatorLeft:(float)separatorLeft separatorHexColor:(long)hex {
    self.separatorInset = UIEdgeInsetsMake(0, separatorLeft, 0, 0);
    self.separatorColor = UIColorFromRGB(hex);
    self.tableFooterView = [[UIView alloc] init];
}



@end
