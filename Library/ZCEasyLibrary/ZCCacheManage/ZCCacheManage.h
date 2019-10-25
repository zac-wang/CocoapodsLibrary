//
//  ZCCacheManage.h
//  ZCEasyLibrary
//
//  Created by zac on 2017/11/6.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCCacheManage : NSObject


/**
 删除过期文件

 @param finderPath 要操作的文件夹路径
 @param deadline 过期秒数
 @param delay 延迟多少秒触发(若是启动应用立刻清理，给老机型节省资源)
 */
+ (void)zc_cleanFileWithFinderPath:(NSString *)finderPath deadline:(NSTimeInterval)deadline delay:(int)delay;

@end
