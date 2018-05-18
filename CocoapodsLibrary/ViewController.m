//
//  ViewController.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/12/11.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ViewController.h"
#import <ZCEasyLibrary/ZCEasyLibrary.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    ZCAlertView *alertView = [[ZCAlertView alloc] initWithTitle:@"title" message:nil];//@"message"];
    [alertView zc_addDefaultAction:@"1" handler:nil];
    [alertView zc_addCancelAction:nil];
    [alertView zc_show];
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
