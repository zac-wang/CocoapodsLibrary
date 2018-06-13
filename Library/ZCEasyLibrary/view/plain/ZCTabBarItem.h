//
//  ZCTabBarItem.h
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/29.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZCEasyLibraryPrivate/Macro.h>

@interface ZCTabBarItem : UITabBarItem

- (void)zc_setTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;
- (void)zc_setTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage selectedTitleTextAttributes:(NSDictionary<NSAttributedStringKey,id> *)selectedTitleTextAttributes;

@end
