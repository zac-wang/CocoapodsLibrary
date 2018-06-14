//
//  CNContact+ZCToDictionary.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/17.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "CNContact+ZCToDictionary.h"
#import <UIKit/UIImage.h>

@implementation CNContact (ZCToDictionary)

- (NSArray<NSDictionary *> *)zc_phoneNumbers {
    NSMutableArray *postalAdds = [NSMutableArray array];
    for (CNLabeledValue *labeledValue in self.phoneNumbers) {
        NSMutableDictionary *postalAdd = [NSMutableDictionary dictionary];
        [postalAdds addObject:postalAdd];
        
        postalAdd[ZCContactLabeledKey] = labeledValue.label;    // 2.1.Type
        CNPhoneNumber *phoneNumer = labeledValue.value;  // 2.2.Value
        postalAdd[ZCContactLabeledValue] = phoneNumer.stringValue;
    }
    return postalAdds.count ? postalAdds : nil;
}

- (NSArray<NSDictionary *> *)zc_emailAddresses {
    NSMutableArray *postalAdds = [NSMutableArray array];
    for (CNLabeledValue *labeledValue in self.emailAddresses) {
        NSMutableDictionary *postalAdd = [NSMutableDictionary dictionary];
        [postalAdds addObject:postalAdd];
        
        postalAdd[ZCContactLabeledKey] = labeledValue.label;    // 2.1.Type
        postalAdd[ZCContactLabeledValue] = labeledValue.value;  // 2.2.Value
    }
    return postalAdds.count ? postalAdds : nil;
}

- (NSArray<NSDictionary *> *)zc_urlAddresses {
    NSMutableArray *postalAdds = [NSMutableArray array];
    for (CNLabeledValue *labeledValue in self.urlAddresses) {
        NSMutableDictionary *postalAdd = [NSMutableDictionary dictionary];
        [postalAdds addObject:postalAdd];
        
        postalAdd[ZCContactLabeledKey] = labeledValue.label;    // 2.1.Type
        postalAdd[ZCContactLabeledValue] = labeledValue.value;  // 2.2.Value
    }
    return postalAdds.count ? postalAdds : nil;
}

- (NSArray<NSDictionary *> *)zc_postalAddresses {
    NSMutableArray *postalAdds = [NSMutableArray array];
    for (CNLabeledValue *labeledValue in self.postalAddresses) {
        NSMutableDictionary *postalAdd = [NSMutableDictionary dictionary];
        [postalAdds addObject:postalAdd];
        
        postalAdd[ZCContactLabeledKey] = labeledValue.label;    // 2.1.Type
        postalAdd[ZCContactLabeledValue] = labeledValue.value;  // 2.2.Value
    }
    return postalAdds.count ? postalAdds : nil;
}

- (NSArray<NSDictionary *> *)zc_dates {
    NSMutableArray *postalAdds = [NSMutableArray array];
    for (CNLabeledValue *labeledValue in self.dates) {
        NSMutableDictionary *postalAdd = [NSMutableDictionary dictionary];
        [postalAdds addObject:postalAdd];
        
        postalAdd[ZCContactLabeledKey] = labeledValue.label;    // 2.1.Type
        postalAdd[ZCContactLabeledValue] = labeledValue.value;  // 2.2.Value
    }
    return postalAdds.count ? postalAdds : nil;
}

- (NSArray<NSDictionary *> *)zc_contactRelations {
    NSMutableArray *postalAdds = [NSMutableArray array];
    for (CNLabeledValue *labeledValue in self.contactRelations) {
        NSMutableDictionary *postalAdd = [NSMutableDictionary dictionary];
        [postalAdds addObject:postalAdd];
        
        postalAdd[ZCContactLabeledKey] = labeledValue.label;    // 2.1.Type
        postalAdd[ZCContactLabeledValue] = labeledValue.value;  // 2.2.Value
    }
    return postalAdds.count ? postalAdds : nil;
}

- (NSArray<NSDictionary *> *)zc_socialProfiles {
    NSMutableArray *postalAdds = [NSMutableArray array];
    for (CNLabeledValue *labeledValue in self.socialProfiles) {
        NSMutableDictionary *postalAdd = [NSMutableDictionary dictionary];
        [postalAdds addObject:postalAdd];
        
        postalAdd[ZCContactLabeledKey] = labeledValue.label;    // 2.1.Type
        postalAdd[ZCContactLabeledValue] = labeledValue.value;  // 2.2.Value
    }
    return postalAdds.count ? postalAdds : nil;
}

- (NSArray<NSDictionary *> *)zc_instantMessageAddresses {
    NSMutableArray *postalAdds = [NSMutableArray array];
    for (CNLabeledValue *labeledValue in self.instantMessageAddresses) {
        NSMutableDictionary *postalAdd = [NSMutableDictionary dictionary];
        [postalAdds addObject:postalAdd];
        
        postalAdd[ZCContactLabeledKey] = labeledValue.label;    // 2.1.Type
        CNInstantMessageAddress *phoneNumer = labeledValue.value;  // 2.2.Value
        postalAdd[ZCContactLabeledValue] = phoneNumer.username;
    }
    return postalAdds.count ? postalAdds : nil;
}

#pragma mark -
- (NSDictionary *)zc_dictionary {
    NSMutableDictionary<NSString *, id> *dic = [NSMutableDictionary dictionary];
    dic[CNContactIdentifierKey] = self.identifier;    //标识符
    dic[CNContactFamilyNameKey] = self.familyName;    //姓氏
    dic[CNContactGivenNameKey] = self.givenName;      //姓名
    
    dic[CNContactNamePrefixKey] = self.namePrefix;                   //1、姓名前缀
    dic[CNContactPhoneticFamilyNameKey] = self.phoneticFamilyName;   //2、姓氏的拼音或音标
    dic[CNContactPreviousFamilyNameKey] = self.previousFamilyName;   //4、婚前姓氏
    dic[CNContactPhoneticGivenNameKey] = self.phoneticGivenName;     //5、名字的拼音或音标
    dic[CNContactMiddleNameKey] = self.middleName;                   //7、中间名
    dic[CNContactPhoneticMiddleNameKey] = self.phoneticMiddleName;   //8、中间名的拼音或音标
    dic[CNContactNameSuffixKey] = self.nameSuffix;                   //9、称谓(姓名后)
    dic[CNContactNicknameKey] = self.nickname;                       //10、昵称
    dic[CNContactOrganizationNameKey] = self.organizationName;       //公司(组织)
    dic[CNContactJobTitleKey] = self.jobTitle;                       //11、职位
    dic[CNContactDepartmentNameKey] = self.departmentName;           //12、部门
    dic[CNContactBirthdayKey] = self.birthday;                       //阳历生日
    dic[CNContactNonGregorianBirthdayKey] = self.nonGregorianBirthday; //阴历农历
    dic[CNContactNoteKey] = self.note;                               //备注
    
    if(self.imageDataAvailable) {                                    //头像是否可用
        UIImage *img = [UIImage imageWithData:self.imageData];
        dic[CNContactImageDataKey] = img;                               //头像
        UIImage *tImg = [UIImage imageWithData:self.thumbnailImageData];
        dic[CNContactThumbnailImageDataKey] = tImg;                     //头像的缩略图
    }
    
    dic[CNContactPhoneNumbersKey] = self.zc_phoneNumbers;           //电话号码
    dic[CNContactEmailAddressesKey] = self.zc_emailAddresses;       //邮箱地址
    dic[CNContactUrlAddressesKey] = self.zc_urlAddresses;           //url地址
    dic[CNContactPostalAddressesKey] = self.zc_postalAddresses;     //住址
    dic[CNContactDatesKey] = self.zc_dates;                         //其他日期
    dic[CNContactRelationsKey] = self.zc_contactRelations;          //关联人
    dic[CNContactSocialProfilesKey] = self.zc_socialProfiles;       //社交
    dic[CNContactInstantMessageAddressesKey] = self.zc_instantMessageAddresses; //即时通信
    return dic;
}

- (NSArray<NSDictionary *> *)zc_getLabeledValue:(NSArray<CNLabeledValue *> *)labeledValues {
    NSMutableArray *postalAdds = [NSMutableArray array];
    for (CNLabeledValue *labeledValue in labeledValues) {
        NSMutableDictionary *postalAdd = [NSMutableDictionary dictionary];
        [postalAdds addObject:postalAdd];
        
        postalAdd[ZCContactLabeledKey] = labeledValue.label;    // 2.1.Type
        postalAdd[ZCContactLabeledValue] = labeledValue.value;  // 2.2.Value
    }
    return postalAdds.count ? postalAdds : nil;
}

@end
