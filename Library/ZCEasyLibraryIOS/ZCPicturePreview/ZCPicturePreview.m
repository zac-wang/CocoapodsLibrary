//
//  ZCPicturePreview.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/12.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCPicturePreview.h"

@interface ZCPicturePreviewItem (update)
- (void)updateIndex:(NSUInteger)index count:(NSUInteger)count;
@end
@implementation ZCPicturePreviewItem (update)
- (void)updateIndex:(NSUInteger)index count:(NSUInteger)count {
    [self setValue:@(index) forKey:@"zc_index"];
//    self.zc_pageLabel.text = [NSString stringWithFormat:@"%lu / %lu", (unsigned long)index + 1, (unsigned long)count];
}
@end



@interface ZCPicturePreview() <UIScrollViewDelegate>

/// 预览item数组
@property(nonatomic, strong) NSMutableArray<ZCPicturePreviewItem *> *zc_previewItemArray;

/// 预览的 原UIImageView数组
@property(nonatomic, strong) NSMutableDictionary<NSNumber *, UIView *> *zc_originalImgViewMap;

@end


@implementation ZCPicturePreview
@synthesize zc_imageCount;
@synthesize zc_nowShowImgIndex;
@synthesize zc_headBar;

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
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:30/255.0 alpha:1];
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.delegate = self;
        self.hidden = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zc_selfClick:)];
        [self addGestureRecognizer:tap];
        
        [self initialPicturePreviewItem];
        
        zc_headBar = [[ZCPicturePreviewHeadbar alloc] init];
        [self addSubview:zc_headBar];
        
        self.zc_originalImgViewMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)initialPicturePreviewItem {
    self.zc_previewItemArray = [NSMutableArray array];
    
    for (int i = 0; i < 3; i++) {
        ZCPicturePreviewItem *item = [[ZCPicturePreviewItem alloc] init];
        [self addSubview:item];
        [self.zc_previewItemArray addObject:item];
    }
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    
    float imgWidth = self.frame.size.width;
    for (int i = 0; i < self.zc_previewItemArray.count; i++) {
        ZCPicturePreviewItem *item = self.zc_previewItemArray[i];
        item.frame = CGRectMake(i*imgWidth, 0, imgWidth, self.frame.size.height);
    }
    int index = self.contentOffset.x/self.bounds.size.width;
    self.contentOffset = CGPointMake(self.frame.size.width * index, 0);
    
    self.zc_imageCount = self.zc_imageCount;
    
    zc_headBar.frame = CGRectMake(self.contentOffset.x, 20, self.frame.size.width, 44);
}

- (void)setZc_imageCount:(NSUInteger)imageCount {
    zc_imageCount = imageCount;
    if(imageCount <= 0)
        [self.zc_originalImgViewMap removeAllObjects];
    
    NSUInteger maxPageNum = zc_imageCount > 3 ? 3 : zc_imageCount;
    self.contentSize = CGSizeMake(self.frame.size.width * maxPageNum, self.frame.size.height);
}

#pragma mark -
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.hidden)
        return;
    
    zc_headBar.frame = CGRectMake(self.contentOffset.x, 20, self.frame.size.width, 44);
    
    float minIndex = self.contentOffset.x/self.bounds.size.width;
    if(minIndex <= 0) {
        
    }else if(minIndex < [self itemIndexForImageIndex:zc_nowShowImgIndex]) {
        [self willUpdateShow:zc_nowShowImgIndex - 1 itemIndex:(int)(minIndex-1)];
    }else if(minIndex > [self itemIndexForImageIndex:zc_nowShowImgIndex]) {
        [self willUpdateShow:zc_nowShowImgIndex + 1 itemIndex:(int)(minIndex+1)];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if(self.hidden)
        return;
    [self didUpdateShow];
}

- (void)willUpdateShow:(NSUInteger)index itemIndex:(NSUInteger)itemIndex {
    if(index >= self.zc_imageCount) {
        return;
    }
    if(itemIndex > 2) {//为什么会出现这个
        return;
    }
        
    ZCPicturePreviewItem *item = self.zc_previewItemArray[itemIndex];
    [item updateIndex:index count:self.zc_imageCount];
    [self.zc_headBar zc_pageNum:index totalNum:self.zc_imageCount];
    if(item.zc_firstLoadding != YES) {
        if(self.zc_willChangeBlock) {
            self.zc_willChangeBlock(self, item);
        }
    }
    item.zc_firstLoadding = YES;
}

- (void)didUpdateShow {
    ZCPicturePreviewItem *item = [self nowShowItem];
    NSUInteger itemTargetIndex = [self itemIndexForImageIndex:item.zc_index];
    NSUInteger itemNowIndex = [self.zc_previewItemArray indexOfObject:item];
    zc_nowShowImgIndex = item.zc_index;

    if(itemNowIndex != itemTargetIndex) {
        [self exchangeItemIndex:itemNowIndex withItemAtIndex:itemTargetIndex];
    }
    self.contentOffset = CGPointMake(self.frame.size.width * itemTargetIndex, 0);
    if(self.zc_didChangeBlock) {
        self.zc_didChangeBlock(self, item);
    }
    
    for (ZCPicturePreviewItem *i in self.zc_previewItemArray) {
        if(item == i) {
            [i zc_viewDidAppear];
        }else{
            [i zc_viewDidDisappear];
        }
    }
}

- (void)exchangeItemIndex:(NSUInteger)index withItemAtIndex:(NSUInteger)atIndex {
    ZCPicturePreviewItem *item = self.zc_previewItemArray[index];
    ZCPicturePreviewItem *atItem = self.zc_previewItemArray[atIndex];
    CGRect tmpFrame = item.frame;
    item.frame = atItem.frame;
    atItem.frame = tmpFrame;
    
    [self.zc_previewItemArray exchangeObjectAtIndex:index withObjectAtIndex:atIndex];
}

/// 实时显示的item
- (ZCPicturePreviewItem *)nowShowItem {
    int index = self.contentOffset.x/self.bounds.size.width;
    ZCPicturePreviewItem *item = self.zc_previewItemArray[index];
    return item;
}

/// 根据当前显示图片的下标值，获取应该显示的item下标值
- (NSUInteger)itemIndexForImageIndex:(NSUInteger)showIndex {
    //判断是两头还是中间
    if(showIndex == 0) {
        return 0;
    }else if((showIndex + 1) < self.zc_imageCount || self.zc_imageCount == 2){
        return 1;
    }else{
        return 2;
    }
}

#pragma mark -
- (void)zc_selfClick:(UITapGestureRecognizer *)tap {
    [self zc_hiddenView];
}

@end


@implementation ZCPicturePreview (ZCMonitorImageView)

- (void)zc_monitorView:(UIView *)view index:(NSUInteger)index {
    self.zc_originalImgViewMap[@(index)] = view;
}

- (void)zc_monitorImageView:(UIImageView *)imgView index:(NSUInteger)index {
    imgView.userInteractionEnabled = YES;
    [self zc_monitorView:imgView index:index];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMonitorImageView:)];
    [imgView addGestureRecognizer:tap];
}

- (void)tapMonitorImageView:(UITapGestureRecognizer *)tap {
    UIImageView *imgView = (UIImageView *)tap.view;
    [self zc_showViewWithView:imgView];
}

@end



@implementation ZCPicturePreview (ZCAnimat)

- (void)zc_showViewWithView:(UIView *)view {
    NSNumber *indexNum = [self.zc_originalImgViewMap allKeysForObject:view].firstObject;
    [self zc_showViewWithView:view index:indexNum.unsignedIntegerValue];
}

- (void)zc_showViewWithView:(UIView *)view index:(NSUInteger)index {
    [self.superview endEditing:YES];
    
    if(view) {
        self.zc_originalImgViewMap[@(index)] = view;
        self.contentOffset = CGPointMake(0, 0);
        ZCPicturePreviewItem *item = self.zc_previewItemArray.firstObject;
        [item updateIndex:index count:self.zc_imageCount];
        if(self.zc_willChangeBlock)
            self.zc_willChangeBlock(self, item);
        [self.zc_headBar zc_pageNum:index totalNum:self.zc_imageCount];
        
        self.frame = [view convertRect:view.bounds toView:self.superview];
    }
    
    [self zc_showView];
}

- (void)zc_showView {
//    self.backgroundColor = [UIColor clearColor];
    self.hidden = NO;
    zc_headBar.hidden = NO;
    
    [UIView transitionWithView:self.superview
                      duration:0.25
                       options:UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionAllowAnimatedContent
                    animations:^{
//    [UIView animateWithDuration:0.25
//                     animations:^{
                        self.frame = self.superview.bounds;
                        self.alpha = 1;
//                        self.backgroundColor = [UIColor colorWithWhite:30/255.0 alpha:1];
                    } completion:^(BOOL finished) {
                        [self didUpdateShow];
                    }];
}

- (void)zc_hiddenView {
    UIView *imgView = self.zc_originalImgViewMap[@(zc_nowShowImgIndex)];
    CGRect rect = self.frame;
    if(imgView) {
        rect = [imgView convertRect:imgView.bounds toView:self.superview];
    }
    [self zc_hiddenViewWithCGRect:rect];
}

- (void)zc_hiddenViewWithCGRect:(CGRect)rect {
    zc_headBar.hidden = YES;
    
    [UIView transitionWithView:self.superview
                      duration:0.25
                       options:UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionAllowAnimatedContent
                    animations:^{
//    [UIView animateWithDuration:0.25
//                     animations:^{
                        self.frame = rect;
                        self.alpha = 0;
//                        self.backgroundColor = [UIColor clearColor];
                    } completion:^(BOOL finished) {
                        self.hidden = YES;
                    }];
}

@end
