//
//  ZCBankcard.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCBankcard : NSObject

+ (void)zc_getBankcardInfoWithBankcardNo:(NSString *)bankcardNo block:(void(^)(ZCBankcard *bankcardInfo))block;

@property(nonatomic, readonly) BOOL validated;
@property(nonatomic, readonly) NSString *bank;
@property(nonatomic, readonly) NSString *bankName;
@property(nonatomic, readonly) NSString *cardType;
@property(nonatomic, readonly) NSString *cardTypeName;
@property(nonatomic, readonly) NSNumber *cardno;
@property(nonatomic, readonly) NSArray *messages;
@property(nonatomic, readonly) NSString *stat;

+ (NSString *)zc_getBankNameWithBankType:(NSString *)type;

@end
