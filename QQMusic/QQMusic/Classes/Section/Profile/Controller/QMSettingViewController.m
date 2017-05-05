//
//  QQSettingViewController.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/5.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QMSettingViewController.h"
#import "QMDrawerViewController.h"

@interface QMSettingViewController ()

@end

@implementation QMSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateHighlighted];
    backBtn.size = backBtn.currentImage.size;
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

- (void)back
{
     [[QMDrawerViewController sharedDrawerViewController] backToMainViewController];
}

@end
