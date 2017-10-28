//
//  ZCSpinnerView.m
//  CocoapodsLibrary
//
//  Created by 王志超 on 2017/10/18.
//  Copyright © 2017年 王志超. All rights reserved.
//

#import "ZCSpinnerView.h"

@interface ZCSpinnerView ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, assign) float maxHeight;
@property(nonatomic, assign) float cellHeight;
@property(nonatomic, assign) BOOL isCustomer;

@end

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]

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
        self.isShow = NO;
        
        self.maxHeight = maxFrame.size.height;
        self.cellHeight = cellHeight <= 0 ? 44 : cellHeight;
        self.isCustomer = !!cellObject;
        
        if(!self.tableView)
            [self addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
        [self initTableView:maxFrame cellObject:cellObject];
        [[UIApplication sharedApplication].delegate.window addSubview:self];
    }
    return self;
}

- (void)initTableView:(CGRect)frame cellObject:(NSObject *)cellObject {
    frame.size.height = 0;
    if(!self.tableView) {
        self.tableView = [[UITableView alloc] init];
        self.tableView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self addSubview:self.tableView];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.tableFooterView = [[UIView alloc] init];
        self.tableView.separatorColor = UIColorFromRGB(0xe3e4e5);
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
    }
    self.tableView.frame = frame;
    if([cellObject isKindOfClass:[NSString class]])
        [self.tableView registerClass:NSClassFromString((NSString *)cellObject) forCellReuseIdentifier:CellReuseIdentifier];
    else if([cellObject isKindOfClass:[UINib class]])
        [self.tableView registerNib:(UINib *)cellObject forCellReuseIdentifier:CellReuseIdentifier];
}

#pragma mark - Func
- (void)show {
    [self showForAnimat:YES];
}

- (void)showForAnimat:(BOOL)isAnimat {
    float height = self.cellHeight *self.dataSource.count;
    if(height > self.maxHeight) {
        height = self.maxHeight;
    }
    [self.tableView reloadData];
    
    CGRect tableRect = self.tableView.frame;
    tableRect.size.height = 0;
    self.tableView.frame = tableRect;
    self.isShow = YES;
    
    tableRect.size.height = height;
    [UIView animateWithDuration:isAnimat ? 0.25 : 0 animations:^{
        self.tableView.frame = tableRect;
    } completion:^(BOOL finished) {
    }];
}

- (void)hidden {
    CGRect selfRect = self.tableView.frame;
    selfRect.size.height = 0;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.tableView.frame = selfRect;
    } completion:^(BOOL finished) {
        self.isShow = NO;
    }];
}

- (BOOL)isShow {
    return !self.hidden;
}

- (void)setIsShow:(BOOL)_isShow {
    self.hidden = !_isShow;
}

#pragma mark - TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
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
        NSString *string = self.dataSource[indexPath.row];
        cell.textLabel.text = [string isKindOfClass:[NSString class]] ? string : nil;
    }
    if(self.cell)
        self.cell(cell, indexPath);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self hidden];
    
    if(self.selectEvent) {
        self.selectEvent([tableView cellForRowAtIndexPath:indexPath], indexPath);
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
