//
//  ViewController.m
//  顶部视图放大-Demo
//
//  Created by zyx on 17/3/31.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "ViewController.h"

#import "QMHeaderViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (IBAction)rightItemAction:(id)sender {
    QMHeaderViewController *vc = [[QMHeaderViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
