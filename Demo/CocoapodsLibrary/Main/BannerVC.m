//
//  BannerVC.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/18.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "BannerVC.h"
#import <ZCEasyLibrary/ZCEasyLibrary.h>

@interface BannerVC ()

@property (strong, nonatomic) IBOutlet ZCBannerView *banerScrollView;

@end

@implementation BannerVC

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.banerScrollView = [[ZCBannerView alloc] initWithFrame:CGRectMake(0, 240, self.view.frame.size.width, 200)];
//    self.banerScrollView.center = self.view.center;
//    [self.view addSubview:self.banerScrollView];
    
    self.banerScrollView.zc_selectImageView = ^(UIImageView *imgView, NSInteger index) {
        NSLog(@"%ld", (long)index);
    };
    NSArray *imgPaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:@"main_banner.bundle"];
    [self.banerScrollView zc_initBanner:imgPaths];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.banerScrollView zc_start];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.banerScrollView zc_stop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
