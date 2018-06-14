//
//  UITableView+ZCPaging.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2018/5/10.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import "UITableView+ZCPaging.h"
#import "NSObject+ZCRuntime.h"

@implementation UITableView (ZCPaging)

- (void)setZc_dataSourcePageSize:(int)zc_dataSourcePageSize {
    [self zc_setDynamicValue:@(zc_dataSourcePageSize) forKey:@"zc_dataSourcePageSize"];
}

- (int)zc_dataSourcePageSize {
    return [[self zc_dynamicValueForKey:@"zc_dataSourcePageSize"] intValue];
}

- (void)setZc_dataSourcePageOffset:(int)zc_dataSourcePageOffset {
    [self zc_setDynamicValue:@(zc_dataSourcePageOffset) forKey:@"zc_dataSourcePageOffset"];
}

- (int)zc_dataSourcePageOffset {
    return [[self zc_dynamicValueForKey:@"zc_dataSourcePageOffset"] intValue];
}

@end
