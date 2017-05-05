//
//  QQNavigationController.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/3.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QMNavigationController.h"

@interface QMNavigationController ()

@end

@implementation QMNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

+ (void)initialize
{
    [self setupNavigationBarTheme];
}

+ (void)setupNavigationBarTheme
{
    UINavigationBar *apperance = [UINavigationBar appearance];
    apperance.barTintColor = [UIColor colorWithRed:118/255.0 green:199/255.0 blue:148/255.0 alpha:1.0];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [apperance setTitleTextAttributes:textAttrs];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateHighlighted];
        backBtn.size = backBtn.currentImage.size;
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
