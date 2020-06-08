//
//  ZCKeyBoardTopBar.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/25.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCKeyBoardTopBar.h"
#import "UITextField+ZCSelectedRange.h"
#import "UITextView+ZCSelectedRange.h"

@interface ZCKeyBoardTopBar()<UITextFieldDelegate>

@property(nonatomic, strong) UITextField *zc_barTextField;

@end

#define ZCKeyBoardTopBarHeight 45

@implementation ZCKeyBoardTopBar

+ (instancetype)shared {
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, ZCKeyBoardTopBarHeight)];
    if (self) {
        [self setBarStyle:UIBarStyleDefault];
        
        [self setTopBarItem];
        
        self.zc_topBarStyle = ZCKeyBoardTopBarStyleTextField;
    }
    return self;
}

- (UITextField *)zc_barTextField {
    if (!_zc_barTextField) {
        _zc_barTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - 90, 30)];
        _zc_barTextField.borderStyle = UITextBorderStyleRoundedRect;
//        [self.zc_barTextField zc_drawCornerRadius:3 borderColor:[UIColor grayColor]];
        _zc_barTextField.backgroundColor = [UIColor whiteColor];
        _zc_barTextField.delegate = self;
    }
    return _zc_barTextField;
}

- (void)setTopBarItem {
    UIView *textFieldBackView = [[UIView alloc] initWithFrame:self.zc_barTextField.bounds];
    textFieldBackView.backgroundColor = [UIColor clearColor];
    [textFieldBackView addSubview:self.zc_barTextField];
    
    UIBarButtonItem *marginSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    marginSpace.width = 10;
    
    UIBarButtonItem *editSpace = [[UIBarButtonItem alloc] initWithCustomView:textFieldBackView];
    
    UIBarButtonItem *nonepace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];

    [self setItems:@[marginSpace, editSpace, nonepace, doneButton, marginSpace]];
}

#pragma mark - 设置样式
- (void)setZc_topBarStyle:(ZCKeyBoardTopBarStyle)zc_topBarStyle {
    _zc_topBarStyle = zc_topBarStyle;
    //NSLog(@"%d", style);
    
    if(self.zc_topBarStyle == ZCKeyBoardTopBarStylePlain) {
        self.items.firstObject.customView.hidden = YES;
    }else if(self.zc_topBarStyle == ZCKeyBoardTopBarStyleTextField) {
        self.items.firstObject.customView.hidden = NO;
    }
}

#pragma mark - 设置TextView
- (void)setZc_textInputView:(id<UITextInput,NSCoding>)zc_textInputView {
    if (_zc_textInputView) {
        [self cleanView];
    }
    
    _zc_textInputView = zc_textInputView;
    
    [self initialView:(UITextField *)zc_textInputView];
}

- (void)initialView:(UITextField *)textView {
    [textView setInputAccessoryView:self];
    
    [self updateBarTextField];
    
    if ([textView isKindOfClass:[UITextView class]]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(zc_textInputViewDidBeginEditing)
                                                     name:UITextViewTextDidBeginEditingNotification
                                                   object:textView];
    
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(updateBarTextField)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:textView];
    } else if ([textView isKindOfClass:[UITextField class]]) {
        [(UITextField *)textView addTarget:self
                                    action:@selector(zc_textInputViewDidBeginEditing)
                          forControlEvents:UIControlEventEditingDidBegin];
        
        [(UITextField *)textView addTarget:self
                                    action:@selector(updateBarTextField)
                          forControlEvents:UIControlEventEditingChanged];
    }
}

#pragma mark - 重置数据
- (void)cleanView {
    if ([self.zc_textInputView isKindOfClass:[UITextView class]]) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UITextViewTextDidBeginEditingNotification
                                                      object:self.zc_textInputView];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UITextViewTextDidChangeNotification
                                                      object:self.zc_textInputView];
    } else if ([self.zc_textInputView isKindOfClass:[UITextField class]]) {
        [(UITextField *)self.zc_textInputView removeTarget:self
                                               action:@selector(zc_textInputViewDidBeginEditing)
                                     forControlEvents:UIControlEventEditingDidBegin];
        
        [(UITextField *)self.zc_textInputView removeTarget:self
                                                    action:@selector(updateBarTextField)
                                          forControlEvents:UIControlEventEditingChanged];
    }
    
    self.zc_textInputView = nil;
}

#pragma mark - 开始编辑事件 - 焦点转移到zc_barTextField上
- (void)zc_textInputViewDidBeginEditing {
    if(self.zc_topBarStyle == ZCKeyBoardTopBarStyleTextField) {
        [self becomeFirstResponderForBarTextField];
    }
}

- (void)becomeFirstResponderForBarTextField {
    [self updateBarTextField];
    
    [self.zc_barTextField becomeFirstResponder];
}

#pragma mark - 更新文本
- (void)textFieldDidChangeSelection:(UITextField *)textField {
    [self updateTextInputView];
}

- (void)updateTextInputView {
    if([self.zc_textInputView respondsToSelector:@selector(setText:)]) {
        [self.zc_textInputView performSelector:@selector(setText:) withObject:self.zc_barTextField.text];
    }
}

- (void)updateBarTextField {
    if([self.zc_textInputView respondsToSelector:@selector(text)]) {
        self.zc_barTextField.text = [self.zc_textInputView performSelector:@selector(text)];
    }
}

#pragma mark - 取消键盘
- (void)dismissKeyBoard {
    [self updateTextInputView];
    
    [self.zc_barTextField resignFirstResponder];
    
    if([self.zc_textInputView respondsToSelector:@selector(resignFirstResponder)]) {
        [self.zc_textInputView performSelector:@selector(resignFirstResponder)];
    }
}

- (void)dealloc {
    [self cleanView];
}

@end
