//
//  QQHomeViewController.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/3.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QMHomeViewController.h"
#import "QMDrawerViewController.h"

@interface QMHomeViewController ()

@end

@implementation QMHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupBatButtonItem];
    
    [self setupTitleView];
    
    
    UIView *toolBar = [[UIView alloc] init];
    toolBar.size = CGSizeMake(QQScreenW, 55);
    self.navigationController.toolbarHidden = NO;
    toolBar.backgroundColor = [UIColor redColor];
    [self.navigationController.toolbar addSubview:toolBar];
   
}

- (void)setupTitleView
{
    UIView *titleView = [[UIView alloc] init];
    titleView.size = CGSizeMake(240, 44);
    self.navigationItem.titleView = titleView;
    
    NSArray *titles = @[@"我的", @"音乐馆", @"发现"];
    NSUInteger count = titles.count;
    CGFloat btnW = titleView.width / count;
    for (int i = 0; i < count; i++) {
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [titleBtn.titleLabel sizeToFit];
        [titleView addSubview:titleBtn];
        titleBtn.y = 0;
        titleBtn.width = btnW;
        titleBtn.height = titleView.height;
        titleBtn.x = btnW * i;
    }
}

- (void)setupBatButtonItem
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"concise_icon_more_normal"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"concise_icon_more_highlight"] forState:UIControlStateHighlighted];
    leftBtn.size = leftBtn.currentImage.size;
    [leftBtn addTarget:self action:@selector(openDrawer) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"concise_icon_search_normal"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"concise_icon_search_highlight"] forState:UIControlStateHighlighted];
    rightBtn.size = rightBtn.currentImage.size;
    [rightBtn addTarget:self action:@selector(jumptoListen) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -30)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
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
    [[QMDrawerViewController sharedDrawerViewController] openDrawerWithOpenDuration:0.25];
}

- (void)closeDrawer
{
    [[QMDrawerViewController sharedDrawerViewController] closeDrawerWithCloseDuration:0.25];
}


@end
