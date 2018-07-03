//
//  ZCContactStore.m
//  CocoapodsLibrary
//
//  Created by zac on 2018/5/16.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCContactStore.h"
#import "CNContact+ZCToDictionary.h"

@implementation ZCContactStore

+ (instancetype)shared {
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (void)zc_getContactAuthorization:(void(^)(void))successBlock {
    // 1.获取授权状态
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    // 2.判断授权状态,如果不是已经授权,则直接返回
    if (status == CNAuthorizationStatusAuthorized) {
        if(successBlock) {
            successBlock();
        }
    }else if(status == CNAuthorizationStatusNotDetermined) {
        CNContactStore *store = [[CNContactStore alloc] init];
        [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (error) {
                NSLog(@"拒绝授权");
            }else { //用户给权限了
                if(successBlock) {
                    successBlock();
                }
            }
        }];
    }
}

- (NSArray<NSString *> *)zc_getCNContactAllKey {
    NSArray *keys = @[
                      CNContactFamilyNameKey, //姓氏
                      CNContactGivenNameKey,  //姓名
                      CNContactIdentifierKey, //标识符
                      CNContactNamePrefixKey, //姓名前缀
                      CNContactMiddleNameKey, //中间名
                      CNContactPreviousFamilyNameKey, //之前的姓氏(ex:国外的女士)
                      CNContactNameSuffixKey, //姓名后缀
                      CNContactNicknameKey,   //昵称
                      CNContactOrganizationNameKey, //公司(组织)
                      CNContactDepartmentNameKey,   //部门
                      CNContactJobTitleKey,   //职位
                      CNContactPhoneticGivenNameKey,  //名字的拼音或音标
                      CNContactPhoneticMiddleNameKey, //中间名的拼音或音标
                      CNContactPhoneticFamilyNameKey, //形式的拼音或音标
                      CNContactBirthdayKey, //生日
                      CNContactNonGregorianBirthdayKey, //农历
                      CNContactNoteKey,     //备注
                      CNContactImageDataKey,          //头像
                      CNContactThumbnailImageDataKey, //头像的缩略图
                      CNContactImageDataAvailableKey, //头像是否可用
                      CNContactTypeKey, //类型
                      CNContactPhoneNumbersKey,    //电话号码
                      CNContactEmailAddressesKey,  //邮箱地址
                      CNContactPostalAddressesKey, //住址
                      CNContactDatesKey,           //其他日期
                      CNContactUrlAddressesKey,    //url地址
                      CNContactRelationsKey,       //关联人
                      CNContactSocialProfilesKey,  //社交
                      CNContactInstantMessageAddressesKey, //即时通信
                      //CNContactPhoneticOrganizationNameKey//公司(组织)的拼音或音标(iOS10 才开始存在)
                      ];
    return keys;
}

- (BOOL)zc_enumerateContactsWithCNContactKeys:(NSArray<NSString *> *)contactKeys usingBlock:(void (^)(CNContact *, BOOL *))block {
    // 3.创建通信录对象
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    
    // 4.创建获取通信录的请求对象
    // 4.1.拿到所有打算获取的属性对应的key
    NSArray *keys = contactKeys ?: [[ZCContactStore shared] zc_getCNContactAllKey];
    // 4.2.创建CNContactFetchRequest对象
    CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
    
    // 5.遍历所有的联系人
    return [contactStore enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        if(block) {
            block(contact, stop);
        }else {
            NSLog(@"%@", [contact zc_dictionary]);
        }
    }];
}

@end



@implementation ZCContactStore (ZCUpdate)

/**
 *  查询操作
 *
 *  @return 返回数组
 */
- (NSArray *)queryContactWithName:(NSString *)name fetchKeys:(NSArray *)fetchKeys {
    CNContactStore *store = [[CNContactStore alloc] init];
    // 检索条件
    NSPredicate *predicate = [CNContact predicateForContactsMatchingName:name];
    // 提取数据 （keysToFetch:@[CNContactGivenNameKey]是设置提取联系人的哪些数据）
    fetchKeys = fetchKeys ?: @[CNContactGivenNameKey];
    NSArray *contact = [store unifiedContactsMatchingPredicate:predicate keysToFetch:fetchKeys error:nil];
    return contact;
}

/**
 *  更新联系人
 *
 *  @param contact 被更新的联系人
 */
- (void)updateContact:(CNMutableContact *)contact {
    // 创建联系人请求
    CNSaveRequest *saveRequest = [[CNSaveRequest alloc] init];
    [saveRequest updateContact:contact];
    [self zc_executeSaveRequest:saveRequest];
    
}

/**
 *  删除联系人
 *
 *  @param contact 被删除的联系人
 */
- (void)zc_deleteContact:(CNMutableContact *)contact {
    // 创建联系人请求
    CNSaveRequest *saveRequest = [[CNSaveRequest alloc] init];
    [saveRequest deleteContact:contact];
    [self zc_executeSaveRequest:saveRequest];
}

/**
 *  添加联系人
 *
 *  @param contactArr 联系人数组
 */
- (void)zc_addContact:(NSArray<CNMutableContact *> *)contactArr {
    // 创建联系人请求
    CNSaveRequest *saveRequest = [[CNSaveRequest alloc] init];
    for (CNMutableContact *contact in contactArr) {
        [saveRequest addContact:contact toContainerWithIdentifier:nil];
    }
    [self zc_executeSaveRequest:saveRequest];
}

- (void)zc_executeSaveRequest:(CNSaveRequest *)saveRequest {
    // 写入操作
    CNContactStore *store = [[CNContactStore alloc] init];
    [store executeSaveRequest:saveRequest error:nil];
}

@end
