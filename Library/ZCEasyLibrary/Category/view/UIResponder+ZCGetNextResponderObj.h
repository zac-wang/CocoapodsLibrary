//
//  UIResponder+ZCGetNextResponderObj.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/10.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (ZCGetNextResponderObj)

- (id)getNextResponderForClass:(Class)_class;

@end
