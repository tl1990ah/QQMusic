//
//  QQProfileViewController.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/3.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QQProfileViewController.h"
#import "QQProfileHeaderView.h"

@interface QQProfileViewController ()

@end

@implementation QQProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupHeaderView];
}

- (void)setupHeaderView
{
    QQProfileHeaderView *headerView = [[QQProfileHeaderView alloc] initWithFrame:CGRectMake(QQScreenW - 300, 0, 300, 170)];
    headerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:headerView];
}


@end
