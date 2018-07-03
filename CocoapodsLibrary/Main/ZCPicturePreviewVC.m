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

@end

@implementation ZCPicturePreviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *imgs = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:@"main_banner.bundle"];
    NSMutableArray *imgArray = [NSMutableArray arrayWithArray:imgs];
    [imgArray addObjectsFromArray:imgs];

    
    ZCPicturePreview *picturePreview = [ZCPicturePreview shared];
    [self.navigationController.view addSubview:picturePreview];
    [picturePreview.zc_headBar zc_hiddenDeleteItem];
    picturePreview.zc_imageCount = imgArray.count;
    picturePreview.zc_willChangeBlock = ^(ZCPicturePreview *preview, ZCPicturePreviewItem *item) {
        item.zc_imgView.image = [UIImage imageWithContentsOfFile:imgArray[item.zc_index]];
    };
    picturePreview.zc_didChangeBlock = ^(ZCPicturePreview *preview, ZCPicturePreviewItem *item) {
        item.zc_imgView.image = [UIImage imageWithContentsOfFile:imgArray[item.zc_index]];
    };
    picturePreview.zc_headBar.zc_deleteImageBlock = ^{
        NSLog(@"== %lu", (unsigned long)picturePreview.zc_nowShowImgIndex);
    };
    
    for (int i = 0; i < self.imageViews.count; i++) {
        UIImageView *imgView = self.imageViews[i];
        [picturePreview zc_monitorImageView:imgView index:i];
        imgView.image = [UIImage imageWithContentsOfFile:imgArray[i]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
