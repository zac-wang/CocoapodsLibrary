//
//  ZCTextView.h
//  ZCAppleScript
//
//  Created by 王志超 on 2018/3/12.
//  Copyright © 2018年 王志超. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ZCTextView : NSScrollView

+ (ZCTextView *)textViewWithFrame:(CGRect)rect;

@property(nonatomic, strong)NSTextView *textView;

@end
