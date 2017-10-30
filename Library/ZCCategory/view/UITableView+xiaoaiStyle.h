//
//  UITableView+xiaoaiStyle.h
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/5/3.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (xiaoaiStyle)

- (void)setXiaoAiStyle;
- (void)setXiaoAiStyleWithSeparatorLeft:(float)separatorLeft;
- (void)setXiaoAiStyleWithSeparatorHexColor:(NSString *)hex;
- (void)setXiaoAiStyleWithSeparatorLeft:(float)separatorLeft separatorHexColor:(NSString *)hex;

@end
