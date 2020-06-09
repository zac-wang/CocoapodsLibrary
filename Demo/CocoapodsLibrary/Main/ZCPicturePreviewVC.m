//
//  ZCPicturePreviewVC.m
//  CocoapodsLibrary
//
//  Created by zac on 2018/5/16.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCPicturePreviewVC.h"
#import <ZCEasyLibrary/ZCEasyLibrary.h>

@interface ZCPicturePreviewVC ()

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViews;

@property(nonatomic, strong) ZCPicturePreview *picturePreview;

@end

@implementation ZCPicturePreviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *imgs = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:@"main_banner.bundle"];
    NSMutableArray *imgArray = [NSMutableArray arrayWithArray:imgs];
    [imgArray addObjectsFromArray:imgs];
    
    for (int i = 0; i < self.imageViews.count && i < imgArray.count; i++) {
        UIImageView *imgView = self.imageViews[i];
        imgView.image = [UIImage imageWithContentsOfFile:imgArray[i]];
        imgView.userInteractionEnabled = YES;
        imgView.tag = i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMonitorImageView:)];
        [imgView addGestureRecognizer:tap];
    }

    
    self.picturePreview = [ZCPicturePreview shared];
    [self.navigationController.view addSubview:self.picturePreview];
    [self.picturePreview.zc_headBar zc_showDeleteItem];
    self.picturePreview.zc_imageCount = imgArray.count;
    self.picturePreview.zc_willChangeBlock = ^(ZCPicturePreview *preview, ZCPicturePreviewItem *item) {
        item.zc_imgView.image = [UIImage imageWithContentsOfFile:imgArray[item.zc_index]];
    };
    __weak typeof(self)weakSelf = self;
    self.picturePreview.zc_deleteImageBlock = ^(NSUInteger showImgIndex) {
        // 设置新的图片个数
        [imgArray removeObjectAtIndex:showImgIndex];
        weakSelf.picturePreview.zc_imageCount = imgArray.count;
        
        NSLog(@"delete == %lu", (unsigned long)weakSelf.picturePreview.zc_nowShowImgIndex);
    };
}

- (void)tapMonitorImageView:(UITapGestureRecognizer *)tap {
    [self.picturePreview zc_showViewWithView:(UIImageView *)tap.view index:tap.view.tag];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
