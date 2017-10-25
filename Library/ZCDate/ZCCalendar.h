//
//  ZCCalendar.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/25.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ZCCalendarSunday = 1, /**< 星期日 */
    ZCCalendarMonday = 2, /**< 星期一 */
    ZCCalendarTuesday = 3, /**< 星期二 */
    ZCCalendarWednesday = 4, /**< 星期三 */
    ZCCalendarThursday = 5, /**< 星期四 */
    ZCCalendarFriday = 6, /**< 星期五 */
    ZCCalendarSaturday = 7, /**< 星期六 */
} ZCCalendarFirstWeekday;

@interface ZCCalendar : NSCalendar

+ (instancetype)shared;

@end
