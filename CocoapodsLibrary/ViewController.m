//
//  ViewController.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/12/11.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ViewController.h"
//#import "AFHTTPSessionManager.h"
//#import "ZCRequestManager.h"
//#import "AFHTTPRequestOperationManager.h"
//#import "ZCSystemVariable.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
//    ZCRequestManager *manager = [ZCRequestManager shared];
////    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer = [AFImageResponseSerializer serializer];
//
//    NSString *url = @"https://www.baidu.com/img/baidu_jgylogo3.gif";
//    NSDictionary *params = @{
//                             @"PARAMETERS NAME 1": @"PARAMETERS VALUE 1",
//                             @"PARAMETERS NAME 2": @"PARAMETERS VALUE 2"
//                             };
//    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
//        ;
//    } success:^(NSURLSessionDataTask *task, id mp3Data) {
//        //拿到响应头信息
//        NSHTTPURLResponse *res = (NSHTTPURLResponse *)task.response;
//        //4.解析拿到的响应数据
//        NSLog(@"%@", res.allHeaderFields);
//
//        NSLog(@"%@", [mp3Data zc_toString]);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"%@", error);
//    }];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //通讯录打印
    //ZCContactStore *contactStore = [ZCContactStore shared];
    //[contactStore zc_getContactAuthorization:^{
    //    [contactStore zc_enumerateContactsWithCNContactKeys:nil usingBlock:^(CNContact *contact, BOOL *stop) {
    //        NSLog(@"%@", contact.zc_dictionary);
    //    }];
    //}];
}

- (IBAction)click:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
