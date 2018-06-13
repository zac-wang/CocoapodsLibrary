//
//  NSDateComponents+ZCSupp.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/25.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "NSDateComponents+ZCSupp.h"
#import "ZCCalendar.h"

@implementation NSDateComponents (ZCSupp)

- (NSDate *)zc_toDate {
    return [[ZCCalendar shared] dateFromComponents:self];
}

@end
