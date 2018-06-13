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

@property(nonatomic, readonly) BOOL zc_validated;
@property(nonatomic, readonly) NSString *zc_bank;
@property(nonatomic, readonly) NSString *zc_bankName;
@property(nonatomic, readonly) NSString *zc_cardType;
@property(nonatomic, readonly) NSString *zc_cardTypeName;
@property(nonatomic, readonly) NSNumber *zc_cardno;
@property(nonatomic, readonly) NSArray *zc_messages;
@property(nonatomic, readonly) NSString *zc_stat;

+ (NSString *)zc_getBankNameWithBankType:(NSString *)type;

//+ (NSArray *)zc_getBankgroundColor:(NSString *)bankName;

@end
