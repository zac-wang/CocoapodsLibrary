//
//  ZCTextView.m
//  ZCEasyLibrary
//
//  Created by zac on 2017/10/28.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCTextView.h"
#import "UITextView+ZCHandleMaxTextLength.h"

@interface ZCTextView() {
    //是否开启了 监听文字变化事件
    BOOL zc_monitoringTextEdit;
}
/**
 提示文字View
 */
@property(nonatomic,readonly) UITextView *zc_placeholderTextView;

@end

@implementation ZCTextView
@synthesize zc_placeholderTextView;
@synthesize zc_updateEvent;

#pragma mark - 更新UI
- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    
    self.zc_placeholderTextView.frame = self.bounds;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.zc_placeholderTextView.frame = self.bounds;
}

- (void)didAddSubview:(UIView *)subview{
    [super didAddSubview:subview];
    
    [self textViewDidChangeText:nil];
}

#pragma mark - 初始化 placeholderTextView
- (UITextView *)zc_placeholderTextView {
    if(!zc_placeholderTextView) {
        zc_placeholderTextView = [[UITextView alloc] init];
        zc_placeholderTextView.userInteractionEnabled = NO;
        zc_placeholderTextView.editable = NO;
        zc_placeholderTextView.backgroundColor = [UIColor clearColor];
        [self addSubview:zc_placeholderTextView];
        [self monitoringTextEdit];
    }
    return zc_placeholderTextView;
}

#pragma mark - 启动 “监测文本内容变化” 事件
- (void)monitoringTextEdit {
    if(!zc_monitoringTextEdit) {
        NSNotificationCenter *noti = [NSNotificationCenter defaultCenter];
        [noti addObserver:self selector:@selector(textViewDidChangeText:) name:UITextViewTextDidChangeNotification object:self];
    }
    [self textViewDidChangeText:nil];
    
    zc_monitoringTextEdit = YES;
}

#pragma mark 监测文本内容变化 事件
- (void)textViewDidChangeText:(NSNotification *)notification {
    if(self.zc_textMaxLength > 0) {
        [self zc_handleMaxTextLengthWithLength:self.zc_textMaxLength];
    }
    
    if(self.zc_updateEvent) {
        self.zc_updateEvent(self);
    }
    
    self.zc_placeholderTextView.hidden = self.text.length;
}

#pragma mark - 回调用户 “文本更新事件”
- (void)setZc_updateEvent:(void (^)(ZCTextView *))event {
    zc_updateEvent = [event copy];
    [self monitoringTextEdit];
}

#pragma mark -
- (float)zc_height {
    return [self sizeThatFits:CGSizeMake(90, self.zc_maxHeight?:CGFLOAT_MAX)].height;
}

- (void)zc_updateHeight {
    self.frame = ({ CGRect r = self.frame; r.size.height = self.zc_height; r; });
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


#pragma mark - ZCTextView (ZCPlaceholder)
@implementation ZCTextView (ZCPlaceholder)

- (void)setZc_placeholder:(NSString *)_placeholder {
    self.zc_placeholderTextView.text = _placeholder;
    [self updatePlaceholderTextViewStyle];
}

- (NSString *)zc_placeholder {
    return self.zc_placeholderTextView.text;
}

- (void)setZc_placeholderAttributesString:(NSAttributedString *)attributesString {
    self.zc_placeholderTextView.attributedText = attributesString;
    [self updatePlaceholderTextViewStyle];
}

- (NSAttributedString *)zc_placeholderAttributesString {
    return self.zc_placeholderTextView.attributedText;
}

- (void)updatePlaceholderTextViewStyle {
    self.zc_placeholderTextView.frame = self.bounds;
    self.zc_placeholderTextView.font = self.font;
    self.zc_placeholderTextView.textColor = self.zc_placeholderColor ?: [self.textColor colorWithAlphaComponent:0.7];
    [self textViewDidChangeText:nil];
}

@end
