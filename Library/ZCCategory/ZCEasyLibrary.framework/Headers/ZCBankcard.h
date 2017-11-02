//
//  ZCBankcard.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZCBankcardTypeMap @{@"DC":@"储蓄卡",@"CC":@"信用卡",@"SCC":@"准贷记卡",@"PC":@"预付费卡"}
#define ZCBankcardGetType(_cardType_) ZCBankcardTypeMap[_cardType_]

@interface ZCBankcard : NSObject

+ (void)zc_getBankcardInfoWithBankcardNo:(NSString *)bankcardNo block:(void(^)(ZCBankcard *bankcardInfo))block;

@property(nonatomic, readonly) NSString *bank;
@property(nonatomic, readonly) NSString *cardType;
@property(nonatomic, readonly) NSNumber *key;
@property(nonatomic, readonly) NSArray *messages;
@property(nonatomic, readonly) NSString *stat;
@property(nonatomic, readonly) BOOL validated;

@property(nonatomic, readonly) NSString *bankName;
@property(nonatomic, readonly) NSString *cardTypeName;

+ (NSString *)zc_getBankNameWithBankType:(NSString *)type;

@end
