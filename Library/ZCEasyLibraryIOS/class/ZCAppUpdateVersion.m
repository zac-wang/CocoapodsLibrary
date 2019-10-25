//
//  ZCAppUpdateVersion.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/30.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCAppUpdateVersion.h"
#import <StoreKit/StoreKit.h>
#import "NSData+ZCJson.h"
#import "Macro.h"

#define APPVersionURL1(_buildID_) [NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?bundleId=%@", _buildID_]
#define APPVersionURL2(_appID_) [NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?id=%@", _appID_]

@interface ZCAppUpdateVersion ()<SKStoreProductViewControllerDelegate>
@property (nonatomic, strong) NSDictionary *appStoreInfo;
@end

@implementation ZCAppUpdateVersion

+ (instancetype)shared {
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self zc_appStoreVersionInfo:nil];
    }
    return self;
}

#pragma mark - 请求App Store获取app版本信息
- (void)zc_appStoreVersionInfo:(void(^)(NSDictionary *info))block {
    if(self.appStoreInfo && block) {
        block(self.appStoreInfo);
        block = nil;
    }
    NSString *urlString = self.zc_appID?APPVersionURL2(self.zc_appID):APPVersionURL1(ZCAppInfoBundleId);
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    NSURLSession *session =[NSURLSession sharedSession];
    NSURLSessionDataTask *task;
    task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *info = data.zc_toJsonObject;
        NSArray *results = info[@"results"];
        self.appStoreInfo = results.firstObject;
        if(self.appStoreInfo && block) {
            block(self.appStoreInfo);
        }
    }];
    [task resume];
}

#pragma mark - 检验当前版本 与 App Store最新版本
- (void)zc_checkVersion:(void(^)(NSError *err, BOOL isHaveUpdate))block {
    [self zc_appStoreVersionInfo:^(NSDictionary *info) {
        if(info) {
            NSString *version = info[@"version"];
            BOOL isHaveUpdate = [ZCAppInfoVersion compare:version options:NSNumericSearch] < 0;
            if(block) {
                block(nil, isHaveUpdate);
            }
        }else{
            NSDictionary *errInfo = @{NSLocalizedDescriptionKey : @"检查更新失败"};
            NSError *err = [NSError errorWithDomain:ZCAppInfoBundleId code:0 userInfo:errInfo];
            if(block) {
                block(err, NO);
            }
        }
    }];
}

#pragma mark - 检查更新 跳转到App Store
- (void)zc_checkVersionAndUpdateWithTargetVC:(UIViewController *)vc {
    [self zc_checkVersion:^(NSError *err, BOOL isHaveUpdate) {
        if(isHaveUpdate) {
            [self zc_goToAppSoreWithTargetVC:vc completionBlock:nil];
        }
    }];
}

#pragma mark - 跳转到App Store
- (void)zc_goToAppSoreWithTargetVC:(UIViewController *)vc completionBlock:(void(^)(BOOL result, NSError *error))block {
    if(!self.zc_appID) {
        [self zc_appStoreVersionInfo:^(NSDictionary *info) {
            if(info && info[@"trackId"]) {
                self.zc_appID = info[@"trackId"];
                [self zc_goToAppSoreWithTargetVC:vc completionBlock:nil];
            }
        }];
        return;
    }
    
    Class isAllow = NSClassFromString(@"SKStoreProductViewController");
    if (isAllow != nil) {
        NSDictionary *param = @{
                                SKStoreProductParameterITunesItemIdentifier:self.zc_appID
                                };
        SKStoreProductViewController *storeVC = [[SKStoreProductViewController alloc] init];
        storeVC.delegate = self;
        [storeVC loadProductWithParameters:param completionBlock:^(BOOL result, NSError *error) {
            if (result) {
                [vc presentViewController:storeVC animated:YES completion:nil];
            } else{
                NSLog(@"%@",error);
            }
        }];
    }else {
        [self zc_goToAppSore];
    }
}

#pragma mark SKStoreProductViewControllerDelegate：对视图消失的处理
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 跳转到App Store
- (void)zc_goToAppSore { //低于iOS6没有这个类
    //NSString *string = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8", self.zc_appID];
    [self zc_appStoreVersionInfo:^(NSDictionary *info) {
        if(info && info[@"trackViewUrl"]) {
            NSURL *url = [NSURL URLWithString:info[@"trackViewUrl"]];
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            } else {
                [[UIApplication sharedApplication] openURL:url];
            }
        }
    }];
}

@end
