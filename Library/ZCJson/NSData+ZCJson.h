//
//  NSData+ZCJson.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/23.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZCJson)

///获取对应的json对象（字典or数组）
@property(nonatomic, readonly) id zc_toJsonObject;

@end
