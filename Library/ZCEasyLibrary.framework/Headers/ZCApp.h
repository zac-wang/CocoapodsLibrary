//
//  ZCApp.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/4.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCApp : NSObject

/// 打电话
+ (void (^)(NSString *))zc_callMobilePhone;
/// 打电话，弹出确认框
+ (void (^)(NSString *, UIViewController *))zc_alertCallMobilePhone;

@end
