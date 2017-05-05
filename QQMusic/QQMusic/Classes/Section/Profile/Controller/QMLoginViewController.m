//
//  QQLoginViewController.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/5.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QMLoginViewController.h"

@interface QMLoginViewController ()

@end

@implementation QMLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavigationBar];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"singerPortraitDefaultBg"]];
    backgroundImageView.frame = self.view.bounds;
    [self.view addSubview:backgroundImageView];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"取消" target:self action:@selector(cancle)];
}

- (void)setupNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)cancle
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
