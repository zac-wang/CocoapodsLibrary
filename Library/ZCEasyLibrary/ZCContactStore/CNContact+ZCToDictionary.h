//
//  CNContact+ZCToDictionary.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/17.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Contacts/Contacts.h>


#define ZCContactLabeledKey   @"ZCContactLabeledKey"
#define ZCContactLabeledValue @"ZCContactLabeledValue"

@interface CNContact (ZCToDictionary)

@property(nonatomic, readonly) NSDictionary *zc_dictionary;

@property(nonatomic, readonly) NSArray<NSDictionary *> *zc_phoneNumbers;
@property(nonatomic, readonly) NSArray<NSDictionary *> *zc_emailAddresses;
@property(nonatomic, readonly) NSArray<NSDictionary *> *zc_urlAddresses;
@property(nonatomic, readonly) NSArray<NSDictionary *> *zc_postalAddresses;
@property(nonatomic, readonly) NSArray<NSDictionary *> *zc_dates;
@property(nonatomic, readonly) NSArray<NSDictionary *> *zc_contactRelations;
@property(nonatomic, readonly) NSArray<NSDictionary *> *zc_socialProfiles;
@property(nonatomic, readonly) NSArray<NSDictionary *> *zc_instantMessageAddresses;

@end
