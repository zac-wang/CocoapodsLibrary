//
//  CNContact+ZCToDictionary.h
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/17.
//  Copyright © 2018年 王志超. All rights reserved.
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
