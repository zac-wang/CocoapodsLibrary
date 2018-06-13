//
//  ZCPicturePreviewHeadbar.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/16.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "ZCPicturePreviewHeadbar.h"

@implementation ZCPicturePreviewHeadbar
@synthesize zc_leftItem, zc_pageItem, zc_deleteItem;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        zc_leftItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStyleDone target:nil action:nil];
        
        zc_pageItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStyleDone target:nil action:nil];
        
        zc_deleteItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteImageItem:)];
        
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        zc_leftItem.tintColor = [UIColor whiteColor];
        zc_pageItem.tintColor = [UIColor whiteColor];
        zc_deleteItem.tintColor = [UIColor whiteColor];
        
        [self setShadowImage:[UIImage new] forToolbarPosition:UIBarPositionAny];
        [self setBackgroundImage:[UIImage new] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        [self setItems:@[zc_leftItem, space, zc_pageItem, space, zc_deleteItem]];
    }
    return self;
}

- (void)zc_hiddenDeleteItem {
    NSMutableArray *itemArr = [self.items mutableCopy];
    [itemArr removeLastObject];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStyleDone target:nil action:nil];
    [itemArr addObject:item];
    self.items = itemArr;
}

- (void)zc_pageNum:(NSUInteger)pageNum totalNum:(NSUInteger)totalNum {
    self.zc_pageItem.title = [NSString stringWithFormat:@"%lu / %lu", (unsigned long)pageNum + 1, (unsigned long)totalNum];
}

- (void)deleteImageItem:(UIBarButtonItem *)deleteItem {
    if(self.zc_deleteImageBlock) {
        self.zc_deleteImageBlock();
    }
}

@end
