//
//  ZCPicturePreviewHeadbar.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/16.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCPicturePreviewHeadbar.h"

@interface ZCPicturePreviewHeadbar ()
/// 删除事件
@property(nonatomic, copy) void(^zc_deleteImageBlock)(void);
@end

@implementation ZCPicturePreviewHeadbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UINavigationItem *items = [[UINavigationItem alloc] initWithTitle:@""];
        NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:17],
                              NSForegroundColorAttributeName : [UIColor whiteColor]};
        self.titleTextAttributes =dic;
        [self pushNavigationItem:items animated:YES];
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
    }
    return self;
}

- (void)zc_showDeleteItem {
    if (!self.topItem.rightBarButtonItem) {
        self.topItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                                        target:self
                                                                                        action:@selector(deleteImageItem:)];
        self.topItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    }
}

- (void)setZc_title:(NSString *)zc_title {
    self.topItem.title = zc_title;
}

- (void)deleteImageItem:(UIBarButtonItem *)deleteItem {
    if(self.zc_deleteImageBlock) {
        self.zc_deleteImageBlock();
    }
}

@end
