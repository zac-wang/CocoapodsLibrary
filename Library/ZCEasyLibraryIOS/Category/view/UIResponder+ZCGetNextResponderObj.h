//
//  UIResponder+ZCGetNextResponderObj.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/10.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (ZCGetNextResponderObj)

/// 向上寻找指定类型的响应链
@property(nonatomic, readonly) id (^zc_getNextResponderForClass)(Class class);

@end
