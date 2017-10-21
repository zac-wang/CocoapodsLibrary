
//
//  VerticalButtonVC.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/21.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "VerticalButtonVC.h"
#import "ZCVerticalButton.h"

@interface VerticalButtonVC ()

@property (weak, nonatomic) IBOutlet ZCVerticalButton *btn;

@end

@implementation VerticalButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.btn imageFrame:CGRectMake(0, 0, 100, 100) titleFrame:CGRectMake(0, 100, 100, 20)];
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
