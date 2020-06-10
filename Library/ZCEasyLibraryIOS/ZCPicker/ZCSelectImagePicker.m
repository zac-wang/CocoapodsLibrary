//
//  ZCSelectImagePicker.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/30.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCSelectImagePicker.h"

@interface ZCSelectImagePicker ()<UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    UIAlertController *alertController;
    BOOL isPushShow;
}

@end

@implementation ZCSelectImagePicker
@synthesize zc_pickerController;

- (instancetype)init
{
    self = [super init];
    if (self) {
        zc_pickerController = [[UIImagePickerController alloc] init];
        //zc_pickerController.allowsEditing = YES;
        zc_pickerController.delegate = self;
    }
    return self;
}

- (void)zc_showWithSourceType:(UIImagePickerControllerSourceType)type vc:(UIViewController *)vc {
    zc_pickerController.sourceType = type;
    [vc presentViewController:zc_pickerController animated:YES completion:nil];
}

#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
//    NSLog(@"%@", info);
    if(self.zc_selectPickerController){
        UIImage *image = info[UIImagePickerControllerEditedImage]?:info[UIImagePickerControllerOriginalImage];
        self.zc_selectPickerController(image);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if(self.zc_cancelSelectPickerController){
        self.zc_cancelSelectPickerController();
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 选择图片
- (void)zc_showWithViewController:(UIViewController *)vc {
    alertController = [UIAlertController alertControllerWithTitle:@"选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    if(!TARGET_IPHONE_SIMULATOR) {
        [alertController addAction:[UIAlertAction actionWithTitle:@"拍摄" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self zc_showWithSourceType:UIImagePickerControllerSourceTypeCamera vc:vc];
        }]];
    }
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self zc_showWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary vc:vc];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) { }]];
    
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [vc presentViewController:self->alertController animated:YES completion:nil];
    });
}

@end
