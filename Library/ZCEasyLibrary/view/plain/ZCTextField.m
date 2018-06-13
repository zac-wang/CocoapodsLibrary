//
//  ZCTextField.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/27.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCTextField.h"
#import "UITextField+ZCHandleMaxTextLength.h"

@interface ZCTextField() {
    BOOL zc_monitoringTextEdit;
}

@end

@implementation ZCTextField

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self monitoringTextEdit];
}

#pragma mark - 启动监听 “文本内容变化” 事件
- (void)monitoringTextEdit {
    if(!zc_monitoringTextEdit) {
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        /*
         * UIControlEventEditingDidEnd 当失去焦点时触发
         * UIControlEventEditingDidEndOnExit 点击键盘done这个button会触发，键盘消失同时触发UIControlEventEditingDidEnd事件
         */
        UIControlEvents events = UIControlEventEditingDidEnd | UIControlEventEditingDidEndOnExit;
        [self addTarget:self action:@selector(textFieldDidEndOnExit:) forControlEvents:events];
    }
    zc_monitoringTextEdit = YES;
}

- (void)textFieldDidChange:(UITextField *)textField {
    if(self.zc_textMaxLength > 0) {
        [self zc_handleMaxTextLengthWithLength:self.zc_textMaxLength];
    }
    
    if(self.zc_updateEvent) {
        self.zc_updateEvent(self);
    }
}

- (void)textFieldDidEndOnExit:(UITextField *)textField {
    [self resignFirstResponder];
    if(self.zc_endEditEvent)
        self.zc_endEditEvent(self);
}

- (void)zc_setLeftImage:(UIImage *)image frame:(CGRect)frame {
    UIImageView *leftImageView = [[UIImageView alloc] initWithImage:image];
    leftImageView.frame = frame;
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftImageView;
}

@end
