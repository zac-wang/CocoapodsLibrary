//
//  TestModel.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/11/4.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCJsonModel.h"
#import "TestModel1.h"

@interface TestModel : ZCJsonModel

@property (readonly, nonatomic) NSString *m_name;
@property (readonly, nonatomic) NSString *m_age;
@property (readonly, nonatomic) TestModel1 *m_model;
@property (readonly, nonatomic) NSMutableArray<TestModel1 *> *m_array;

@end
