//
//  QQHomeViewController.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/3.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QQHomeViewController.h"
#import "QQDrawerViewController.h"

@interface QQHomeViewController ()

@end

@implementation QQHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"concise_icon_more_normal" highImageName:@"concise_icon_more_highlight" target:self action:@selector(openDrawer)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"concise_icon_search_normal" highImageName:@"concise_icon_search_highlight" target:self action:@selector(jumptoListen)];
   
}

- (void)jumptoListen
{
    UIViewController *destVC = [[UIViewController alloc] init];
    destVC.view.backgroundColor = [UIColor whiteColor];
    destVC.navigationItem.title = @"听歌识曲";
    [self.navigationController pushViewController:destVC animated:YES];
}

- (void)openDrawer
{
    [[QQDrawerViewController sharedDrawerViewController] openDrawerWithOpenDuration:0.25];
}

- (void)closeDrawer
{
    [[QQDrawerViewController sharedDrawerViewController] closeDrawerWithCloseDuration:0.25];
}


@end
