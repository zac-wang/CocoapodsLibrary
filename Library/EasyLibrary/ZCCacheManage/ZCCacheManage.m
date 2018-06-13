//
//  ZCCacheManage.m
//  ZCEasyLibrary
//
//  Created by 王志超 on 2017/11/6.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCCacheManage.h"

@implementation ZCCacheManage

#pragma mark - 清除文件
+ (void)zc_cleanFileWithFinderPath:(NSString *)finderPath deadline:(NSTimeInterval)deadline delay:(int)delay {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if(delay) {
            dispatch_semaphore_t sem = dispatch_semaphore_create(0);
            dispatch_semaphore_wait(sem, dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC));
        }
        NSFileManager *fm = [NSFileManager defaultManager];
        NSArray *pathArr = [fm subpathsAtPath:finderPath];
        for (NSString *fileName in pathArr) {
            NSString *filePath = [finderPath stringByAppendingPathComponent:fileName];
            NSDictionary *fileInfo = [fm attributesOfItemAtPath:filePath error:nil];
            NSDate *modificationDate = fileInfo[NSFileModificationDate];
            if(-modificationDate.timeIntervalSinceNow > deadline) {
                [fm removeItemAtPath:filePath error:nil];
            }
        }
    });
}

@end
