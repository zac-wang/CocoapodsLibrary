//
//  ZCTableViewCell.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/2.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCTableViewCell : UITableViewCell

@property(nonatomic, copy) void(^zc_selectedBlock)(ZCTableViewCell *cell, BOOL selected);

@end
