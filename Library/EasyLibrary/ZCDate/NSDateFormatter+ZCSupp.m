//
//  NSDateFormatter+ZCSupp.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/23.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "NSDateFormatter+ZCSupp.h"

@implementation NSDateFormatter (ZCSupp)

+ (NSDateFormatter *)zc_formatWithFormat:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [NSCalendar autoupdatingCurrentCalendar];
    dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
    dateFormatter.locale = [NSLocale currentLocale];
    dateFormatter.dateFormat = formatString;
    return dateFormatter;
}

@end
