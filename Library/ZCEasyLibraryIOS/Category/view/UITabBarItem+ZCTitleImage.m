//
//  UITabBarItem+ZCTitleImage.m
//  ZCEasyLibrary
//
//  Created by wzc on 2020/6/10.
//  Copyright © 2020 zac. All rights reserved.
//

#import "UITabBarItem+ZCTitleImage.h"


@implementation UITabBarItem (ZCTitleImage)

- (void)zc_setTitle:(NSString *)title
              image:(UIImage *)image
      selectedImage:(UIImage *)selectedImage {
    UIColor *selectedTitleColor = [UIColor colorWithRed:0.34 green:0.63 blue:0.93 alpha:1.00];
    NSDictionary *selectedTitleStyle = @{NSForegroundColorAttributeName : selectedTitleColor};
    
    [self zc_setTitle:title image:image selectedImage:selectedImage selectedTitleTextAttributes:selectedTitleStyle];
}

- (void)zc_setTitle:(NSString *)title
              image:(UIImage *)image
      selectedImage:(UIImage *)selectedImage
selectedTitleTextAttributes:(NSDictionary<NSAttributedStringKey,id> *)selectedTitleTextAttributes {
    self.title = title;
    self.image = image;
    
    self.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self setTitleTextAttributes:selectedTitleTextAttributes forState:UIControlStateSelected];
}

@end
