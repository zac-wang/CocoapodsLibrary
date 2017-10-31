//
//  ViewVC.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/28.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ViewVC.h"
#import <ZCEasyLibrary/ZCEasyLibrary.h>

@interface ViewVC ()

@property (weak, nonatomic) IBOutlet ZCVerticalButton *btn;
@property (weak, nonatomic) IBOutlet ZCTextView *textView;

@end

@implementation ViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.btn imageFrame:CGRectMake(0, 0, 100, 100) titleFrame:CGRectMake(0, 100, 100, 20)];
    self.textView.font = ZCIconFont(15);
    self.textView.text = [NSString stringWithFormat:@"\U0000e63d what the fuck"];
    [self.textView zc_drawCornerRadius:10 borderColor:[UIColor redColor]];
    
    
    
    
    self.navigationController.navigationBar.zc_transparent = YES;
}

- (IBAction)showDatePicker:(UIButton *)sender {
    static ZCSelectDatePicker *pic;
    if(!pic)
        pic = [[ZCSelectDatePicker alloc] initWithFrame:self.view.bounds];
    [pic setZc_selectDatePicker:^(UIDatePicker *pic, NSDate *date, NSString *message) {
        NSLog(@"%@", message);
    }];
    [pic zc_showWithView:self.view];
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
