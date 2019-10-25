//
//  ZCTableViewCell.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCTableViewCell : UITableViewCell

@property(nonatomic, copy) void(^zc_selectedBlock)(ZCTableViewCell *cell, BOOL selected);

@end
