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
@synthesize textView;

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
    if (!textView) {
        textView = [[NSTextView alloc] initWithFrame:self.bounds];
        [textView setDrawsBackground:NO];
        [textView setTextColor:[NSColor blackColor]];
        [textView setFont:[NSFont systemFontOfSize:12]];
        [textView setUsesFontPanel:NO];
        [textView setVerticallyResizable:YES];
        [textView setHorizontallyResizable:NO];
        [textView setAutomaticLinkDetectionEnabled:NO];
        [textView.textContainer setWidthTracksTextView:YES];
        [self updateTextView];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:4.0];
        [textView setDefaultParagraphStyle:paragraphStyle];
    }
    return textView;
}

- (void)updateTextView {
    self.textView.frame = self.bounds;
    
    [textView setMinSize:NSMakeSize(self.frame.size.width, self.frame.size.height)];
    [textView setMaxSize:NSMakeSize(self.frame.size.width, FLT_MAX)];
    [textView.textContainer setContainerSize:NSMakeSize(self.frame.size.width, FLT_MAX)];
}

- (void)dealloc
{
    [textView removeFromSuperview];
}

@end
