//
//  QQNavigationController.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/3.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QQNavigationController.h"

@interface QQNavigationController ()

@end

@implementation QQNavigationController

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
}

@end
