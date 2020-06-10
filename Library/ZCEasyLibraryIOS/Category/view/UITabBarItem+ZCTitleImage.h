//
//  UITabBarItem+ZCTitleImage.h
//  ZCEasyLibrary
//
//  Created by wzc on 2020/6/10.
//  Copyright © 2020 zac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITabBarItem (ZCTitleImage)

/// 设置tabBar样式
/// @param title 文字
/// @param image 未选中时的icon
/// @param selectedImage 选中时的icon
- (void)zc_setTitle:(NSString *)title
              image:(UIImage *)image
      selectedImage:(UIImage *)selectedImage;

/// 设置tabBar样式
/// @param title 文字
/// @param image 未选中时的icon
/// @param selectedImage 选中时的icon
/// @param selectedTitleTextAttributes 文字选中时的样式
- (void)zc_setTitle:(NSString *)title
              image:(UIImage *)image
      selectedImage:(UIImage *)selectedImage
selectedTitleTextAttributes:(NSDictionary<NSAttributedStringKey,id> *)selectedTitleTextAttributes;

@end

