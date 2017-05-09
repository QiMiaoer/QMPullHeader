//
//  QMHeaderViewController.m
//  顶部视图放大-Demo
//
//  Created by zyx on 17/3/31.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "QMHeaderViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
//@import AFNetworking;
#import <YYWebImage/YYWebImage.h>
#import "UIView+Category.h"

NSString *const CellId = @"cellid";
#define kHeaderHeight 200

@interface QMHeaderViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation QMHeaderViewController {
    UIView *_headerView;
    UIImageView *_imageView;
    UIView *_lineView;
    UIStatusBarStyle _statusBarStyle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self prepareTableView];
    [self prepareHeaderView];
    
    _statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return _statusBarStyle;
}

- (void)prepareHeaderView {
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kHeaderHeight)];
    _headerView.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0];
    
    [self.view addSubview:_headerView];
    
    _imageView = [[UIImageView alloc] initWithFrame:_headerView.bounds];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    
    [_headerView addSubview:_imageView];
    
    CGFloat lineHeight = 1 / [UIScreen mainScreen].scale;
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, kHeaderHeight - lineHeight, _headerView.fastWidth, lineHeight)];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    
    [_headerView addSubview:_lineView];
    
    NSURL *url = [NSURL URLWithString:@"http://www.who.int/entity/campaigns/immunization-week/2015/large-web-banner.jpg?ua=1"];
//    [imageView setImageWithURL:url];
    [_imageView yy_setImageWithURL:url options:YYWebImageOptionProgressive];
}

- (void)prepareTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellId];
    
    tableView.contentInset = UIEdgeInsetsMake(kHeaderHeight, 0, 0, 0);
    tableView.scrollIndicatorInsets = tableView.contentInset;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).description;
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y + scrollView.contentInset.top;
    NSLog(@"%f", offset);
    if (offset <= 0) {
        // 放大
        [_headerView fastSetY:0];
        [_headerView fastSetHeight:kHeaderHeight - offset];
    } else {
        // 整体移动
        [_headerView fastSetHeight:kHeaderHeight];
        // headerView 最小 y 值
        CGFloat minY = kHeaderHeight - 64;
        [_headerView fastSetY:-MIN(minY, offset)];
        // 设置透明度
        CGFloat progress = 1 - (offset / minY);
        _imageView.alpha = progress;
        // 修改状态栏
        _statusBarStyle = (progress < 0.5) ? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;
        // 主动更新状态栏
        [self.navigationController setNeedsStatusBarAppearanceUpdate];
    }
    [_imageView fastSetHeight:_headerView.fastHeight];
    [_lineView fastSetY:_headerView.fastHeight - _lineView.fastHeight];
}

@end
