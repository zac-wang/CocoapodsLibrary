//
//  ZCBankcard.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/2.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCBankcard.h"
#import <ZCEasyLibraryPrivate/Macro.h>
#import "NSData+ZCJson.h"
//#import "UIColor+ZCSupp.h"

#define BankcardInfoUrl(_bankcard_no_) [NSString stringWithFormat:@"https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardBinCheck=true&cardNo=%@", _bankcard_no_]

#define ZCBankcardTypeMap @{@"DC":@"储蓄卡",@"CC":@"信用卡",@"SCC":@"准贷记卡",@"PC":@"预付费卡"}
#define ZCBankcardGetType(_cardType_) ZCBankcardTypeMap[_cardType_]

@implementation ZCBankcard
@synthesize zc_bank, zc_cardType, zc_cardno, zc_messages, zc_stat, zc_validated, zc_bankName, zc_cardTypeName;

+ (void)zc_getBankcardInfoWithBankcardNo:(NSString *)bankcardNo block:(void(^)(ZCBankcard *bankcardInfo))block {
    NSURL *bankcardInfoUrl = [NSURL URLWithString:BankcardInfoUrl(bankcardNo)];
    
    NSURLSession *session =[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask =[session dataTaskWithURL:bankcardInfoUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = data.zc_toJsonObject;
        ZCBankcard *bankcard = [[ZCBankcard alloc] init];
        bankcard->zc_bank = dic[@"bank"];
        bankcard->zc_cardType = dic[@"cardType"];
        bankcard->zc_cardno = dic[@"key"];
        bankcard->zc_messages = dic[@"messages"];
        bankcard->zc_stat = dic[@"stat"];
        bankcard->zc_validated = [dic[@"validated"] boolValue];
        
        bankcard->zc_bankName = [ZCBankcard zc_getBankNameWithBankType:bankcard.zc_bank];
        bankcard->zc_cardTypeName = ZCBankcardGetType(bankcard.zc_cardType);
        block(bankcard);
    }];
    [dataTask resume];
}

+ (NSString *)zc_getBankNameWithBankType:(NSString *)type {
    NSDictionary *dic = @{ @"HKB" : @"汉口银行", @"BOC" : @"中国银行", @"NXBANK" : @"宁夏银行", @"XTB" : @"邢台银行", @"BOD" : @"东莞银行", @"CMB" : @"招商银行", @"SHRCB" : @"上海农村商业银行", @"JJBANK" : @"九江银行", @"H3CB" : @"内蒙古银行", @"SHBANK" : @"上海银行", @"NCCB" : @"江西银行", @"GCB" : @"广州银行", @"DLB" : @"大连银行", @"SPDB" : @"上海浦东发展银行", @"JRCB" : @"江苏江阴农村商业银行", @"CQRC" : @"重庆农村商业银行", @"BSB" : @"包商银行", @"GDB" : @"广东发展银行", @"CQBANK" : @"重庆银行", @"BJRCB" : @"北京农村商业银行", @"CCB" : @"中国建设银行", @"COMM" : @"交通银行", @"WHCCB" : @"威海市商业银行", @"NBBANK" : @"宁波银行", @"BHB" : @"河北银行", @"CEB" : @"中国光大银行", @"BOSZ" : @"苏州银行", @"QLBANK" : @"齐鲁银行", @"SPABANK" : @"平安银行", @"URMQCCB" : @"乌鲁木齐市商业银行", @"TCCB" : @"天津银行", @"BOQH" : @"青海银行", @"BOHAIB" : @"渤海银行", @"CDRCB" : @"成都农商银行", @"SRBANK" : @"上饶银行", @"BOYK" : @"营口银行", @"HSBANK" : @"徽商银行", @"NJCB" : @"南京银行", @"NCB" : @"南昌银行", @"JSBANK" : @"江苏银行", @"TZCB" : @"台州银行", @"SCB" : @"渣打银行", @"CIB" : @"兴业银行", @"CITIC" : @"中信银行", @"ICBC" : @"中国工商银行", @"HRBANK" : @"哈尔滨银行", @"JSRCU" : @"江苏省农村信用联合社", @"GZB" : @"赣州银行", @"CDCB" : @"成都银行", @"HXBANK" : @"华夏银行", @"SJBANK" : @"盛京银行", @"NYBANK" : @"广东南粤银行", @"ABC" : @"中国农业银行", @"YDRCB" : @"尧都农商行", @"BJBANK" : @"北京银行", @"WZCB" : @"温州银行", @"JXBANK" : @"嘉兴银行", @"CZBANK" : @"浙商银行", @"PSBC" : @"中国邮政储蓄银行", @"ANTBANK" : @"网商银行", @"SXCB" : @"绍兴银行", @"EGBANK" : @"恒丰银行", @"CMBC" : @"中国民生银行", @"HZCB" : @"杭州银行", @"JSB" : @"晋商银行" };
    return dic[type];
}

@end
