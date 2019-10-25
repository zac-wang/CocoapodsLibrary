//
//  ZCKeyBoardTopBar.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/4/25.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCKeyBoardTopBar.h"
#import "Macro.h"
#import "UITextField+ZCSelectedRange.h"
#import "UITextView+ZCSelectedRange.h"
#import "ZCTextField.h"

@interface ZCKeyBoardTopBar()

@property(nonatomic, strong) ZCTextField *zc_barTextField;

@property(nonatomic, assign) ZCKeyBoardTopBarStyle topBarStyle;

@end

#define ZCKeyBoardTopBarHeight 45

@implementation ZCKeyBoardTopBar
@synthesize zc_textView;
@synthesize zc_textField;

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
    self = [super initWithFrame:CGRectMake(0, 0, ZC_SCREEN_WIDTH, ZCKeyBoardTopBarHeight)];
    if (self) {
        [self setBarStyle:UIBarStyleDefault];
        
        self.zc_barTextField = [[ZCTextField alloc] initWithFrame:CGRectMake(0, 0, ZC_SCREEN_WIDTH - 90, 30)];
        self.zc_barTextField.borderStyle = UITextBorderStyleRoundedRect;
//        [self.zc_barTextField zc_drawCornerRadius:3 borderColor:[UIColor grayColor]];
        self.zc_barTextField.backgroundColor = [UIColor whiteColor];
        UIView *textFieldBackView = [[UIView alloc] initWithFrame:self.zc_barTextField.bounds];
        textFieldBackView.backgroundColor = [UIColor clearColor];
        [textFieldBackView addSubview:self.zc_barTextField];
        UIBarButtonItem *editSpace = [[UIBarButtonItem alloc] initWithCustomView:textFieldBackView];
        
        UIBarButtonItem *nonepace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];

        [self setItems:@[editSpace, nonepace, doneButton]];
        
        self.zc_style(ZCKeyBoardTopBarStylePlain);
    }
    return self;
}

#pragma mark - 设置TextView
- (void)setZc_textView:(UITextView *)_textView {
    [self cleanView];
    
    zc_textView = _textView;
    [self initialView:(id)zc_textView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:zc_textView];
}

- (void)setZc_textField:(UITextField *)_textField {
    [self cleanView];
    
    zc_textField = _textField;
    [self initialView:zc_textField];
    
    [zc_textField addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingDidBegin];
}

- (void)initialView:(UITextField *)textView {
    [textView setInputAccessoryView:self];
    
    self.zc_barTextField.text = textView.text;
    
    __weak typeof(self)weakSelf = self;
    self.zc_barTextField.zc_updateEvent = ^(ZCTextField *textField) {
        if(weakSelf.zc_textField) {
            weakSelf.zc_textField.text = textField.text;
        }else {
            weakSelf.zc_textView.text = textField.text;
        }
    };
}

#pragma mark - 取消键盘
- (void)dismissKeyBoard {
    [self.zc_textView resignFirstResponder];
    [self.zc_textField resignFirstResponder];
    [self.zc_barTextField resignFirstResponder];
}

#pragma mark - 重置数据
- (void)cleanView {
    zc_textField = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidBeginEditingNotification object:self.zc_textView];
    
    zc_textView = nil;
    [zc_textField removeTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingDidBegin];
}

#pragma mark - 开始编辑事件
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if(self.topBarStyle == ZCKeyBoardTopBarStyleTextField) {
        [self.zc_barTextField becomeFirstResponder];
        
        self.zc_barTextField.zc_selectedRange = self.zc_textField.zc_selectedRange;
    }
}

- (void)textViewDidBeginEditing:(NSNotification *)notification {
    if(self.topBarStyle == ZCKeyBoardTopBarStyleTextField) {
        [self.zc_barTextField becomeFirstResponder];
        
        self.zc_barTextField.zc_selectedRange = self.zc_textView.zc_selectedRange;
    }
}

#pragma mark - 设置样式
- (ZCKeyBoardTopBar *(^)(ZCKeyBoardTopBarStyle))zc_style {
    return ^ZCKeyBoardTopBar *(ZCKeyBoardTopBarStyle style) {
        self.topBarStyle = style;
        //NSLog(@"%d", style);
        
        if(self.zc_style == ZCKeyBoardTopBarStylePlain) {
            self.items.firstObject.customView.hidden = YES;
        }else if(self.topBarStyle == ZCKeyBoardTopBarStyleTextField) {
            self.items.firstObject.customView.hidden = NO;
        }
        return self;
    };
}

- (void)dealloc {
    [self cleanView];
}

@end
