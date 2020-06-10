//
//  ZCTextField.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/27.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCTextField.h"

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


@implementation UITextField (ZCHandleMaxTextLength)

#pragma mark - 设置文本最大长度
- (void)zc_handleMaxTextLengthWithLength:(int)textMaxLength {
    NSString *toBeString = self.text;
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    if (!position || !selectedRange)
    {
        if (toBeString.length > textMaxLength)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:textMaxLength];
            if (rangeIndex.length == 1) {
                self.text = [toBeString substringToIndex:textMaxLength];
            }else {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, textMaxLength)];
                self.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}

@end
