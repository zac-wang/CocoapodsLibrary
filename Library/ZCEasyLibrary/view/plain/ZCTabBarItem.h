//
//  ZCTabBarItem.h
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/29.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCTabBarItem : UITabBarItem

- (void)zc_setTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;
- (void)zc_setTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage selectedTitleTextAttributes:(NSDictionary<NSAttributedStringKey,id> *)selectedTitleTextAttributes;

@end
