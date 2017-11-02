//
//  NSString+ZCRegularRegex.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZCRegularRegex)

- (BOOL)regular:(NSString *)regularRegex;

@property(nonatomic, readonly) BOOL zc_isPhoneNumber;
@property(nonatomic, readonly) BOOL zc_isEmail;
@property(nonatomic, readonly) BOOL zc_isNumber;
@property(nonatomic, readonly) BOOL zc_isIDCard;
@property(nonatomic, readonly) BOOL zc_isChinese;

@end
