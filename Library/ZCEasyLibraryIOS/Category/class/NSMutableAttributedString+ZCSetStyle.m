//
//  NSMutableAttributedString+ZCSetStyle.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/11.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "NSMutableAttributedString+ZCSetStyle.h"

@implementation NSMutableAttributedString (ZCSetStyle)

- (NSMutableAttributedString *(^)(NSAttributedStringKey, id))zc_addStyle {
    return ^NSMutableAttributedString *(NSAttributedStringKey key, id value) {
        [self addAttribute:key value:value range:NSMakeRange(0, self.length)];
        return self;
    };
}

- (NSMutableAttributedString *(^)(NSAttributedStringKey, id, NSRange))zc_addStyleToRange {
    return ^NSMutableAttributedString *(NSAttributedStringKey key, id value, NSRange range) {
        [self addAttribute:key value:value range:range];
        return self;
    };
}

- (NSMutableAttributedString *(^)(UIFont *))zc_addTextFontStyle {
    return ^NSMutableAttributedString *(UIFont *font) {
        return self.zc_addStyle(NSFontAttributeName, font);
    };
}

- (NSMutableAttributedString *(^)(UIColor *))zc_addTextColorStyle {
    return ^NSMutableAttributedString *(UIColor *color) {
        return self.zc_addStyle(NSForegroundColorAttributeName, color);
    };
}

- (NSMutableAttributedString *(^)(UIColor *))zc_addTintColorStyle {
    return ^NSMutableAttributedString *(UIColor *color) {
        return self.zc_addStyle(NSBackgroundColorAttributeName, color);
    };
}

- (NSMutableAttributedString *(^)(int))zc_addTextKernStyle {
    return ^NSMutableAttributedString *(int kern) {
        return self.zc_addStyle(NSKernAttributeName, @(kern));
    };
}

- (NSMutableAttributedString *(^)(int, UIColor *))zc_addTextStrokeStyle {
    return ^NSMutableAttributedString *(int stroke, UIColor *color) {
        self.zc_addStyle(NSStrokeWidthAttributeName, @(stroke));
        return self.zc_addStyle(NSStrokeColorAttributeName, color);
    };
}

- (NSMutableAttributedString *(^)(ZCAttribType, UIColor *))zc_addUnderlineStyle {
    return ^NSMutableAttributedString *(ZCAttribType type, UIColor *color) {
        self.zc_addStyle(NSUnderlineStyleAttributeName, @(type));
        return self.zc_addStyle(NSUnderlineColorAttributeName, color);
    };
}

- (NSMutableAttributedString *(^)(ZCAttribType, UIColor *))zc_addStrikethroughStyle {
    return ^NSMutableAttributedString *(ZCAttribType type, UIColor *color) {
        self.zc_addStyle(NSStrikethroughStyleAttributeName, @(type));
        return self.zc_addStyle(NSUnderlineColorAttributeName, color);
    };
}

- (NSMutableAttributedString *(^)(NSString *, NSDictionary *))zc_appendTextAndStyle {
    return ^NSMutableAttributedString *(NSString *text, NSDictionary *style) {
        if(text && ![text isEqual:[NSNull null]]) {
            if(![text isKindOfClass:[NSString class]]) {
                text = [NSString stringWithFormat:@"%@", text];
            }
            if(text.length) {
                NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
                [str addAttributes:style range:NSMakeRange(0,str.length)];
                [self appendAttributedString:str];
            }
        }
        return self;
    };
}

@end
