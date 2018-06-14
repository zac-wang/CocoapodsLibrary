//
//  UIResponder+ZCGetNextResponderObj.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/10.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (ZCGetNextResponderObj)

- (id)getNextResponderForClass:(Class)_class;

@end
