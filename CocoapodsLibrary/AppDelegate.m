//
//  AppDelegate.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/18.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "AppDelegate.h"
//#import <ZCEasyLibrary/ZCEasyLibrary.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Oveilrride point for customization after application launch.
    
//    NSDictionary *dict = @{@"userId":@"bob",
//                           @"name":@"12345",
//                           @"portraitUri":@"https://www.baidu.com/favicon.ico"};
//    [ZCRequestManager requestUrl:@"https://www.maolv.tk/rongCloud.php"
//                           param:dict
//                           block:^(NSData *data, NSURLResponse *response, NSError *error) {
//                               NSDictionary *dic = data.zc_toString.zc_toJsonObject;
//                               NSLog(@"%@", dic);
//                           }];
    
//    NSArray *array = @[@"2.0", @"2.3", @"3.0", @"4.0"];
//    CGFloat sum = [[array valueForKeyPath:@"@sum.floatValue"] floatValue];
//    CGFloat avg = [[array valueForKeyPath:@"@avg.floatValue"] floatValue];
//    CGFloat max =[[array valueForKeyPath:@"@max.floatValue"] floatValue];
//    CGFloat min =[[array valueForKeyPath:@"@min.floatValue"] floatValue];
//    NSLog(@"%f, %f, %f, %f", sum, avg, max, min);
    
    
//    [[ZCAppUpdateVersion shared] zc_checkVersionAndUpdateWithTargetVC:nil];
    
    
    
    //NSString *jsonStr = @"{\"9.70\":9.70, \"97.40\":97.40, \"80.40\":80.40, \"188.40\":188.40, \"8819.45\":8819.45, \"8679.45\":8679.45}";
    //NSLog(@"json:%@", jsonStr);
    //NSDictionary *_dic = jsonStr.zc_data.zc_toJsonObject;
    //NSLog(@"dic:%@", _dic);
//    NSNumber *num = @6666.6599999999999;//_dic[@"8679.45"];
//    double value = [num doubleValue];
//    NSLog(@"dic:%lf, %lf, %lf", value, ((long long)(value*10000000000))/10000000000.0, fabs(((long long)(value*10000000000))/10000000000.0 - value));
//    NSLog(@"dic:%@", [NSString stringWithFormat:@"%lg", [_dic[@"9.70"] doubleValue]]);//.450000000001
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
