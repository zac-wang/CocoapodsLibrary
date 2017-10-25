//
//  NSDateComponents+supp.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/25.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "NSDateComponents+supp.h"
#import "ZCCalendar.h"

@implementation NSDateComponents (supp)

- (NSDate *)toDate {
    return [[ZCCalendar shared] dateFromComponents:self];
}

@end
