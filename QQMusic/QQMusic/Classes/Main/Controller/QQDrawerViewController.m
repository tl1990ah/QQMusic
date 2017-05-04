//
//  QQDrawerViewController.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/3.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QQDrawerViewController.h"
#import "QQProfileViewController.h"
#import "QQHomeViewController.h"

#define QQWidth [UIScreen mainScreen].bounds.size.width

@interface QQDrawerViewController ()
@property (nonatomic, assign) CGFloat drawerMaxWidth;
@property (nonatomic, strong) QQHomeViewController *mainViewController;
@property (nonatomic, strong) QQProfileViewController *leftViewController;
/** 打开左边控制器后添加的遮盖按钮 */
@property (nonatomic, strong) UIButton *coverButton;
@end

@implementation QQDrawerViewController

+ (instancetype)sharedDrawerViewController
{
    return (QQDrawerViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
}

+ (instancetype)drawerWithLeftViewController:(UIViewController *)leftVC mainViewController:(QQNavigationController *)mainNav andMaxLeftWidth:(CGFloat)leftWidth
{
    QQDrawerViewController *drawerVC = [[QQDrawerViewController alloc] init];
    drawerVC.drawerMaxWidth = leftWidth;
    drawerVC.mainViewController = mainNav.childViewControllers.firstObject;
    drawerVC.leftViewController = (QQProfileViewController *)leftVC;
    
    [drawerVC addChildViewController:leftVC];
    [drawerVC addChildViewController:mainNav];
    [drawerVC.view addSubview:mainNav.view];
    [drawerVC.view addSubview:leftVC.view];
    leftVC.view.transform = CGAffineTransformMakeTranslation(-QQWidth, 0);
    
    return drawerVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)openDrawerWithOpenDuration:(CGFloat)duration
{
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.mainViewController.view.transform = CGAffineTransformMakeTranslation(self.drawerMaxWidth, 0);
        self.leftViewController.view.transform = CGAffineTransformMakeTranslation(self.drawerMaxWidth - QQWidth, 0);
    } completion:^(BOOL finished) {
        
        [self.mainViewController.navigationController.view addSubview:self.coverButton];
    }];
}

- (void)closeDrawerWithCloseDuration:(CGFloat)duration
{
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.mainViewController.view.transform = CGAffineTransformIdentity;
        self.leftViewController.view.transform = CGAffineTransformMakeTranslation(-QQWidth, 0);
    } completion:^(BOOL finished) {
        
        if(self.coverButton){
            [self.coverButton removeFromSuperview];
            self.coverButton = nil;
        }
    }];
}

/**
 *  懒加载一个遮盖按钮
 */
- (UIButton *)coverButton
{
    if(!_coverButton){
        _coverButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _coverButton.frame = self.mainViewController.view.bounds;
        _coverButton.backgroundColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:0.7];
        [_coverButton addTarget:self.mainViewController action:@selector(closeDrawer) forControlEvents:UIControlEventTouchUpInside];
    }
    return _coverButton;
}




@end
