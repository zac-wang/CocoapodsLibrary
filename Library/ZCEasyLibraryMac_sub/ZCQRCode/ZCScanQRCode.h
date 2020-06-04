//
//  ZCScanQRCode.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/7/3.
//  Copyright © 2018年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCScanQRCode : NSObject

/// 识别屏幕中的二维码
+ (void)zc_scanQRCodeOnScreen:(void(^)(NSString *msg, CGRect bounds))block;

@end
