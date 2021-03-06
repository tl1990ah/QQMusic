//
//  QQDrawerViewController.m
//  QQMusic
//
//  Created by taolei-mac on 2017/5/3.
//  Copyright © 2017年 com.zhejiangchain.ios. All rights reserved.
//

#import "QMDrawerViewController.h"
#import "QMProfileViewController.h"
#import "QMHomeViewController.h"

@interface QMDrawerViewController ()
@property (nonatomic, assign) CGFloat drawerMaxWidth;
@property (nonatomic, strong) QMHomeViewController *homeViewController;
@property (nonatomic, strong) QMNavigationController *mainNav;
@property (nonatomic, strong) QMProfileViewController *leftViewController;
/** 打开左边控制器后添加的遮盖按钮 */
@property (nonatomic, strong) UIButton *coverButton;

/** 点击左边菜单后跳转的控制器*/
@property (nonatomic, strong) UIViewController *destViewController;
@end

@implementation QMDrawerViewController

+ (instancetype)sharedDrawerViewController
{
    return (QMDrawerViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
}

+ (instancetype)drawerWithLeftViewController:(UIViewController *)leftVC mainViewController:(QMNavigationController *)mainNav andMaxLeftWidth:(CGFloat)leftWidth
{
    QMDrawerViewController *drawerVC = [[QMDrawerViewController alloc] init];
    drawerVC.drawerMaxWidth = leftWidth;
    drawerVC.homeViewController = mainNav.childViewControllers.firstObject;
    drawerVC.leftViewController = (QMProfileViewController *)leftVC;
    drawerVC.mainNav = mainNav;
    
    [drawerVC addChildViewController:leftVC];
    [drawerVC addChildViewController:mainNav];
    [drawerVC.view addSubview:mainNav.view];
    [drawerVC.view addSubview:leftVC.view];
    leftVC.view.transform = CGAffineTransformMakeTranslation(-QQScreenW, 0);
    
    [drawerVC addPanGestureToLeftView:drawerVC.leftViewController.view];
    [drawerVC addScreenEdgePanGestureToView:drawerVC.leftViewController.view];
    [drawerVC addScreenEdgePanGestureToView:drawerVC.homeViewController.view];
    
    return drawerVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)switchViewController:(UIViewController *)viewController
{
    self.view.userInteractionEnabled = NO;
    [self.view addSubview:viewController.view];
    [self addChildViewController:viewController];
    self.destViewController = viewController;
    viewController.view.transform = CGAffineTransformMakeTranslation(QQScreenW, 0);
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        viewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        self.view.userInteractionEnabled = YES;
    }];

}

- (void)backToMainViewController
{
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.destViewController.view.transform = CGAffineTransformMakeTranslation(QQScreenW, 0);
    } completion:^(BOOL finished) {
        
        [self.destViewController removeFromParentViewController];
        [self.destViewController.view removeFromSuperview];
        self.destViewController.view = nil;
        self.destViewController = nil;
    }];
}


- (void)openDrawerWithOpenDuration:(CGFloat)duration
{
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.mainNav.view.transform = CGAffineTransformMakeTranslation(self.drawerMaxWidth, 0);
        self.leftViewController.view.transform = CGAffineTransformMakeTranslation(self.drawerMaxWidth - QQScreenW, 0);
    } completion:^(BOOL finished) {
        
        [self.homeViewController.navigationController.view addSubview:self.coverButton];
        [self addPanGestureToLeftView:self.coverButton];
    }];
}

- (void)closeDrawerWithCloseDuration:(CGFloat)duration
{
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.mainNav.view.transform = CGAffineTransformIdentity;
        self.leftViewController.view.transform = CGAffineTransformMakeTranslation(-QQScreenW, 0);
    } completion:^(BOOL finished) {
        
        if(self.coverButton){
            [self.coverButton removeFromSuperview];
            self.coverButton = nil;
        }
    }];
}

/**
 *  创建边缘拖拽手势
 */
- (void)addScreenEdgePanGestureToView:(UIView *)view
{
    UIScreenEdgePanGestureRecognizer *pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgePanGestureRecognizer:)];
    pan.edges = UIRectEdgeLeft;
    [view addGestureRecognizer:pan];
}

/**
 *  边缘拖拽手势的回调
 */
- (void)screenEdgePanGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)pan
{
    CGFloat offsetX = [pan translationInView:pan.view].x;
    if(pan.state == UIGestureRecognizerStateFailed || pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded){
    
        if(offsetX >= QQScreenW * 0.5){
            [self openDrawerWithOpenDuration:0.15];
        }else{
            [self closeDrawerWithCloseDuration:0.15];
        }
    }else if (pan.state == UIGestureRecognizerStateChanged){
        if(offsetX >0 && offsetX <= self.drawerMaxWidth){
            self.mainNav.view.transform = CGAffineTransformMakeTranslation(offsetX, 0);
            self.leftViewController.view.transform = CGAffineTransformMakeTranslation(-(QQScreenW - offsetX), 0);
        }
    }
}

/**
 *  给遮盖按钮增加拖拽手势
 */
- (void)addPanGestureToLeftView:(UIView *)view
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    [view addGestureRecognizer:pan];
}

/**
 *  遮盖按钮拖拽手势的回调
 */
- (void)panGestureRecognizer:(UIPanGestureRecognizer *)pan
{
    CGFloat offsetX = [pan translationInView:pan.view].x;
    if(pan.state == UIGestureRecognizerStateFailed || pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded){
        
        if(QQScreenW - ABS(offsetX) >= QQScreenW * 0.5){
            [self openDrawerWithOpenDuration:0.15];
        }else{
            [self closeDrawerWithCloseDuration:0.15];
        }
    }else if (pan.state == UIGestureRecognizerStateChanged){
        if(offsetX < 0 && ABS(offsetX) >= (QQScreenW - self.drawerMaxWidth)){
            self.mainNav.view.transform = CGAffineTransformMakeTranslation(QQScreenW - ABS(offsetX), 0);
            self.leftViewController.view.transform = CGAffineTransformMakeTranslation(offsetX, 0);
        }
    }
}

/**
 *  懒加载一个遮盖按钮
 */
- (UIButton *)coverButton
{
    if(!_coverButton){
        _coverButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _coverButton.frame = self.homeViewController.view.bounds;
        _coverButton.backgroundColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:0.3];
        [_coverButton addTarget:self.homeViewController action:@selector(closeDrawer) forControlEvents:UIControlEventTouchUpInside];
    }
    return _coverButton;
}


@end
