//
//  ZCTableViewCell.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/2.
//  Copyright © 2018年 王志超. All rights reserved.
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
