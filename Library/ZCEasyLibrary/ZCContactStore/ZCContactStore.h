//
//  ZCContactStore.h
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/16.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Contacts/Contacts.h>


API_AVAILABLE(ios(9.0))
@interface ZCContactStore : CNContactStore

+ (instancetype)shared;

- (void)zc_getContactAuthorization:(void(^)(void))successBlock;

@property(nonatomic, copy) NSArray<NSString *> *zc_getCNContactAllKey;

- (BOOL)zc_enumerateContactsWithCNContactKeys:(NSArray<NSString *> *)contactKeys usingBlock:(void (^)(CNContact *contact, BOOL *stop))block;

@end



@interface ZCContactStore (ZCUpdate)

/**
 *  查询操作
 *
 *  @return 返回数组
 */
- (NSArray *)queryContactWithName:(NSString *)name fetchKeys:(NSArray *)fetchKeys;

/**
 *  更新联系人
 *
 *  @param contact 被更新的联系人
 */
- (void)updateContact:(CNMutableContact *)contact;

/**
 *  删除联系人
 *
 *  @param contact 被删除的联系人
 */
- (void)zc_deleteContact:(CNMutableContact *)contact;

/**
 *  添加联系人
 *
 *  @param contactArr 联系人数组
 */
- (void)zc_addContact:(NSArray<CNMutableContact *> *)contactArr;
@end
