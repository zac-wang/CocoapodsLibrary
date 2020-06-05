//
//  ZCScrollTextView.m
//  test
//
//  Created by wzc on 2020/6/4.
//  Copyright © 2020 wzc. All rights reserved.
//

#import "ZCScrollTextView.h"

@interface ZCScrollTextView ()

@end

@implementation ZCScrollTextView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setHasVerticalScroller:YES];
        [self setHasHorizontalScroller:NO];
        [self setBorderType:NSLineBorder];
        [self setDrawsBackground:NO];
        [self setHorizontalScrollElasticity:NSScrollElasticityNone];
        [self setDocumentView:self.textView];
    }
    return self;
}

- (void)setFrame:(NSRect)frame {
    super.frame = frame;
    
    [self updateTextView];
}

- (NSTextView *)textView {
    if (!_textView) {
        _textView = [[NSTextView alloc] initWithFrame:self.bounds];
        [_textView setDrawsBackground:NO];
        [_textView setTextColor:[NSColor blackColor]];
        [_textView setFont:[NSFont systemFontOfSize:12]];
        [_textView setUsesFontPanel:NO];
        [_textView setVerticallyResizable:YES];
        [_textView setHorizontallyResizable:NO];
        [_textView setAutomaticLinkDetectionEnabled:NO];
        [_textView.textContainer setWidthTracksTextView:YES];
        [self updateTextView];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:4.0];
        [_textView setDefaultParagraphStyle:paragraphStyle];
    }
    return _textView;
}

- (void)updateTextView {
    self.textView.frame = self.bounds;
    
    [_textView setMinSize:NSMakeSize(self.frame.size.width, self.frame.size.height)];
    [_textView setMaxSize:NSMakeSize(self.frame.size.width, FLT_MAX)];
    [_textView.textContainer setContainerSize:NSMakeSize(self.frame.size.width, FLT_MAX)];
}

- (void)dealloc
{
    _textView = nil;
}

@end
