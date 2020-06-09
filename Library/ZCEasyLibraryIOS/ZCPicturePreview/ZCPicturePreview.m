//
//  ZCPicturePreview.m
//  ZCEasyLibrary
//
//  Created by zac on 2018/5/12.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCPicturePreview.h"

@interface ZCPicturePreviewItem (update)
/// 图片是否已设置加载，防止scrollf滚动过程中多次调用
@property(nonatomic, assign)   BOOL zc_loadding;
/// 当前图片下标
- (void)setZc_index:(NSUInteger)index;
/// 图片不在显示范围
- (void)zc_viewDidDisappear;
@end

@interface ZCPicturePreviewHeadbar (deleteBlock)
/// 删除事件
@property(nonatomic, copy) void(^zc_deleteImageBlock)(void);
@end



@interface ZCPicturePreview() <UIScrollViewDelegate>

/// 预览item数组
@property(nonatomic, strong) NSMutableArray<ZCPicturePreviewItem *> *zc_previewItemArray;

/// 记录起始滑动位置，用于判断滑动方向
@property(nonatomic, assign) float lastContentOffset;
/// 记录是否处于滑动中，用于判断是否连续滑动 即上次滑动未结束 又立即滑动多次，造成lastContentOffset被多次修改，失去准确性
@property(nonatomic, assign) BOOL isScrollStarting;

/// 外部view，用于动画 展示/放大 起点frame，动画 隐藏/缩小 结束frame
@property(nonatomic, strong) UIView *zc_outsideShowView;

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
        
        [self bringSubviewToFront:self.zc_headBar];
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

- (ZCPicturePreviewHeadbar *)zc_headBar {
    if (!zc_headBar) {
        zc_headBar = [[ZCPicturePreviewHeadbar alloc] init];
        [self addSubview:zc_headBar];
        __weak typeof(self)weakSelf = self;
        zc_headBar.zc_deleteImageBlock = ^{
            if (weakSelf.zc_deleteImageBlock) {
                weakSelf.zc_deleteImageBlock(weakSelf.zc_nowShowImgIndex);
            }
        };
    }
    return zc_headBar;
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    
    float imgWidth = self.frame.size.width;
    for (int i = 0; i < self.zc_previewItemArray.count; i++) {
        ZCPicturePreviewItem *item = self.zc_previewItemArray[i];
        item.frame = CGRectMake(i*imgWidth, 0, imgWidth, self.frame.size.height);
    }
    
    
    [self updateScrollViewContent];
    
    [self updateHeadBarFrame];
}

- (void)updateHeadBarFrame {
    if (@available(iOS 11.0, *)) {
        self.zc_headBar.frame = CGRectMake(self.contentOffset.x, self.window.safeAreaInsets.top, self.frame.size.width, 44);
    } else {
        self.zc_headBar.frame = CGRectMake(self.contentOffset.x, 20, self.frame.size.width, 44);
    }
}

- (void)setZc_imageCount:(NSUInteger)imageCount {
    zc_imageCount = imageCount;

    [self updateScrollViewContent];
}

- (void)updateScrollViewContent {
    NSUInteger showIndex = 1;
    if (self.zc_nowShowImgIndex <= 0) {
        showIndex = 0;
    } else if (self.zc_nowShowImgIndex >= self.zc_imageCount - 1) {
        showIndex = 2;
    }
    self.contentOffset = CGPointMake(self.frame.size.width * showIndex, 0);
    self.contentSize   = CGSizeMake (self.frame.size.width * (self.zc_imageCount > 3 ? 3 : self.zc_imageCount), self.bounds.size.height);
}

#pragma mark - UIScrollViewDelegate
/// 滑动开始
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.isScrollStarting == NO) {
        self.lastContentOffset = scrollView.contentOffset.x;
        
        self.isScrollStarting = YES;
    }
}

/// 滑动过程
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.hidden)
        return;
    [self updateHeadBarFrame];
    
    if (self.contentOffset.x > self.lastContentOffset) { // 左滑
        // 当前是否为第一个
        if (zc_nowShowImgIndex == 0) {
            [self willUpdateShow:zc_nowShowImgIndex + 1 item:self.zc_previewItemArray[1]];
        } else {
            [self willUpdateShow:zc_nowShowImgIndex + 1 item:self.zc_previewItemArray[2]];
        }
    } else if (self.contentOffset.x < self.lastContentOffset) { // 右滑
        // 是否为最后一个
        if (zc_nowShowImgIndex == self.zc_imageCount - 1) {
            [self willUpdateShow:zc_nowShowImgIndex - 1 item:self.zc_previewItemArray[1]];
        } else {
            [self willUpdateShow:zc_nowShowImgIndex - 1 item:self.zc_previewItemArray[0]];
        }
    }
}

/// 滑动结束
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if(self.hidden)
        return;
    self.isScrollStarting = NO;
    
    [self scrollViewDidScroll:scrollView];
    [self didUpdateShow];
}

- (void)willUpdateShow:(NSUInteger)index item:(ZCPicturePreviewItem *)item {
    if(index < 0 || index >= self.zc_imageCount) {
        return;
    }
    item.zc_index = index;
    
    if(item.zc_loadding != YES) {
        if(self.zc_willChangeBlock) {
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                self.zc_willChangeBlock(self, item);
            });
        }
        item.zc_loadding = YES;
    }
}

- (void)didUpdateShow {
    NSUInteger nowShowItemIndex = [self nowShowItemIndex];
    ZCPicturePreviewItem *nowShowItem = self.zc_previewItemArray[nowShowItemIndex];
    
    zc_nowShowImgIndex = nowShowItem.zc_index;
    self.zc_headBar.zc_title = [NSString stringWithFormat:@"%lu / %lu", nowShowItem.zc_index + 1, self.zc_imageCount];

    [self exchangeItem];
    
    for (int i = 0; i < self.zc_previewItemArray.count; i++) {
        ZCPicturePreviewItem *item = self.zc_previewItemArray[i];
        if(nowShowItem != item) {
            [item zc_viewDidDisappear];
            item.zc_index = i - nowShowItemIndex + nowShowItem.zc_index;
        }
        item.zc_loadding = NO;
    }
    
    if(self.zc_didChangeBlock) {
        self.zc_didChangeBlock(self, [self nowShowItem]);
    }
}

- (void)exchangeItem {
    /// 根据当前显示图片的下标值，获取应该显示的item下标值
    //判断是两头还是中间
    if(zc_nowShowImgIndex <= 0) { // 第一个、第二个位置不用变
        return;
    }else if(zc_nowShowImgIndex >= self.zc_imageCount - 1) { // 最后一个位置不用变
        return;
    }else if(zc_nowShowImgIndex >= self.zc_imageCount) {
        return;
    }
        
    ZCPicturePreviewItem *item = self.zc_previewItemArray[1];
    ZCPicturePreviewItem *atItem = self.zc_previewItemArray[[self nowShowItemIndex]];
    
    CGRect tmpFrame = item.frame;
    item.frame = atItem.frame;
    atItem.frame = tmpFrame;
    
    [self.zc_previewItemArray exchangeObjectAtIndex:1 withObjectAtIndex:[self nowShowItemIndex]];
    self.contentOffset = CGPointMake(self.frame.size.width * 1, 0);
}

/// 实时显示的item
- (ZCPicturePreviewItem *)nowShowItem {
    return self.zc_previewItemArray[[self nowShowItemIndex]];
}

/// 当前显示的itemIndex
- (NSUInteger)nowShowItemIndex {
    int index = self.contentOffset.x/self.bounds.size.width;
    if (index < 0) {
        index = 0;
    } else if (index > 2) {
        index = 2;
    }
    return index;
}

#pragma mark -
- (void)zc_selfClick:(UITapGestureRecognizer *)tap {
    [self zc_hiddenView];
}

@end


@implementation ZCPicturePreview (ZCAnimat)

-(void)zc_showViewWithIndex:(NSUInteger)index {
    [self zc_showViewWithView:nil index:index];
}

- (void)zc_showViewWithView:(UIView *)view index:(NSUInteger)index {
    [self.superview endEditing:YES];
    self.zc_outsideShowView = view;
    
    
    CGRect rect = self.superview.bounds;
    {
        self.frame = rect;
        zc_nowShowImgIndex = index;
        [self updateScrollViewContent];
        [self willUpdateShow:index item:[self nowShowItem]];
    }
    
    
    if(view) {
        rect = [self.zc_outsideShowView convertRect:self.zc_outsideShowView.bounds toView:self.superview];
    }
    [self zc_showViewWithCGRect:rect];
}

- (void)zc_showViewWithCGRect:(CGRect)rect {
    self.frame = rect;
//    self.backgroundColor = [UIColor clearColor];
    self.hidden = NO;
    
    [UIView transitionWithView:self.superview
                      duration:0.25
                       options:UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionAllowAnimatedContent
                    animations:^{
                        self.frame = self.superview.bounds;
                        self.alpha = 1;
//                        self.backgroundColor = [UIColor colorWithWhite:30/255.0 alpha:1];
                    } completion:^(BOOL finished) {
                        [self didUpdateShow];
                    }];
}

- (void)zc_hiddenView {
    CGRect rect = self.frame;
    if(self.zc_outsideShowView) {
        rect = [self.zc_outsideShowView convertRect:self.zc_outsideShowView.bounds toView:self.superview];
    }
    [self zc_hiddenViewWithCGRect:rect];
}

- (void)zc_hiddenViewWithCGRect:(CGRect)rect {
    [UIView transitionWithView:self.superview
                      duration:0.25
                       options:UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionAllowAnimatedContent
                    animations:^{
                        self.frame = rect;
                        self.alpha = 0;
//                        self.backgroundColor = [UIColor clearColor];
                    } completion:^(BOOL finished) {
                        self.hidden = YES;
                    }];
}

@end
