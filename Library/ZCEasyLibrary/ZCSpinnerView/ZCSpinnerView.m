//
//  ZCSpinnerView.m
//  CocoapodsLibrary
//
//  Created by zac on 2017/10/18.
//  Copyright © 2017年 love_iphone@qq.com. All rights reserved.
//

#import "ZCSpinnerView.h"
#import "UIColor+ZCSupp.h"

@interface ZCSpinnerView ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, assign) float maxHeight;
@property(nonatomic, assign) float cellHeight;
@property(nonatomic, assign) BOOL isCustomer;

@end

#define CellReuseIdentifier @"ZCSpinnerReuseIdentifier"

@implementation ZCSpinnerView

- (instancetype)initWithMaxFrame:(CGRect)maxFrame {
    return [self initWithMaxFrame:maxFrame cellHeight:0 cellObject:nil];
}

- (instancetype)initWithMaxFrame:(CGRect)maxFrame cellHeight:(int)cellHeight cellObject:(NSObject *)cellObject {
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        self.layer.masksToBounds = YES;
        self.zc_isShow = NO;
        
        self.maxHeight = maxFrame.size.height;
        self.cellHeight = cellHeight <= 0 ? 44 : cellHeight;
        self.isCustomer = !!cellObject;
        
        if(!self.zc_tableView)
            [self addTarget:self action:@selector(zc_hidden) forControlEvents:UIControlEventTouchUpInside];
        [self initTableView:maxFrame cellObject:cellObject];
        [[UIApplication sharedApplication].delegate.window addSubview:self];
    }
    return self;
}

- (void)initTableView:(CGRect)frame cellObject:(NSObject *)cellObject {
    frame.size.height = 0;
    if(!self.zc_tableView) {
        self.zc_tableView = [[UITableView alloc] init];
        self.zc_tableView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self addSubview:self.zc_tableView];
        
        self.zc_tableView.delegate = self;
        self.zc_tableView.dataSource = self;
        self.zc_tableView.tableFooterView = [[UIView alloc] init];
        self.zc_tableView.separatorColor = UIColorFromRGB(0xe3e4e5);
        self.zc_tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
    }
    self.zc_tableView.frame = frame;
    if([cellObject isKindOfClass:[NSString class]])
        [self.zc_tableView registerClass:NSClassFromString((NSString *)cellObject) forCellReuseIdentifier:CellReuseIdentifier];
    else if([cellObject isKindOfClass:[UINib class]])
        [self.zc_tableView registerNib:(UINib *)cellObject forCellReuseIdentifier:CellReuseIdentifier];
}

#pragma mark - Func
- (void)zc_show {
    [self showForAnimat:YES];
}

- (void)showForAnimat:(BOOL)isAnimat {
    float height = self.cellHeight *self.zc_dataSource.count;
    if(height > self.maxHeight) {
        height = self.maxHeight;
    }
    [self.zc_tableView reloadData];
    
    CGRect tableRect = self.zc_tableView.frame;
    tableRect.size.height = 0;
    self.zc_tableView.frame = tableRect;
    self.zc_isShow = YES;
    
    tableRect.size.height = height;
    [UIView animateWithDuration:isAnimat ? 0.25 : 0 animations:^{
        self.zc_tableView.frame = tableRect;
    } completion:^(BOOL finished) {
    }];
}

- (void)zc_hidden {
    CGRect selfRect = self.zc_tableView.frame;
    selfRect.size.height = 0;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.zc_tableView.frame = selfRect;
    } completion:^(BOOL finished) {
        self.zc_isShow = NO;
    }];
}

- (BOOL)zc_isShow {
    return !self.hidden;
}

- (void)setZc_isShow:(BOOL)_isShow {
    self.hidden = !_isShow;
}

#pragma mark - TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.zc_dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellReuseIdentifier];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.backgroundColor = [UIColor clearColor];
    }
    if(!self.isCustomer) {
        NSString *string = self.zc_dataSource[indexPath.row];
        cell.textLabel.text = [string isKindOfClass:[NSString class]] ? string : nil;
    }
    if(self.zc_cell)
        self.zc_cell(cell, indexPath);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self zc_hidden];
    
    if(self.zc_selectEvent) {
        NSString *title = nil;
        if(!self.isCustomer)
            title = [self.zc_tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        self.zc_selectEvent([tableView cellForRowAtIndexPath:indexPath], indexPath, title);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
