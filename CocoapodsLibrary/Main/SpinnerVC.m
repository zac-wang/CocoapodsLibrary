//
//  SpinnerVC.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/18.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "SpinnerVC.h"
#import "ZCSpinnerView.h"

@interface SpinnerVC ()

@property(nonatomic, strong) ZCSpinnerView *spinnerView;

@end

@implementation SpinnerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)select:(UIButton *)sender {
    if(!self.spinnerView) {
        CGRect rect = CGRectMake(0, sender.frame.origin.y+sender.frame.size.height, self.view.frame.size.width, 300);
        self.spinnerView = [[ZCSpinnerView alloc] initWithMaxFrame:rect];
        self.spinnerView.dataSource = @[@"一", @"二", @"三", @"四", @"五"];
        self.spinnerView.cell = ^(UITableViewCell *cell, NSIndexPath *indexPath) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        };
        self.spinnerView.selectEvent = ^(UITableViewCell *cell, NSIndexPath *indexPath, NSString *title) {
            //cell.accessoryType = UITableViewCellAccessoryCheckmark;
            NSLog(@"%ld", (long)indexPath.row);
        };
    }
    [self.spinnerView show];
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
