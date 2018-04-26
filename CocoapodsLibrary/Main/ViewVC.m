//
//  ViewVC.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/28.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ViewVC.h"
#import <ZCEasyLibrary/ZCEasyLibrary.h>
#import <CoreText/CoreText.h>
#import "ZCSpinnerView.h"

@interface ViewVC ()

@property (weak, nonatomic) IBOutlet ZCVerticalButton *btn;
@property (weak, nonatomic) IBOutlet ZCTextView *textView;

@end

@implementation ViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.btn imageFrame:CGRectMake(0, 0, 100, 100) titleFrame:CGRectMake(0, 100, 100, 20)];
    
    [self.textView zc_addFrameSizeChangeEvent:^(UIView *view) {
        NSLog(@"%@", NSStringFromCGRect(self.textView.frame));
    }];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.textView.zc_keyBoardTopBar = [[ZCKeyBoardTopBar alloc] init];
}

- (IBAction)showDatePicker:(UIButton *)sender {
    static ZCSelectDatePicker *pic;
    if(!pic) {
        pic = [[ZCSelectDatePicker alloc] initWithFrame:self.view.bounds];
        [pic setZc_selectDatePicker:^(UIDatePicker *pic, NSDate *date, NSString *message) {
            NSLog(@"%@", message);
        }];
        [self.view addSubview:pic];
    }
    [pic zc_showView];
}

- (IBAction)showImagePicker:(UIButton *)sender {
    static ZCSelectImagePicker *pic;
    if(!pic)
        pic = [[ZCSelectImagePicker alloc] init];
    [pic setZc_selectPickerController:^(UIImage *image) {
        NSLog(@"%@", image);
    }];
    [pic zc_showWithViewController:self];
}

- (IBAction)showPickerView:(UIButton *)sender {
    static ZCPickerView *pic;
    if(!pic)
        pic = [[ZCPickerView alloc] initWithFrame:self.view.bounds];
    [pic zc_componentCount:3 rowCount:^NSInteger(UIPickerView *pic, NSInteger component) {
        return component + 3;
    }];
    pic.zc_cell = ^NSString *(UIPickerView *pic, NSInteger component, NSInteger row) {
        return [NSString stringWithFormat:@"%ld", (long)row];
    };
    pic.zc_selectPicker = ^(UIPickerView *pic, NSArray<NSNumber *> *selectRowArray, NSArray<NSString *> *selectTitleArray) {
        NSLog(@"%@\n%@", selectRowArray, selectTitleArray);
    };
    [self.view addSubview:pic];
}

- (IBAction)showSpinner:(UIButton *)sender {
    static ZCSpinnerView *spinnerView;
    if(!spinnerView) {
        CGRect rect = CGRectMake(0, sender.frame.origin.y+sender.frame.size.height, self.view.frame.size.width, 300);
        spinnerView = [[ZCSpinnerView alloc] initWithMaxFrame:rect];
        spinnerView.dataSource = @[@"一", @"二", @"三", @"四", @"五"];
        spinnerView.cell = ^(UITableViewCell *cell, NSIndexPath *indexPath) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        };
        spinnerView.selectEvent = ^(UITableViewCell *cell, NSIndexPath *indexPath, NSString *title) {
            //cell.accessoryType = UITableViewCellAccessoryCheckmark;
            NSLog(@"%ld", (long)indexPath.row);
        };
    }
    [spinnerView show];
}

- (IBAction)selectLocation:(UIButton *)sender {
    static ZCCitySelect *select;
    if(!select) {
        select = [[ZCCitySelect alloc] initWithFrame:self.view.bounds];
        //select.zc_componentCount = 2;
        select.zc_eventClick = ^(NSString *province, NSString *city, NSString *district, NSNumber *code) {
            NSLog(@"%@-%@-%@", province, city, district);
        };
        [self.view addSubview:select];
    }
    [select zc_showView];
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
