//
//  NSDateComponents+ZCSupp.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/25.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSDateComponents+ZCSupp.h"
#import "ZCCalendar.h"

@implementation NSDateComponents (ZCSupp)

- (NSDate *)zc_toDate {
    return [[ZCCalendar shared] dateFromComponents:self];
}

@end
