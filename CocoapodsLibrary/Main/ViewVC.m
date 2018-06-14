//
//  ViewVC.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/28.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ViewVC.h"
#import <CoreText/CoreText.h>
#import "ZCSpinnerView.h"

@interface ViewVC () {
    ZCSelectDatePicker *selectDatePicker;
    ZCSelectImagePicker *selectImagePicker;
    ZCPickerCirculateView *pickerView;
    ZCSpinnerView *spinnerView;
    ZCCitySelect *citySelect;
}

@property (weak, nonatomic) IBOutlet ZCTagView *tagBackView;
@property (weak, nonatomic) IBOutlet ZCVerticalButton *btn;
@property (weak, nonatomic) IBOutlet ZCTextView *textView;

@end

@implementation ViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.btn imageFrame:CGRectMake(0, 0, 100, 100) titleFrame:CGRectMake(0, 100, 100, 20)];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.textView.zc_keyBoardTopBar = [[ZCKeyBoardTopBar alloc] init];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    //self.tagBackView.zc_btnHorizontalGap = 5;
    //self.tagBackView.zc_btnVerticalGap = 2;
    //self.tagBackView.zc_btnHeight = 15;
    self.tagBackView.zc_tagStyle = ZCTagViewStyleCenter;
    self.tagBackView.zc_tagTitles = @[@" 按时蒂芬v ", @" 俗为别人 ", @" 三大沃尔 ", @" 白色 ", @" 按时斯蒂芬v ", @" 俗人 ", @" 三沃尔 ", @" 是款白色 ", @" 按时蒂芬v ", @" 俗人不为别人 ", @" 三大部分沃尔 ", @" 白色 ", @" 按蒂芬v ", @" 为别人 ", @" 三大部分沃尔 ", @" 是到付款白色 "];
    self.tagBackView.zc_btnClickBlock = ^(UIButton *btn) {
        NSLog(@"%ld", (long)btn.tag);
    };
}

- (IBAction)showDatePicker:(UIButton *)sender {
    if(!selectDatePicker) {
        selectDatePicker = [[ZCSelectDatePicker alloc] initWithFrame:self.view.bounds];
        [selectDatePicker setZc_selectDatePicker:^(UIDatePicker *pic, NSDate *date, NSString *message) {
            NSLog(@"%@", message);
        }];
        [self.view addSubview:selectDatePicker];
    }
    [selectDatePicker zc_showView];
}

- (IBAction)showImagePicker:(UIButton *)sender {
    if(!selectImagePicker)
        selectImagePicker = [[ZCSelectImagePicker alloc] init];
    [selectImagePicker setZc_selectPickerController:^(UIImage *image) {
        NSLog(@"%@", image);
    }];
    [selectImagePicker zc_showWithViewController:self];
}

- (IBAction)showPickerView:(UIButton *)sender {
    if(!pickerView) {
        pickerView = [[ZCPickerCirculateView alloc] initWithFrame:self.view.bounds];
        [pickerView zc_componentCount:3 rowCount:^NSInteger(UIPickerView *pic, NSInteger component) {
            return component + 15;
        }];
        pickerView.zc_cell = ^NSString *(UIPickerView *pic, NSInteger component, NSInteger row) {
            return [NSString stringWithFormat:@"%ld", (long)row];
        };
        pickerView.zc_selectPicker = ^(UIPickerView *pic, NSArray<NSNumber *> *selectRowArray, NSArray<NSString *> *selectTitleArray) {
            NSLog(@"%@\n%@", selectRowArray, selectTitleArray);
        };
        [self.view addSubview:pickerView];
    }
    [pickerView zc_showView];
}

- (IBAction)showSpinner:(UIButton *)sender {
    if(!spinnerView) {
        CGRect rect = CGRectMake(0, sender.frame.origin.y+sender.frame.size.height, self.view.frame.size.width, 300);
        spinnerView = [[ZCSpinnerView alloc] initWithMaxFrame:rect];
        spinnerView.zc_dataSource = @[@"一", @"二", @"三", @"四", @"五"];
        spinnerView.zc_cell = ^(UITableViewCell *cell, NSIndexPath *indexPath) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        };
        spinnerView.zc_selectEvent = ^(UITableViewCell *cell, NSIndexPath *indexPath, NSString *title) {
            //cell.accessoryType = UITableViewCellAccessoryCheckmark;
            NSLog(@"%ld", (long)indexPath.row);
        };
    }
    [spinnerView zc_show];
}

- (IBAction)selectLocation:(UIButton *)sender {
    if(!citySelect) {
        citySelect = [[ZCCitySelect alloc] initWithFrame:self.view.bounds];
        //select.zc_componentCount = 2;
        citySelect.zc_eventClick = ^(NSString *province, NSString *city, NSString *district, NSNumber *code) {
            NSLog(@"%@-%@-%@", province, city, district);
        };
        [self.view addSubview:citySelect];
    }
    [citySelect zc_showView];
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
