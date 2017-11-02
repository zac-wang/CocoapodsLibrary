//
//  UITableView+xiaoaiStyle.h
//  XAEmpAssistant
//
//  Created by 王志超 on 2017/5/3.
//  Copyright © 2017年 Workai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (xiaoaiStyle)

- (void)zc_setXiaoAiStyle;
- (void)zc_setXiaoAiStyleWithSeparatorLeft:(float)separatorLeft;
- (void)zc_setXiaoAiStyleWithSeparatorHexColor:(long)hex;
- (void)zc_setXiaoAiStyleWithSeparatorLeft:(float)separatorLeft separatorHexColor:(long)hex;

@end
