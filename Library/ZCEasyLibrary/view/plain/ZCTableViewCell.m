//
//  ZCTableViewCell.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/2.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCTableViewCell.h"

@implementation ZCTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    if(self.zc_selectedBlock) {
        self.zc_selectedBlock(self, selected);
    }
}

@end
