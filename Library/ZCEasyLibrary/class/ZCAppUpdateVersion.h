//
//  ZCAppUpdateVersion.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/11/30.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;
@interface ZCAppUpdateVersion : NSObject

+ (instancetype)shared;

@property (nonatomic, strong) NSString *zc_appID;

/// 检查是否有更新
- (void)zc_checkVersion:(void(^)(NSError *err, BOOL isHaveUpdate))block;

/// 检查并跳转
- (void)zc_checkVersionAndUpdateWithTargetVC:(UIViewController *)vc;

/// 本应用内弹出App Store页
- (void)zc_goToAppSoreWithTargetVC:(UIViewController *)vc completionBlock:(void(^)(BOOL result, NSError *error))block;
/// 跳转到App Store
- (void)zc_goToAppSore;

@end
